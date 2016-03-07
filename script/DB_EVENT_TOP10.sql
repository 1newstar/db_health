SELECT
  --ÿ�鰴time_waited�����ţ�ȥ��ÿ�������ظ���ֵ��ֻ������һ�е�ֵ
  CASE
    WHEN dense_rank() over(partition BY inst_id, snap_id, begin_snap, end_snap order by time_waited DESC) = 1
    THEN q'{<div class='eventbegin'>}'
      ||inst_id
      ||'</div>'
      ||'<a name='
      ||snap_id
      ||'></a>'
  END "Inst Num",
  CASE
    WHEN dense_rank() over(partition BY inst_id, snap_id, begin_snap, end_snap order by time_waited DESC) = 1
    THEN q'{<div class='eventbegin'>}'
      ||begin_snap
      ||'</div>'
  END "Begin Snap",
  CASE
    WHEN dense_rank() over(partition BY inst_id, snap_id, begin_snap, end_snap order by time_waited DESC) = 1
    THEN q'{<div class='eventbegin'>}'
      ||end_snap
      ||'</div>'
  END "End Snap",
  --snap_id,
  event_name "Event",
  --db_time,
  inerval_total_waits "Waits",
  time_waited "Total Wait Time (sec)",
  ROUND((time_waited / inerval_total_waits) * 1000) "Wait Avg(ms)",
  ROUND((time_waited / db_time) * 100, 2) "% DB time",
  SUBSTR(wait_class, 1, 15) "Wait Class"
FROM
  (SELECT inst_id,
    snap_id,
    begin_snap,
    end_snap,
    event_name,
    wait_class,
    inerval_total_waits,
    time_waited,
    --ÿ�鰴time_waited���򣬲����
    row_number() over(partition BY inst_id, snap_id order by time_waited DESC) wait_rank,
    --��db_time�а�ÿ����Ψһͳ�Ƴ�����DB TIMEֵ������ڱ�������
    MAX(db_time) over(partition BY inst_id, snap_id) db_time
  FROM
    (SELECT inst_id,
      snap_id,
      TO_CHAR(begin_snap, 'DD-MM-YY hh24:mi:ss') begin_snap,
      TO_CHAR(end_snap, 'hh24:mi:ss') end_snap,
      event_name,
      wait_class,
      inerval_total_waits,
      time_waited,
      --ͳ��DB time��������ֵ��䵽db_time�У�������һ��ȫ�����
      CASE
        WHEN event_name = 'DB time'
        THEN time_waited
      END db_time
    FROM
      (SELECT s.startup_time,
        s.instance_number inst_id,
        s.snap_id,
        s.begin_interval_time begin_snap,
        s.end_interval_time end_snap,
        event_name,
        wait_class,
        total_waits,
        lag(total_waits, 1, NULL) over(partition BY s.startup_time, s.instance_number, stats.event_name order by s.snap_id) lagwaits,
        --ʹ��lag�������õ�ǰ���յ�ֵ��ȥ��һ�����յ�ֵ����һ���������null���������snap_id > min_snap_id�������ų���һ�����ն�Ӧ�У���Ϣ�����ã�
        total_waits - lag(total_waits, 1, NULL) over(partition BY s.startup_time, s.instance_number, stats.event_name order by s.snap_id) inerval_total_waits,
        --ͬ����ʽ����ȴ�ʱ��
        time_waited - lag(time_waited, 1, NULL) over(partition BY s.startup_time, s.instance_number, stats.event_name order by s.snap_id) time_waited,
        --ѡ����С�Ŀ���id�������ų�
        MIN(s.snap_id) over(partition BY s.startup_time, s.instance_number, stats.event_name) min_snap_id
      FROM
        --���ȴ��¼���ϵͳͳ����Ϣ�ں�
        (
        SELECT dbid,
          instance_number,
          snap_id,
          event_name,
          wait_class,
          total_waits_fg total_waits,
          ROUND(time_waited_micro_fg / 1000000, 2) time_waited
        FROM dba_hist_system_event
        WHERE wait_class NOT IN ('Idle')
        -- and event_name = 'db file sequential read'
        UNION ALL
        SELECT dbid,
          instance_number,
          snap_id,
          stat_name event_name,
          NULL wait_class,
          NULL total_waits,
          ROUND(value / 1000000, 2) time_waited
        FROM dba_hist_sys_time_model
        WHERE stat_name IN ('DB CPU', 'DB time')
        ) stats,
        dba_hist_snapshot s
      WHERE stats.instance_number = s.instance_number
      AND stats.snap_id           = s.snap_id
      AND stats.dbid              = s.dbid
      AND s.dbid                  =
        (SELECT dbid FROM v$database
        )
      AND s.instance_number =
        (SELECT instance_number FROM v$instance
        )
        --���г�ǰһ�쵽���ڵ����ݣ���ǰһ��00��00��00��ʼ��ע����һ������Ҫѡ2��ǰ��23��00�Ŀ��գ�����ʱ���ǵ�ǰ00:00:00����(�������)��ȥ25Сʱ
      AND to_date(TO_CHAR(s.begin_interval_time, 'yyyy/mm/dd hh24'), 'yyyy/mm/dd hh24') >= TRUNC(sysdate) - 25 / 24
      ORDER BY s.snap_id
      )
      --�ų���һ������
    WHERE snap_id > min_snap_id
      --��ֹ����ƽ���ȴ�ʱ��ʱ��ĸΪ0
    AND NVL(inerval_total_waits, 1) > 0
    )
  )
  --<=11����Ϊ�ų���DB time����ʹ��row_number�����ŵ�ʱ���а���DB time������TOP10��Ҫ��<=11
WHERE wait_rank <= 11
AND event_name  != 'DB time'
ORDER BY inst_id,
  snap_id;

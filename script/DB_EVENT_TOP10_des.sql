SELECT
  --每组按time_waited排序编号，去除每组中列重复的值，只保留第一列的值
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
    --每组按time_waited排序，并编号
    row_number() over(partition BY inst_id, snap_id order by time_waited DESC) wait_rank,
    --将db_time列按每组中唯一统计出来的DB TIME值填充用于比例计算
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
      --统计DB time，并将该值填充到db_time列，用于下一步全部填充
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
        --使用lag函数，用当前快照的值减去上一个快照的值，第一个快照填充null，下面会用snap_id > min_snap_id的条件排除第一个快照对应行（信息已无用）
        total_waits - lag(total_waits, 1, NULL) over(partition BY s.startup_time, s.instance_number, stats.event_name order by s.snap_id) inerval_total_waits,
        --同样方式计算等待时间
        time_waited - lag(time_waited, 1, NULL) over(partition BY s.startup_time, s.instance_number, stats.event_name order by s.snap_id) time_waited,
        --选出最小的快照id，用于排除
        MIN(s.snap_id) over(partition BY s.startup_time, s.instance_number, stats.event_name) min_snap_id
      FROM
        --将等待事件与系统统计信息融合
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
        --仅列出前一天到现在的数据，从前一天00：00：00开始，注定第一个快照要选2天前的23：00的快照，所以时间是当前00:00:00日期(零点日期)减去25小时
      AND to_date(TO_CHAR(s.begin_interval_time, 'yyyy/mm/dd hh24'), 'yyyy/mm/dd hh24') >= TRUNC(sysdate) - 25 / 24
      ORDER BY s.snap_id
      )
      --排除第一个快照
    WHERE snap_id > min_snap_id
      --防止计算平均等待时间时分母为0
    AND NVL(inerval_total_waits, 1) > 0
    )
  )
  --<=11是因为排除了DB time，但使用row_number排序编号的时候尚包括DB time，所以TOP10就要用<=11
WHERE wait_rank <= 11
AND event_name  != 'DB time'
ORDER BY inst_id,
  snap_id;

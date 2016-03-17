SELECT s.snap_date,
  DECODE(s.redosize, NULL, '--shutdown or end--', s.currtime) "TIME",
  ROUND(redosize        / 1024 / 1024 / 1024, 2) "redo(GB)",
  ROUND((logicalreads   * 8) / 1024 / 1024, 2) "session logical reads(GB)",
  ROUND((physicalreads  * 8) / 1024 / 1024, 2) "physical reads(GB)",
  ROUND((physicalwrites * 8) / 1024 / 1024, 2) "physical writes(GB)",
  totalparses "parse count (total)",
  hardparses "parse count (hard)",
  usercommits "user commits",
  TO_CHAR(ROUND(s.seconds / 60, 2)) "elapse(min)",
  ROUND(t.db_time         / 1000000 / 60, 2) "DB time(min)",
  ROUND(t.db_cpu          / 1000000 / 60, 2) "DB cpu(min)",
  ROUND(100               * t.db_cpu / t.db_time, 2) "cpu pct to time%",
  q'{<a href="#}'
  || s.endsnap_id
  || q'{">}'
  || s.endsnap_id
  || q'{</a>}' endsnap_id
FROM
  (SELECT curr_redo  - last_redo redosize,
    curr_lgreads     - last_lgreads logicalreads,
    curr_phyreads    - last_phyreads physicalreads,
    curr_phywrites   - last_phywrites physicalwrites,
    curr_totalparse  - last_totalparse totalparses,
    curr_hardparse   - last_hardparse hardparses,
    curr_commits     - last_commits usercommits,
    TO_CHAR(currtime - numtodsinterval(ROUND(((currtime + 0) - (lasttime + 0)) * 3600 * 24, 0), 'second'), 'yyyy/mm/dd') snap_date,
    TO_CHAR(currtime - numtodsinterval(ROUND(((currtime + 0) - (lasttime + 0)) * 3600 * 24, 0), 'second'), 'hh24:mi') currtime,
    ROUND(((currtime + 0) - (lasttime + 0)) * 3600 * 24, 0) seconds,
    currsnap_id endsnap_id
  FROM
    (SELECT a.redo last_redo,
      a.lgreads last_lgreads,
      a.phyreads last_phyreads,
      a.phywrites last_phywrites,
      a.totalparse last_totalparse,
      a.hardparse last_hardparse,
      a.commits last_commits,
      lead(a.redo, 1, NULL) over(partition BY b.startup_time order by b.end_interval_time) curr_redo,
      lead(a.lgreads, 1, NULL) over(partition BY b.startup_time order by b.end_interval_time) curr_lgreads,
      lead(a.phyreads, 1, NULL) over(partition BY b.startup_time order by b.end_interval_time) curr_phyreads,
      lead(a.phywrites, 1, NULL) over(partition BY b.startup_time order by b.end_interval_time) curr_phywrites,
      lead(a.totalparse, 1, NULL) over(partition BY b.startup_time order by b.end_interval_time) curr_totalparse,
      lead(a.hardparse, 1, NULL) over(partition BY b.startup_time order by b.end_interval_time) curr_hardparse,
      lead(a.commits, 1, NULL) over(partition BY b.startup_time order by b.end_interval_time) curr_commits,
      lead(b.end_interval_time, 1, NULL) over(partition BY b.startup_time order by b.end_interval_time) currtime,
      lead(b.snap_id, 1, NULL) over(partition BY b.startup_time order by b.end_interval_time) currsnap_id,
      b.end_interval_time lasttime
    FROM
      (SELECT dhs.snap_id,
        dhs.dbid,
        dhs.instance_number,
        SUM(DECODE(stat_name, 'redo size', value, 0)) redo,
        SUM(DECODE(stat_name, 'session logical reads', value, 0)) lgreads,
        SUM(DECODE(stat_name, 'physical reads', value, 0)) phyreads,
        SUM(DECODE(stat_name, 'physical writes', value, 0)) phywrites,
        SUM(DECODE(stat_name, 'parse count (total)', value, 0)) totalparse,
        SUM(DECODE(stat_name, 'parse count (hard)', value, 0)) hardparse,
        SUM(DECODE(stat_name, 'user commits', value, 0)) commits
      FROM dba_hist_sysstat dhs,
        v$instance i
      WHERE dhs.stat_name    IN ('redo size', 'session logical reads', 'physical reads', 'physical writes', 'parse count (total)', 'parse count (hard)', 'user commits')
      AND dhs.instance_number = i.INSTANCE_NUMBER
      GROUP BY dhs.snap_id,
        dhs.dbid,
        dhs.instance_number
      ) a,
      dba_hist_snapshot b
    WHERE a.snap_id       = b.snap_id
    AND a.dbid            = b.dbid
    AND a.instance_number = b.instance_number
    ORDER BY end_interval_time
    )
  ) s,
  (WITH dbtime AS
  (SELECT lead(a.value, 1, NULL) over(partition BY b.startup_time order by b.end_interval_time) - a.value db_time,
    lead(b.snap_id, 1, NULL) over(partition BY b.startup_time order by b.end_interval_time) endsnap_id
  FROM dba_hist_sys_time_model a,
    dba_hist_snapshot b,
    v$instance c
  WHERE a.snap_id       = b.snap_id
  AND a.dbid            = b.dbid
  AND a.instance_number = b.instance_number
  AND b.instance_number = c.INSTANCE_NUMBER
  AND a.stat_name       = 'DB time'
  ),
  dbcpu AS
  (SELECT lead(a.value, 1, NULL) over(partition BY b.startup_time order by b.end_interval_time) - a.value db_cpu,
    lead(b.snap_id, 1, NULL) over(partition BY b.startup_time order by b.end_interval_time) endsnap_id
  FROM dba_hist_sys_time_model a,
    dba_hist_snapshot b,
    v$instance c
  WHERE a.snap_id       = b.snap_id
  AND a.dbid            = b.dbid
  AND a.instance_number = b.instance_number
  AND b.instance_number = c.INSTANCE_NUMBER
  AND a.stat_name       = 'DB CPU'
  )
SELECT DB_TIME,
  DB_CPU,
  dbtime.endsnap_id
FROM dbtime,
  dbcpu
WHERE dbtime.endsnap_id = dbcpu.endsnap_id
  ) t
WHERE s.endsnap_id                      = t.endsnap_id
AND to_date(s.snap_date, 'yyyy/mm/dd') >= TRUNC(sysdate) - 2
ORDER BY s.snap_date,
  TIME;

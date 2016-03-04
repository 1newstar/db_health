with redo as
 (select a.snap_id,
         a.stat_name,
         b.end_interval_time,
         a.value,
         lead(a.value, 1, null) over(order by a.snap_id) nextvalue,
         to_char(end_interval_time, 'HH24') time24
    from dba_hist_sysstat a, dba_hist_snapshot b
   where a.snap_id = b.snap_id
     and stat_name = 'redo size'
     and to_char(end_interval_time, 'HH24') = '00'
     and end_interval_time >= trunc(sysdate) - 1
     and b.instance_number = (select instance_number from v$instance)
     and a.instance_number = b.instance_number)
select stat_name as "Statname",
       trunc(end_interval_time) "Date",
       round((nextvalue - value) / 1024 / 1024 / 1024, 2) as "Total Redo Size(GB)"
  from redo
 where nextvalue is not null;

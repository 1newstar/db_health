 select owner,
        round(sum(bytes) / 1024 / 1204 / 1024, 2) "Total Schema Size(GB)"
   from dba_segments
  group by owner
 having round(sum(bytes) / 1024 / 1204 / 1024, 2) > 0
  order by 2 desc;
 select owner,
        count(*) "Total Count",
        round(sum(space) * 8 / 1024 / 1024, 2) "Total Size(GB)"
   from dba_recyclebin
  group by owner
  order by 3 desc;
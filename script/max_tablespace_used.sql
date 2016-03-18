
 select dtu.tablespace_name,
        round((dtu.used_space * &blocksize )/ 1024 / 1024 / 1024) as "Used(GB)",
        round((dtu.tablespace_size * &blocksize) / 1024 / 1024 / 1024) as "Total(GB)",
        round(dtu.used_percent, 2) as "Used Pct of Max%"
   from dba_tablespace_usage_metrics dtu
   order by 4 desc;

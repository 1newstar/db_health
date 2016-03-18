
select dtu.tablespace_name,
       round((dtu.used_space * &blocksize) / 1024 / 1024 / 1024) as "Used(GB)",
       round((dtu.tablespace_size * &blocksize) / 1024 / 1024 / 1024) as "Total(GB)",
       case
         when round(dtu.used_percent, 2) > 70 then
          '<font color=red>' || round(dtu.used_percent, 2) || '</font>'
         else
          to_char(round(dtu.used_percent, 2))
       end as "Used Pct of Max%"
  from (select * from dba_tablespace_usage_metrics order by 4 desc) dtu;

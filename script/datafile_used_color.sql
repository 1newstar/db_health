select tablespace_name,
       file_name,
       file_id,
       relative_fno,
       AUTOEXTENSIBLE,
       "MAX(GB)",
       "TOTAL(GB)",
       "USED(GB)",
       "FREE(GB)",
       "USED%",
       "FREE%",
       case
         when "Used Pct of Max%" > 70 then
          '<font color=red>' || "Used Pct of Max%" || '</font>'
         else
          to_char("Used Pct of Max%")
       end "Used Pct of Max%",
       status
  from (select a.tablespace_name,
               a.file_name,
               a.file_id,
               a.relative_fno,
               a.AUTOEXTENSIBLE,
               ROUND(a.MAXBYTES / 1024 / 1024 / 1024, 2) "MAX(GB)",
               ROUND(a.bytes / 1024 / 1024 / 1024, 2) "TOTAL(GB)",
               round((a.bytes / 1024 / 1024 / 1024) -
                     (b.sb / 1024 / 1024 / 1024),
                     2) "USED(GB)",
               round(b.sb / 1024 / 1024 / 1024, 2) "FREE(GB)",
               round(100 - (100 * b.sb / a.bytes), 2) "USED%",
               round(100 * b.sb / a.bytes, 2) "FREE%",
               round(100 * (a.bytes - b.sb) /
                     decode(a.MAXBYTES, 0, a.bytes, a.MAXBYTES),
                     2) "Used Pct of Max%",
               a.status
          from dba_data_files a,
               (select file_id, sum(BYTES) sb
                  from dba_free_space
                 group by file_id) b
         where a.file_id = b.file_id
         order by 12 desc);
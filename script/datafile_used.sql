select a.tablespace_name,                                                                                                                                                                                                 
       a.file_name,                                                                                                                                                                                                       
       a.file_id,
       a.relative_fno,                                                                                                                                                                                                    
       a.AUTOEXTENSIBLE,
       a.MAXBYTES,                                                                                                                                                                                                        
       a.bytes / 1024 / 1024 "TOTAL(MB)",
       round((a.bytes / 1024 / 1024) - (b.sb / 1024 / 1024), 2) "USED(MB)",                                                                                                                                               
       round(b.sb / 1024 / 1024, 2) "FREE(MB)",
       round(100 - (100 * b.sb / a.bytes), 2) "USED%",                                                                                                                                                                    
       round(100 * b.sb / a.bytes, 2) "FREE%",
       a.status                                                                                                                                                                                                           
  from dba_data_files a,
       (select file_id, sum(BYTES) sb from dba_free_space group by file_id) b                                                                                                                                             
 where a.file_id = b.file_id                                                                                                                                                                                              
 order by a.file_name;

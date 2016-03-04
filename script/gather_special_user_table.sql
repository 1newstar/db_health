select trunc(last_analyzed) "DATE",count(*) total_table                                                                                                                                                                   
  from dba_tables
 where owner in ('PERF_CENTER','PERF_BROKER')                                                                                                                                                                             
 AND last_analyzed IS NOT NULL
 group by trunc(last_analyzed)                                                                                                                                                                                            
 order by trunc(last_analyzed) desc;

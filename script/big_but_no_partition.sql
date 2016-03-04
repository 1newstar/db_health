select owner, segment_name, segment_type, sum(bytes) / 1024 / 1024 size_mb                                                                                                                                                
  from dba_segments                                                                                                                                                                                                       
 where owner not in ('SYS', 'SYSTEM')                                                                                                                                                                                     
   and segment_type not like '%PARTITION%'                                                                                                                                                                                
 group by owner, segment_name, segment_type                                                                                                                                                                               
having sum(bytes) / 1024 / 1024 > 2048                                                                                                                                                                                    
order by 4 desc;

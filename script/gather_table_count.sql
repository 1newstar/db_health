select to_char(last_analyzed, 'yyyymm') "DATE", count(*)                                                                                                                                                                  
  from dba_tables                                                                                                                                                                                                         
 group by to_char(last_analyzed, 'yyyymm')                                                                                                                                                                                
 order by to_number(to_char(last_analyzed, 'yyyymm')) desc nulls last;

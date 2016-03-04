@@script/Pa "Rman Backup"                                                                                                                                                                                                          
@@script/H1 "Rman Backup"
spool off                                                                                                                                                                                                                 
set markup html off spool off
HOST sh script/ul.sh "Back History" >>&script_base/report_&today_file..html                                                                                                                                               
spool &script_base/report_&today_file..html append
set markup html on spool on                                                                                                                                                                                               
@@script/To_Top
                                                                                                                                                                                                                          
@@script/Pa "Back History"
@@script/H3 "Back History"                                                                                                                                                                                                
@@script/rman_history.sql
@@script/To_Link "Rman Backup"   

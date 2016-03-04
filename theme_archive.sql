@@script/Pa Archive                                                                                                                                                                                                       
@@script/H1 Archive                                                                                                                                                                                                       
spool off
set markup html off spool off                                                                                                                                                                                             
HOST sh script/ul.sh "Archive Rate"  >>&script_base/report_&today_file..html
spool &script_base/report_&today_file..html append                                                                                                                                                                        
set markup html on spool on
@@script/To_Top                                                                                                                                                                                                           

@@script/Pa "Archive Rate"                                                                                                                                                                                                
@@script/H3 "Archive Rate"
@@script/archive_rate.sql                                                                                                                                                                                                 
@@script/To_Link Archive

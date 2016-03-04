@@script/Pa Security
@@script/H1 Security                                                                                                                                                                                                      
spool off
set markup html off spool off                                                                                                                                                                                             
HOST sh script/ul.sh "User Privileges" "Who Is DBA" >>&script_base/report_&today_file..html
spool &script_base/report_&today_file..html append                                                                                                                                                                        
set markup html on spool on
@@script/To_Top                                                                                                                                                                                                           

@@script/Pa "User Privileges"                                                                                                                                                                                             
@@script/H3 "User Privileges"
@@script/user_privilege.sql                                                                                                                                                                                               
@@script/To_Link Security
                                                                                                                                                                                                                          
@@script/Pa "Who Is DBA"
@@script/H3 "Who Is DBA"                                                                                                                                                                                                  
@@script/who_is_dba.sql
@@script/To_Link Security   

@@script/Pa Statistics
@@script/H1 Statistics                                                                                                                                                                                                    
spool off
set markup html off spool off                                                                                                                                                                                             
HOST sh script/ul.sh "Autotask Client Status" "Auto Job History" "Gather Tables count" "Gather Special User Tables Count" >>&script_base/report_&today_file..html
spool &script_base/report_&today_file..html append                                                                                                                                                                        
set markup html on spool on
@@script/To_Top                                                                                                                                                                                                           

@@script/Pa "Autotask Client Status"                                                                                                                                                                                      
@@script/H3 "Autotask Client Status"
@@script/autotask_client.sql                                                                                                                                                                                              
@@script/To_Link Statistics
                                                                                                                                                                                                                          
@@script/Pa "Auto Job History"
@@script/H3 "Auto Job History"                                                                                                                                                                                            
@@script/auto_job_histrory.sql
@@script/To_Link Statistics                                                                                                                                                                                               

@@script/Pa "Gather Tables count"                                                                                                                                                                                         
@@script/H3 "Gather Tables count"
@@script/gather_table_count.sql                                                                                                                                                                                           
@@script/To_Link Statistics
                                                                                                                                                                                                                          
@@script/Pa "Gather Special User Tables Count"
@@script/H3 "Gather Special User Tables Count"                                                                                                                                                                            
@@script/gather_special_user_table.sql
@@script/To_Link Statistics

@@script/Pa FlashBack
@@script/H1 FlashBack
spool off                                                                                                                                                                                                                 
set markup html off spool off
HOST sh script/ul.sh "Supplemental Log" "Recover Area" "Flashback Stat" >>&script_base/report_&today_file..html                                                                                                                                                  
spool &script_base/report_&today_file..html append
set markup html on spool on                                                                                                                                                                                               
@@script/To_Top                                                                                                                                                                                                           

@@script/Pa "Supplemental Log"                                                                                                                                                    
@@script/H3 "Supplemental Log"
@@script/supplemental_log.sql                                                                                                                                                                                            
@@script/To_Link FlashBack
                                                                                                                                                                                                                          
@@script/Pa "Recover Area"
@@script/H3 "Recover Area"                                                                                                                                                                                                
@@script/recover_area_size.sql
@@script/To_Link FlashBack

@@script/Pa "Flashback Stat"
@@script/H3 "Flashback Stat"                                                                                                                                                                                              
@@script/flashback_database_stat.sql
@@script/To_Link FlashBack

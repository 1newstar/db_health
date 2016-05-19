-- ********************************************************************
-- * Copyright Notice   : (c)2015,2016 Peng Liu.
-- * Filename           : theme_flashback.sql
-- * Author             : Peng Liu
-- * Original           : 20151117
-- * Last Update        : 20160519
-- * Description        : Theme about Flashback
-- *                      "Supplemental Log" "Recover Area" "Flashback Stat"
-- *                      ...
-- * Usage              : be called by db_health_check.sql
-- ********************************************************************

@@script/Pa FlashBack
@@script/H1 FlashBack
spool off                                                                                                                                                                                                                 
set markup html off spool off
HOST sh script/ul.sh "Supplemental Log" "Recover Area" "Flashback Stat" >>&report_file                                                                                                                                                  
spool &report_file append
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

-- ********************************************************************
-- * Copyright Notice   : (c)2015,2016 Peng Liu.
-- * Filename           : theme_flashback.sql
-- * Author             : Peng Liu
-- * Original           : 20151117
-- * Last Update        : 20160520
-- * Description        : Theme about Flashback
-- *                      "Supplemental Log" "Recover Area" "Flashback Stat"
-- *                      ...
-- * Usage              : be called by db_health_check.sql
-- ********************************************************************

@@script/tag/Pa FlashBack
@@script/tag/H1 FlashBack
spool off                                                                                                                                                                                                                 
set markup html off spool off
HOST sh script/ul.sh "Supplemental Log" "Recover Area" "Flashback Stat" >>&report_file                                                                                                                                                  
spool &report_file append
set markup html on spool on                                                                                                                                                                                               
@@script/tag/To_Top                                                                                                                                                                                                           

@@script/tag/Pa "Supplemental Log"                                                                                                                                                    
@@script/tag/H3 "Supplemental Log"
@@script/supplemental_log.sql                                                                                                                                                                                            
@@script/tag/To_Link FlashBack
                                                                                                                                                                                                                          
@@script/tag/Pa "Recover Area"
@@script/tag/H3 "Recover Area"                                                                                                                                                                                                
@@script/recover_area_size.sql
@@script/tag/To_Link FlashBack

@@script/tag/Pa "Flashback Stat"
@@script/tag/H3 "Flashback Stat"                                                                                                                                                                                              
@@script/flashback_database_stat.sql
@@script/tag/To_Link FlashBack

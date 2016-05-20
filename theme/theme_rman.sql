-- ********************************************************************
-- * Copyright Notice   : (c)2015,2016 Peng Liu.
-- * Filename           : theme_rman.sql
-- * Author             : Peng Liu
-- * Original           : 20151117
-- * Last Update        : 20160520
-- * Description        : Theme about Rman
-- *                      "Back History"
-- *                      ...
-- * Usage              : be called by db_health_check.sql
-- ********************************************************************

@@script/tag/Pa "Rman Backup"                                                                                                                                                                                                          
@@script/tag/H1 "Rman Backup"
spool off                                                                                                                                                                                                                 
set markup html off spool off
HOST sh script/ul.sh "Back History" >>&report_file                                                                                                                                               
spool &report_file append
set markup html on spool on                                                                                                                                                                                               
@@script/tag/To_Top
                                                                                                                                                                                                                          
@@script/tag/Pa "Back History"
@@script/tag/H3 "Back History"                                                                                                                                                                                                
@@script/rman_history.sql
@@script/tag/To_Link "Rman Backup"   

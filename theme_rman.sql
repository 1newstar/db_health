-- ********************************************************************
-- * Copyright Notice   : (c)2015,2016 Peng Liu.
-- * Filename           : theme_rman.sql
-- * Author             : Peng Liu
-- * Original           : 20151117
-- * Last Update        : 20160519
-- * Description        : Theme about Rman
-- *                      "Back History"
-- *                      ...
-- * Usage              : be called by db_health_check.sql
-- ********************************************************************

@@script/Pa "Rman Backup"                                                                                                                                                                                                          
@@script/H1 "Rman Backup"
spool off                                                                                                                                                                                                                 
set markup html off spool off
HOST sh script/ul.sh "Back History" >>&report_file                                                                                                                                               
spool &report_file append
set markup html on spool on                                                                                                                                                                                               
@@script/To_Top
                                                                                                                                                                                                                          
@@script/Pa "Back History"
@@script/H3 "Back History"                                                                                                                                                                                                
@@script/rman_history.sql
@@script/To_Link "Rman Backup"   

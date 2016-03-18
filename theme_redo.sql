-- ********************************************************************
-- * Copyright Notice   : (c)2015,2016 Peng Liu.
-- * Filename           : theme_redo.sql
-- * Author             : Peng Liu
-- * Original           : 20151117
-- * Last Update        : 20160318
-- * Description        : Theme about redo
-- *                      Logfile Log
-- *                      ...
-- * Usage              : be called by db_health_check.sql
-- ********************************************************************

@@script/Pa Redo                                                                                                                                                                                                          
@@script/H1 Redo
spool off                                                                                                                                                                                                                 
set markup html off spool off
HOST sh script/ul.sh Logfile Log >>&script_base/report_&today_file..html                                                                                                                                                  
spool &script_base/report_&today_file..html append
set markup html on spool on                                                                                                                                                                                               
@@script/To_Top                                                                                                                                                                                                           

@@script/Pa Logfile                                                                                                                                                                                                       
@@script/H3 Logfile
@@script/logfile.sql                                                                                                                                                                                                      
@@script/To_Link Redo
                                                                                                                                                                                                                          
@@script/Pa Log
@@script/H3 Log                                                                                                                                                                                                           
@@script/log.sql
@@script/To_Link Redo

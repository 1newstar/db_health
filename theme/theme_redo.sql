-- ********************************************************************
-- * Copyright Notice   : (c)2015,2016 Peng Liu.
-- * Filename           : theme_redo.sql
-- * Author             : Peng Liu
-- * Original           : 20151117
-- * Last Update        : 20160520
-- * Description        : Theme about redo
-- *                      Logfile Log
-- *                      ...
-- * Usage              : be called by db_health_check.sql
-- ********************************************************************

@@script/tag/Pa Redo                                                                                                                                                                                                          
@@script/tag/H1 Redo
spool off                                                                                                                                                                                                                 
set markup html off spool off
HOST sh script/ul.sh Logfile Log >>&report_file                                                                                                                                                  
spool &report_file append
set markup html on spool on                                                                                                                                                                                               
@@script/tag/To_Top                                                                                                                                                                                                           

@@script/tag/Pa Logfile                                                                                                                                                                                                       
@@script/tag/H3 Logfile
@@script/logfile.sql                                                                                                                                                                                                      
@@script/tag/To_Link Redo
                                                                                                                                                                                                                          
@@script/tag/Pa Log
@@script/tag/H3 Log                                                                                                                                                                                                           
@@script/log.sql
@@script/tag/To_Link Redo

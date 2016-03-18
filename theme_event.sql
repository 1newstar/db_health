-- ********************************************************************
-- * Copyright Notice   : (c)2015,2016 Peng Liu.
-- * Filename           : theme_event.sql
-- * Author             : Peng Liu
-- * Original           : 20151117
-- * Last Update        : 20160318
-- * Description        : Theme about Wait Events
-- *                      Top 10 Foreground Events by Total Wait Time From yesterday to now
-- *                      ...
-- * Usage              : be called by db_health_check.sql
-- ********************************************************************

@@script/Pa "Wait Events Statistics"                                                                                                                                                                                                          
@@script/H1 "Wait Events Statistics"
spool off                                                                                                                                                                                                                 
set markup html off spool off
HOST sh script/ul.sh "Top 10 Foreground Events by Total Wait Time" >>&script_base/report_&today_file..html                                                                                                                                               
spool &script_base/report_&today_file..html append
set markup html on spool on                                                                                                                                                                                               
@@script/To_Top
                                                                                                                                                                                                                          
@@script/Pa "Top 10 Foreground Events by Total Wait Time"
@@script/H3 "Top 10 Foreground Events by Total Wait Time"                                                                                                                                                                                                
@@script/DB_EVENT_TOP10.sql
@@script/To_Link "Wait Events Statistics"   

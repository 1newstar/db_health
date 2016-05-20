-- ********************************************************************
-- * Copyright Notice   : (c)2015,2016 Peng Liu.
-- * Filename           : theme_event.sql
-- * Author             : Peng Liu
-- * Original           : 20151117
-- * Last Update        : 20160520
-- * Description        : Theme about Wait Events
-- *                      Top 10 Foreground Events by Total Wait Time From yesterday to now
-- *                      ...
-- * Usage              : be called by db_health_check.sql
-- ********************************************************************

@@script/tag/Pa "Wait Events Statistics"                                                                                                                                                                                                          
@@script/tag/H1 "Wait Events Statistics"
                                                                                                                                                                                                               
set markup html off                                                                                                                                              
@@script/tag/ul.sql 'Top 10 Foreground Events by Total Wait Time'
set markup html on                                                                                                                                                                                               
@@script/tag/To_Top
                                                                                                                                                                                                                          
@@script/tag/Pa "Top 10 Foreground Events by Total Wait Time"
@@script/tag/H3 "Top 10 Foreground Events by Total Wait Time"                                                                                                                                                                                                
@@script/DB_EVENT_TOP10.sql
@@script/tag/To_Link "Wait Events Statistics"   

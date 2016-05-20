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
                                                                                                                                                                                                                
set markup html off  
@@script/tag/ul.sql 'Logfile,Log'                                                                                                                                                 
set markup html on     
                                                                                                                                                                                         
@@script/tag/To_Top                                                                                                                                                                                                           

@@script/tag/Pa Logfile                                                                                                                                                                                                       
@@script/tag/H3 Logfile
@@script/logfile.sql                                                                                                                                                                                                      
@@script/tag/To_Link Redo
                                                                                                                                                                                                                          
@@script/tag/Pa Log
@@script/tag/H3 Log                                                                                                                                                                                                           
@@script/log.sql
@@script/tag/To_Link Redo

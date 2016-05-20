-- ********************************************************************
-- * Copyright Notice   : (c)2015,2016 Peng Liu.
-- * Filename           : theme_archive.sql
-- * Author             : Peng Liu
-- * Original           : 20151118
-- * Last Update        : 20160520
-- * Description        : Theme about archive
-- *                      Archive Rate
-- *                      ...
-- * Usage              : be called by db_health_check.sql
-- ********************************************************************

@@script/tag/Pa Archive                                                                                                                                                                                                       
@@script/tag/H1 Archive                                                                                                                                                                                                       
spool off
set markup html off spool off                                                                                                                                                                                             
HOST sh script/ul.sh "Archive Rate"  >>&report_file
spool &report_file append                                                                                                                                                                        
set markup html on spool on
@@script/tag/To_Top                                                                                                                                                                                                           

@@script/tag/Pa "Archive Rate"                                                                                                                                                                                                
@@script/tag/H3 "Archive Rate"
@@script/archive_rate.sql                                                                                                                                                                                                 
@@script/tag/To_Link Archive

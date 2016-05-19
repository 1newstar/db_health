-- ********************************************************************
-- * Copyright Notice   : (c)2015,2016 Peng Liu.
-- * Filename           : theme_archive.sql
-- * Author             : Peng Liu
-- * Original           : 20151118
-- * Last Update        : 20160519
-- * Description        : Theme about archive
-- *                      Archive Rate
-- *                      ...
-- * Usage              : be called by db_health_check.sql
-- ********************************************************************

@@script/Pa Archive                                                                                                                                                                                                       
@@script/H1 Archive                                                                                                                                                                                                       
spool off
set markup html off spool off                                                                                                                                                                                             
HOST sh script/ul.sh "Archive Rate"  >>&report_file
spool &report_file append                                                                                                                                                                        
set markup html on spool on
@@script/To_Top                                                                                                                                                                                                           

@@script/Pa "Archive Rate"                                                                                                                                                                                                
@@script/H3 "Archive Rate"
@@script/archive_rate.sql                                                                                                                                                                                                 
@@script/To_Link Archive

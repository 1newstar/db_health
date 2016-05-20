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

set markup html off
@@script/tag/ul.sql 'Archive Rate'                                                                                                                                                                        
set markup html on
@@script/tag/To_Top                                                                                                                                                                                                           

@@script/tag/Pa "Archive Rate"                                                                                                                                                                                                
@@script/tag/H3 "Archive Rate"
@@script/archive_rate.sql                                                                                                                                                                                                 
@@script/tag/To_Link Archive

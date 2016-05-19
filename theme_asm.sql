-- ********************************************************************
-- * Copyright Notice   : (c)2015,2016 Peng Liu.
-- * Filename           : theme_asm.sql
-- * Author             : Peng Liu
-- * Original           : 20160317
-- * Last Update        : 20160519
-- * Description        : Theme about ASM
-- *                      Disk Groups
-- *                      ...
-- * Usage              : be called by db_health_check.sql
-- ********************************************************************

@@script/Pa "ASM"                                                                                                                                                                                                          
@@script/H1 "ASM"
spool off                                                                                                                                                                                                                 
set markup html off spool off
HOST sh script/ul.sh "Disk Groups" >>&report_file                                                                                                                                               
spool &report_file append
set markup html on spool on                                                                                                                                                                                               
@@script/To_Top
                                                                                                                                                                                                                          
@@script/Pa "Disk Groups"
@@script/H3 "Disk Groups"                                                                                                                                                                                                
@@script/asm_diskgroups.sql
@@script/To_Link "ASM"   

-- ********************************************************************
-- * Copyright Notice   : (c)2015,2016 Peng Liu.
-- * Filename           : theme_asm.sql
-- * Author             : Peng Liu
-- * Original           : 20160317
-- * Last Update        : 20160318
-- * Description        : Theme about ASM
-- *                      Disk Groups
-- *                      ...
-- * Usage              : be called by db_health_check.sql
-- ********************************************************************

@@script/Pa "ASM"                                                                                                                                                                                                          
@@script/H1 "ASM"
spool off                                                                                                                                                                                                                 
set markup html off spool off
HOST sh script/ul.sh "Disk Groups" >>&script_base/report_&today_file..html                                                                                                                                               
spool &script_base/report_&today_file..html append
set markup html on spool on                                                                                                                                                                                               
@@script/To_Top
                                                                                                                                                                                                                          
@@script/Pa "Disk Groups"
@@script/H3 "Disk Groups"                                                                                                                                                                                                
@@script/asm_diskgroups.sql
@@script/To_Link "ASM"   

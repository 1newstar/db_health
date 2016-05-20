-- ********************************************************************
-- * Copyright Notice   : (c)2015,2016 Peng Liu.
-- * Filename           : theme_asm.sql
-- * Author             : Peng Liu
-- * Original           : 20160317
-- * Last Update        : 20160520
-- * Description        : Theme about ASM
-- *                      Disk Groups
-- *                      ...
-- * Usage              : be called by db_health_check.sql
-- ********************************************************************

@@script/tag/Pa "ASM"                                                                                                                                                                                                          
@@script/tag/H1 "ASM"
                                                                                                                                                                                                                 
set markup html off                                                                                                                                               
@@script/tag/ul.sql 'Disk Groups'
set markup html on                                                                                                                                                                                             
@@script/tag/To_Top
                                                                                                                                                                                                                          
@@script/tag/Pa "Disk Groups"
@@script/tag/H3 "Disk Groups"                                                                                                                                                                                                
@@script/asm_diskgroups.sql
@@script/tag/To_Link "ASM"
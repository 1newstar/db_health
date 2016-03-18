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

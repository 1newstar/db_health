-- ********************************************************************
-- * Copyright Notice   : (c)2015,2016 Peng Liu.
-- * Filename           : theme_objects.sql
-- * Author             : Peng Liu
-- * Original           : 20151117
-- * Last Update        : 20160519
-- * Description        : Theme about Objects
-- *                      "Invalid Objects" "The Objects Nopartition Which Bigger Than 2GB" "Index Level Bigger Than 3" "Tables Have Chained Rows If Have Been Analyzed"
-- *                      ...
-- * Usage              : be called by db_health_check.sql
-- ********************************************************************

@@script/Pa Objects                                                                                                                                                                                                       
@@script/H1 Objects
spool off                                                                                                                                                                                                                 
set markup html off spool off
HOST sh script/ul.sh "Invalid Objects" "The Objects Nopartition Which Bigger Than 2GB" "Index Level Bigger Than 3" "Tables Have Chained Rows If Have Been Analyzed" >>&report_file               
spool &report_file append
set markup html on spool on                                                                                                                                                                                               
@@script/To_Top
                                                                                                                                                                                                                          
@@script/Pa "Invalid Objects"
@@script/H3 "Invalid Objects"                                                                                                                                                                                             
@@script/invalid_objects.sql
@@script/To_Link Objects                                                                                                                                                                                                  

@@script/Pa "The Objects Nopartition Which Bigger Than 2GB"                                                                                                                                                               
@@script/H3 "The Objects Nopartition Which Bigger Than 2GB"
@@script/big_but_no_partition.sql                                                                                                                                                                                         
@@script/To_Link Objects
                                                                                                                                                                                                                          
@@script/Pa "Index Level Bigger Than 3"
@@script/H3 "Index Level Bigger Than 3"                                                                                                                                                                                   
@@script/index_level.sql
@@script/To_Link Objects                                                                                                                                                                                                  

@@script/Pa "Tables Have Chained Rows If Have Been Analyzed"                                                                                                                                                              
@@script/H3 "Tables Have Chained Rows If Have Been Analyzed"
@@script/chained_rows.sql                                                                                                                                                                                                 
@@script/To_Link Objects

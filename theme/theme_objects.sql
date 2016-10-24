-- ********************************************************************
-- * Copyright Notice   : (c)2015,2016 Peng Liu.
-- * Filename           : theme_objects.sql
-- * Author             : Peng Liu
-- * Original           : 20151117
-- * Last Update        : 20160520
-- * Description        : Theme about Objects
-- *                      "Invalid Objects" "The Objects Nopartition Which Bigger Than 2GB" "Index Level Bigger Than 3" "Tables Have Chained Rows If Have Been Analyzed"
-- *                      ...
-- * Usage              : be called by db_health_check.sql
-- ********************************************************************

@@script/tag/Pa Objects                                                                                                                                                                                                       
@@script/tag/H1 Objects
                                                                                                                                                                                                                 
set markup html off              
@@script/tag/ul.sql 'Schema Objects Size,Recyclebin Size,Invalid Objects,Partition Tables,The Objects Nopartition Which Bigger Than 2GB,Index Level Bigger Than 3,Tables Have Chained Rows If Have Been Analyzed'
set markup html on                                                                                                                                                                                               
@@script/tag/To_Top
 
@@script/tag/Pa "Schema Objects Size"
@@script/tag/H3 "Schema Objects Size"                                                                                                                                                                                             
@@script/schema_size.sql
@@script/tag/To_Link Objects

@@script/tag/Pa "Recyclebin Size"
@@script/tag/H3 "Recyclebin Size"                                                                                                                                                                                             
@@script/recyclebin_size.sql
@@script/tag/To_Link Objects  
                                                                                                                                                                                                                          
@@script/tag/Pa "Invalid Objects"
@@script/tag/H3 "Invalid Objects"                                                                                                                                                                                             
@@script/invalid_objects.sql
@@script/tag/To_Link Objects

@@script/tag/Pa "Partition Tables"
@@script/tag/H3 "Partition Tables"                                                                                                                                                                                             
@@script/range_partition_check.sql
@@script/tag/To_Link Objects                                                                                                                                                                                                  

@@script/tag/Pa "The Objects Nopartition Which Bigger Than 2GB"                                                                                                                                                               
@@script/tag/H3 "The Objects Nopartition Which Bigger Than 2GB"
@@script/big_but_no_partition.sql                                                                                                                                                                                         
@@script/tag/To_Link Objects
                                                                                                                                                                                                                          
@@script/tag/Pa "Index Level Bigger Than 3"
@@script/tag/H3 "Index Level Bigger Than 3"                                                                                                                                                                                   
@@script/index_level.sql
@@script/tag/To_Link Objects                                                                                                                                                                                                  

@@script/tag/Pa "Tables Have Chained Rows If Have Been Analyzed"                                                                                                                                                              
@@script/tag/H3 "Tables Have Chained Rows If Have Been Analyzed"
@@script/chained_rows.sql                                                                                                                                                                                                 
@@script/tag/To_Link Objects

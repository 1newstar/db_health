-- ********************************************************************
-- * Copyright Notice   : (c)2015,2016 Peng Liu.
-- * Filename           : theme_statistics.sql
-- * Author             : Peng Liu
-- * Original           : 20151117
-- * Last Update        : 20160320
-- * Description        : Theme about Statistics
-- *                      "Autotask Client Status" "Auto Job History" "Gather Tables count" "Gather Special User Tables Count"
-- *                      ...
-- * Usage              : be called by db_health_check.sql
-- ********************************************************************

@@script/tag/Pa Statistics
@@script/tag/H1 Statistics                                                                                                                                                                                                    

set markup html off
@@script/tag/ul.sql 'Autotask Client Status,Auto Job History,Gather Tables count,Gather Special User Tables Count'                                                                                                                                                                       
set markup html on
@@script/tag/To_Top                                                                                                                                                                                                           

@@script/tag/Pa "Autotask Client Status"                                                                                                                                                                                      
@@script/tag/H3 "Autotask Client Status"
@@script/autotask_client.sql                                                                                                                                                                                              
@@script/tag/To_Link Statistics
                                                                                                                                                                                                                          
@@script/tag/Pa "Auto Job History"
@@script/tag/H3 "Auto Job History"                                                                                                                                                                                            
@@script/auto_job_histrory.sql
@@script/tag/To_Link Statistics                                                                                                                                                                                               

@@script/tag/Pa "Gather Tables count"                                                                                                                                                                                         
@@script/tag/H3 "Gather Tables count"
@@script/gather_table_count.sql                                                                                                                                                                                           
@@script/tag/To_Link Statistics
                                                                                                                                                                                                                          
@@script/tag/Pa "Gather Special User Tables Count"
@@script/tag/H3 "Gather Special User Tables Count"                                                                                                                                                                            
@@script/gather_special_user_table.sql
@@script/tag/To_Link Statistics

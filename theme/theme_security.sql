-- ********************************************************************
-- * Copyright Notice   : (c)2015,2016 Peng Liu.
-- * Filename           : theme_security.sql
-- * Author             : Peng Liu
-- * Original           : 20151117
-- * Last Update        : 20160320
-- * Description        : Theme about Security
-- *                      "User Privileges" "Who Is DBA"
-- *                      ...
-- * Usage              : be called by db_health_check.sql
-- ********************************************************************

@@script/tag/Pa Security
@@script/tag/H1 Security                                                                                                                                                                                                      
spool off
set markup html off spool off                                                                                                                                                                                             
HOST sh script/ul.sh "User Privileges" "Who Is DBA" >>&report_file
spool &report_file append                                                                                                                                                                        
set markup html on spool on
@@script/tag/To_Top                                                                                                                                                                                                           

@@script/tag/Pa "User Privileges"                                                                                                                                                                                             
@@script/tag/H3 "User Privileges"
@@script/user_privilege.sql                                                                                                                                                                                               
@@script/tag/To_Link Security
                                                                                                                                                                                                                          
@@script/tag/Pa "Who Is DBA"
@@script/tag/H3 "Who Is DBA"                                                                                                                                                                                                  
@@script/who_is_dba.sql
@@script/tag/To_Link Security   

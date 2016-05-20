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

set markup html off
@@script/tag/ul.sql 'User Privileges,Who Is DBA'                                                                                                                                                                        
set markup html on
@@script/tag/To_Top                                                                                                                                                                                                           

@@script/tag/Pa "User Privileges"                                                                                                                                                                                             
@@script/tag/H3 "User Privileges"
@@script/user_privilege.sql                                                                                                                                                                                               
@@script/tag/To_Link Security
                                                                                                                                                                                                                          
@@script/tag/Pa "Who Is DBA"
@@script/tag/H3 "Who Is DBA"                                                                                                                                                                                                  
@@script/who_is_dba.sql
@@script/tag/To_Link Security   

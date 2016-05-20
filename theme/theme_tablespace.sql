-- ********************************************************************
-- * Copyright Notice   : (c)2015,2016 Peng Liu.
-- * Filename           : theme_tablespace.sql
-- * Author             : Peng Liu
-- * Original           : 20151117
-- * Last Update        : 20160520
-- * Description        : Theme about tablespace
-- *                      "Tablespace Used of Max" "Tablespace Used" "Datafiles Used" "Temp Tablespace Used" 
-- *                      "Undoblock Type Space" "Real Undo Tablespace Used" "Undostat" "Other User System Segments Count"...
-- * Usage              : be called by db_health_check.sql
-- ********************************************************************

REM display the tablespace info                                                                                                                                                                                           
                                                                                                                                                                                                                          
@@script/tag/Pa Tablespace                                                                                                                                                                                                    
@@script/tag/H1 Tablespace                                                                                                                                                                                                    
                                                                                                                                                                                                                          
                                                                                                                                                                                                                 
set markup html off
@@script/tag/ul.sql 'Tablespace Used of Max,Tablespace Used,Datafiles Used,Temp Tablespace Used,Undoblock Type Space,Real Undo Tablespace Used,Undostat,Other User System Segments Count'                                                                                                                                                                        
set markup html on                                                                                                                                                                                              
                                                                                                                                                                                                                          
@@script/tag/To_Top                                                                                                                                                                                                           
                                                                                                                                                                                                                          
REM display the tablespace used                                                                                                                                                                                           
                                                                                                                                                                                                                          
@@script/tag/Pa "Tablespace Used of Max"                                                                                                                                                                                                    
@@script/tag/H3 "Tablespace Used of Max"                                                                                                                                                                                                    

REM set the table class of tablespaces used of max                                                                                                                                                                                      

SET MARKUP HTML ON TABLE "class='awrredmax'"                                                                                                                                                                                 
@@script/max_tablespace_used_color.sql
@@script/tag/To_Link Tablespace                                                                                                                                                                                               

@@script/tag/Pa "Tablespace Used"                                                                                                                                                                                             
@@script/tag/H3 "Tablespace Used"
                                                                                                                                                                                                                          
REM set the table class of tablespaces used
                                                                                                                                                                                                                          
SET MARKUP HTML ON TABLE "class='awrred'"
@@script/tablespace_used_color.sql                                                                                                                                                                                        
@@script/tag/To_Link Tablespace
                                                                                                                                                                                                                          
REM set the table class of datafiles used                                                                                                                                                                                 

SET MARKUP HTML ON TABLE "class='awrredf'"                                                                                                                                                                                
@@script/tag/Pa "Datafiles Used"
@@script/tag/H3 "Datafiles Used"                                                                                                                                                                                              
@@script/datafile_used_color.sql
@@script/tag/To_Link Tablespace                                                                                                                                                                                               

REM reset all table class                                                                                                                                                                                                 

SET MARKUP HTML ON TABLE "class='awr'"                                                                                                                                                                                    
@@script/tag/Pa "Temp Tablespace Used"
@@script/tag/H3 "Temp Tablespace Used"                                                                                                                                                                                        
@@script/temp_tablesapce_used.sql                                                                                                                                                                                         
@@script/tag/To_Link Tablespace                                                                                                                                                                                               

@@script/tag/Pa "Undoblock Type Space"                                                                                                                                                                                        
@@script/tag/H3 "Undoblock Type Space"                                                                                                                                                                                        
@@script/undoblock_type_used.sql                                                                                                                                                                                          
@@script/tag/To_Link Tablespace                                                                                                                                                                                               

@@script/tag/Pa "Real Undo Tablespace Used"                                                                                                                                                                                   
@@script/tag/H3 "Real Undo Tablespace Used"                                                                                                                                                                                   
@@script/real_undo_used.sql                                                                                                                                                                                               
@@script/tag/To_Link Tablespace                                                                                                                                                                                               

@@script/tag/Pa Undostat                                                                                                                                                                                                      
@@script/tag/H3 Undostat                                                                                                                                                                                                      
@@script/undostat.sql    
@@script/tag/To_Link Tablespace                                                                                                                                                                                               

@@script/tag/Pa "Other User System Segments Count"                                                                                                                                                                            
@@script/tag/H3 "Other User System Segments Count"                                                                                                                                                                            
@@script/other_user_segment_in_system.sql                                                                                                                                                                                 
@@script/tag/To_Link Tablespace

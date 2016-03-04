REM display the tablespace info                                                                                                                                                                                           
                                                                                                                                                                                                                          
@@script/Pa Tablespace                                                                                                                                                                                                    
@@script/H1 Tablespace                                                                                                                                                                                                    
                                                                                                                                                                                                                          
spool off                                                                                                                                                                                                                 
set markup html off spool off                                                                                                                                                                                             
HOST sh script/ul.sh "Tablespace Used of Max" "Tablespace Used" "Datafiles Used" "Temp Tablespace Used" "Undoblock Type Space" "Real Undo Tablespace Used" "Undostat" "Other User System Segments Count" >>&script_base/report_&today_file..html
spool &script_base/report_&today_file..html append                                                                                                                                                                        
set markup html on spool on                                                                                                                                                                                               
                                                                                                                                                                                                                          
@@script/To_Top                                                                                                                                                                                                           
                                                                                                                                                                                                                          
REM display the tablespace used                                                                                                                                                                                           
                                                                                                                                                                                                                          
@@script/Pa "Tablespace Used of Max"                                                                                                                                                                                                    
@@script/H3 "Tablespace Used of Max"                                                                                                                                                                                                    

REM set the table class of tablespaces used of max                                                                                                                                                                                      

SET MARKUP HTML ON TABLE "class='awrredmax'"                                                                                                                                                                                 
@@script/max_tablespace_used_color.sql
@@script/To_Link Tablespace                                                                                                                                                                                               

@@script/Pa "Tablespace Used"                                                                                                                                                                                             
@@script/H3 "Tablespace Used"
                                                                                                                                                                                                                          
REM set the table class of tablespaces used
                                                                                                                                                                                                                          
SET MARKUP HTML ON TABLE "class='awrred'"
@@script/tablespace_used_color.sql                                                                                                                                                                                        
@@script/To_Link Tablespace
                                                                                                                                                                                                                          
REM set the table class of datafiles used                                                                                                                                                                                 

SET MARKUP HTML ON TABLE "class='awrredf'"                                                                                                                                                                                
@@script/Pa "Datafiles Used"
@@script/H3 "Datafiles Used"                                                                                                                                                                                              
@@script/datafile_used_color.sql
@@script/To_Link Tablespace                                                                                                                                                                                               

REM reset all table class                                                                                                                                                                                                 

SET MARKUP HTML ON TABLE "class='awr'"                                                                                                                                                                                    
@@script/Pa "Temp Tablespace Used"
@@script/H3 "Temp Tablespace Used"                                                                                                                                                                                        
@@script/temp_tablesapce_used.sql                                                                                                                                                                                         
@@script/To_Link Tablespace                                                                                                                                                                                               

@@script/Pa "Undoblock Type Space"                                                                                                                                                                                        
@@script/H3 "Undoblock Type Space"                                                                                                                                                                                        
@@script/undoblock_type_used.sql                                                                                                                                                                                          
@@script/To_Link Tablespace                                                                                                                                                                                               

@@script/Pa "Real Undo Tablespace Used"                                                                                                                                                                                   
@@script/H3 "Real Undo Tablespace Used"                                                                                                                                                                                   
@@script/real_undo_used.sql                                                                                                                                                                                               
@@script/To_Link Tablespace                                                                                                                                                                                               

@@script/Pa Undostat                                                                                                                                                                                                      
@@script/H3 Undostat                                                                                                                                                                                                      
@@script/undostat.sql    
@@script/To_Link Tablespace                                                                                                                                                                                               

@@script/Pa "Other User System Segments Count"                                                                                                                                                                            
@@script/H3 "Other User System Segments Count"                                                                                                                                                                            
@@script/other_user_segment_in_system.sql                                                                                                                                                                                 
@@script/To_Link Tablespace

SELECT j.session_key,
       TO_CHAR (J.START_TIME, 'yyyy-mm-dd hh24:mi:ss') start_time,                                                                                                                                                        
       TO_CHAR (j.end_time, 'yyyy-mm-dd hh24:mi:ss') end_time,
       J.TIME_TAKEN_DISPLAY,                                                                                                                                                                                              
       J.INPUT_BYTES_DISPLAY "INPUT(SUM)",
       J.OUTPUT_BYTES_DISPLAY "OUTPUT(SUM)",                                                                                                                                                                              
       J.OUTPUT_DEVICE_TYPE,
       J.STATUS,                                                                                                                                                                                                          
       J.INPUT_TYPE,
       J.INPUT_BYTES_PER_SEC_DISPLAY "INPUT(s)",                                                                                                                                                                          
       J.OUTPUT_BYTES_PER_SEC_DISPLAY "OUTPUT(s)"
 FROM V$rman_Backup_Job_Details j order by end_time desc;

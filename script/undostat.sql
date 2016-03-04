SELECT TO_CHAR(BEGIN_TIME, 'YYYY-MM-dd HH24:MI:SS') BEGIN_TIME,                                                                                                                                                           
       TUNED_UNDORETENTION,                                                                                                                                                                                               
       MAXQUERYLEN,                                                                                                                                                                                                       
       ACTIVEBLKS,                                                                                                                                                                                                        
       UNEXPIREDBLKS,                                                                                                                                                                                                     
       EXPIREDBLKS                                                                                                                                                                                                        
  FROM V$UNDOSTAT
  WHERE ROWNUM<=20;

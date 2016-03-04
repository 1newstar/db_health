SELECT A.TABLESPACE_NAME,                                                                                                                                                                                                 
       A.TOTAL_SPACE "TOTAL_SPACE(GB)",
       NVL(B.FREE_SPACE, 0) "FREE(GB)",                                                                                                                                                                                   
       A.TOTAL_SPACE - NVL(B.FREE_SPACE, 0) "USED(GB)",
       CASE WHEN A.TOTAL_SPACE=0 THEN 0 ELSE trunc(NVL(B.FREE_SPACE, 0) / A.TOTAL_SPACE * 100, 2) END "FREEPCT%" --避免分母为0                                                                                            
  FROM (SELECT TABLESPACE_NAME, trunc(SUM(BYTES) / 1024 / 1024/1024 ,2) TOTAL_SPACE
          FROM DBA_DATA_FILES                                                                                                                                                                                             
         GROUP BY TABLESPACE_NAME) A,
       (SELECT TABLESPACE_NAME, trunc(SUM(BYTES / 1024 / 1024/1024  ),2) FREE_SPACE                                                                                                                                       
          FROM DBA_FREE_SPACE
         GROUP BY TABLESPACE_NAME) B                                                                                                                                                                                      
 WHERE A.TABLESPACE_NAME = B.TABLESPACE_NAME(+)
 ORDER BY 5 desc; 

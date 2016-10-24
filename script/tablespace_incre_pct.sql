--不包含sysdate，不包含能查到的第一天，awr一共有9天的数据，第一天的增长率无从计算，今天的增长率不准确，故都排除
SELECT A.NAME,
       B.TABLESPACE_ID,
       B.DATETIME,
       ROUND(B.USED_SIZE_MB,2) USED_SIZE_MB,
       ROUND(B.INC_MB,2) INC_MB,
       CASE
         WHEN SUBSTR(INC_RATE, 1, 1) = '.' THEN
          '0' || INC_RATE
         WHEN SUBSTR(INC_RATE, 1, 2) = '-.' THEN
          '-0' || SUBSTR(INC_RATE, 2, LENGTH(INC_RATE))
         ELSE
          INC_RATE
       END AS INC_RATEX
  FROM V$TABLESPACE A,
       (SELECT TABLESPACE_ID,
               DATETIME,
               USED_SIZE_MB,
               (DECODE(PREV_USE_MB, 0, 0, USED_SIZE_MB) - PREV_USE_MB) AS INC_MB,
               TO_CHAR(ROUND((DECODE(PREV_USE_MB, 0, 0, USED_SIZE_MB) -
                             PREV_USE_MB) /
                             DECODE(PREV_USE_MB, 0, 1, PREV_USE_MB) * 100,
                             2)) || '%' AS INC_RATE
          FROM (SELECT TABLESPACE_ID,
                       TRUNC(TO_DATE(RTIME, 'mm/dd/yyyy hh24:mi:ss')) DATETIME,
                       MAX(TABLESPACE_USEDSIZE * 8 / 1024) USED_SIZE_MB,
                       LAG(MAX(TABLESPACE_USEDSIZE * 8 / 1024), 1, 0) OVER(PARTITION BY TABLESPACE_ID ORDER BY TRUNC(TO_DATE(RTIME, 'mm/dd/yyyy hh24:mi:ss'))) AS PREV_USE_MB
                  FROM DBA_HIST_TBSPC_SPACE_USAGE
                 WHERE TRUNC(TO_DATE(RTIME, 'mm/dd/yyyy hh24:mi:ss')) !=
                       TRUNC(SYSDATE)
                 GROUP BY TABLESPACE_ID,
                          TRUNC(TO_DATE(RTIME, 'mm/dd/yyyy hh24:mi:ss')))
         where PREV_USE_MB <> 0) B
 WHERE A.TS# = B.TABLESPACE_ID
 ORDER BY B.TABLESPACE_ID DESC, DATETIME;

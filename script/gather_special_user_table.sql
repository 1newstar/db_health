-- ********************************************************************
-- * Copyright Notice   : (c)2015,2016 Peng Liu.
-- * Filename           : base_dir.sql
-- * Author             : Peng Liu
-- * Original           : 20151118
-- * Last Update        : 20160519
-- * Description        : 统计15天内特殊用户的表收集情况
-- *                      
-- *                      
-- * Usage              : be called by theme_statistics.sql
-- ********************************************************************

select owner, trunc(last_analyzed) "DATE", count(*) total_table
  from dba_tables
 where owner in (&special_users)
   and last_analyzed IS NOT NULL
   and last_analyzed >= SYSDATE - 14
 group by owner, trunc(last_analyzed)
 order by trunc(last_analyzed) desc;
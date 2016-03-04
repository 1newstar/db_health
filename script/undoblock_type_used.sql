SELECT DISTINCT STATUS,
                SUM(BYTES) / 1024 / 1024 "SUM(MB)",
                COUNT(*) "EXTENT_COUNT",
                SUM(BLOCKS) "BLOCKS",
                tablespace_name
  FROM DBA_UNDO_EXTENTS
 GROUP BY STATUS, tablespace_name;

select *  from v$flash_recovery_area_usage;
  
select name,
       round(space_limit / 1024 / 1024 / 1024, 2) as "SPACE_LIMIT(GB)",
       round(SPACE_USED / 1024 / 1024 / 1024, 2) as "SPACE_USED(GB)",
       round(SPACE_RECLAIMABLE / 1024 / 1204 / 1024, 2) as "SPACE_RECLAIMABLE(GB)",
       NUMBER_OF_FILES
from V$RECOVERY_FILE_DEST;

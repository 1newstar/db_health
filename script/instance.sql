select c.NAME,
       c.DBID,
       a.INSTANCE_NAME,
       a.INSTANCE_NUMBER "INST NUM",
       a.VERSION,
       a.STARTUP_TIME,
       a.STATUS,
       a.ARCHIVER,
       c.FORCE_LOGGING,
       c.FLASHBACK_ON,
       decode(b.VALUE, 'TRUE', 'YES', 'NO') "RAC"
  from v$instance a, v$parameter b,v$database c
 where b.NAME = 'cluster_database';

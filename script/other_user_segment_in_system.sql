select owner,count(*) from dba_segments where tablespace_name='SYSTEM' and owner not in ('SYSTEM','SYS') group by owner;

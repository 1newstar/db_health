select owner,object_name,object_type,status from dba_objects where status <> 'VALID' order by 1,3;

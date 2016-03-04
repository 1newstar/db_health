 SELECT d.tablespace_name "Name", 
                TO_CHAR(NVL(a.bytes / 1024 / 1024, 0),'99,999,990.900') "Size (M)", 
                TO_CHAR(NVL(t.hwm, 0)/1024/1024,'99999999.999')  "HWM (M)",
                TO_CHAR(NVL(t.hwm / a.bytes * 100, 0), '990.00') "HWM % " ,
                TO_CHAR(NVL(t.bytes/1024/1024, 0),'99999999.999') "Using (M)", 
          TO_CHAR(NVL(t.bytes / a.bytes * 100, 0), '990.00') "Using %" 
           FROM sys.dba_tablespaces d, 
                (select tablespace_name, sum(bytes) bytes from dba_temp_files group by tablespace_name) a,
                (select tablespace_name, sum(bytes_cached) hwm, sum(bytes_used) bytes from v$temp_extent_pool group by tablespace_name) t
          WHERE d.tablespace_name = a.tablespace_name(+) 
            AND d.tablespace_name = t.tablespace_name(+) 
            AND d.extent_management like 'LOCAL' 
            AND d.contents like 'TEMPORARY';

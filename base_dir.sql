SET termout off
column today new_value today_file
column base new_value script_base
select to_char(sysdate,'yyyymmdd') as today from dual;
select '/home/oracle/db_health/report' as base from dual;
column name new_value Author
select 'Peng Liu' as name from dual;
column value new_value blocksize
select value as value from v$parameter where name ='db_block_size';
column date new_value time
select systimestamp as "date" from dual;
column dbname new_value db_name
select name as dbname from v$database;
column instname new_value inst_name
select instance_name as instname from v$instance;

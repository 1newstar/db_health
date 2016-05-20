-- ********************************************************************
-- * Copyright Notice   : (c)2015,2016 Peng Liu.
-- * Filename           : base_dir.sql
-- * Author             : Peng Liu
-- * Original           : 20151118
-- * Last Update        : 20160519
-- * Description        : Set up some variables
-- *                      the report home
-- *                      the author name...
-- * Usage              : be called by db_health_check.sql
-- ********************************************************************

SET termout off
SET verify off

--define your variable

define Author='Peng Liu'
define report_dir='D:\report'
define special_users="'OLD_BROKER','OLD_BROKER','DEV_CENTER','DEV_BROKER'"


column today new_value todayfile
select to_char(sysdate,'yyyymmdd') as today from dual;

column value new_value blocksize
select value as value from v$parameter where name ='db_block_size';

column date new_value time
select systimestamp as "date" from dual;

column db_name new_value dbname
select name as db_name from v$database;

column instance_name new_value instname
column cinstance_number new_value instnum
select to_char(instance_number) as cinstance_number,instance_name from v$instance;

define report_file="&report_dir/Report-&dbname-&instnum-&todayfile..html"

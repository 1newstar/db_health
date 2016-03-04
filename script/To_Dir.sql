set markup html off spool off
SET HEAD OFF
set verify off
select '<a class="awr" href="#&1">Back to &1</a>' FROM DUAL;
select '<br>' from dual;
SET HEAD ON
set markup html on spool on

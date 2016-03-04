set markup html off spool off
SET HEAD OFF
set verify off
select '<hr align="left" width="20%">' FROM DUAL;
select '<p>' FROM DUAL;
select '<a class="awr" href="#&1">Back to &1</a>' FROM DUAL;
select '<br>' from dual;
select '<a class="awr" href="#top">Back to Top</a>' FROM DUAL;
select '</p>' FROM DUAL;
SET HEAD ON
set markup html on spool on

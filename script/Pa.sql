set markup html off spool off
SET HEAD OFF
set verify off
select '<p><a name="&1"></a></p>' FROM DUAL;
SET HEAD ON
set markup html on spool on

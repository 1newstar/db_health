select name, display_value, ISDEFAULT
  from v$system_parameter
 where value is not null
 order by 3;

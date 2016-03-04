REM display the report title

@@script/H1_title "HEALTH CHECK report for"

REM display the db summary info

@@script/instance.sql
@@script/hostinfo.sql

REM display the report summary

@@script/H1 "Report Summary"

@@script/P "Yest Total Redo"
@@script/yest_redo

SET MARKUP HTML ON TABLE "class='awrdbcpu'" 
@@script/P "DB Time And DB CPU"
@@script/db_time_cpu.sql

SET MARKUP HTML ON TABLE "class='awr'"
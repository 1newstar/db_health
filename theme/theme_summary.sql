-- ********************************************************************
-- * Copyright Notice   : (c)2015,2016 Peng Liu.
-- * Filename           : theme_summary.sql
-- * Author             : Peng Liu
-- * Original           : 20151117
-- * Last Update        : 20160320
-- * Description        : display the  db summary info
-- *                      "report title" "instance" "hostinfo" "Yest Total Redo" "DB Time And DB CPU"
-- *                      ...
-- * Usage              : be called by db_health_check.sql
-- ********************************************************************

REM display the report title

@@script/tag/H1_title "HEALTH CHECK report for"

REM display the db summary info

@@script/instance.sql
@@script/hostinfo.sql

REM display the report summary

@@script/tag/H1 "Report Summary"

@@script/tag/P "Yest Total Redo"
@@script/yest_redo

SET MARKUP HTML ON TABLE "class='awrdbcpu'" 
@@script/tag/P "DB Time And DB CPU"
@@script/db_time_cpu.sql

SET MARKUP HTML ON TABLE "class='awr'"
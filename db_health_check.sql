-- ********************************************************************
-- * Copyright Notice   : (c)2015,2016 Peng Liu.
-- * Filename           : db_health_check.sql
-- * Author             : Peng Liu
-- * Original           : 20151118
-- * Last Update        : 20160520
-- * Description        : The main script to call
-- *                      To generate tody health report
-- *                      HTML format...
-- * Usage              : start db_health_check.sql
-- ********************************************************************


REM define the base path and the file path
@@base_var.sql
REM startup html
SET MARKUP HTML ON SPOOL ON PREFORMAT OFF ENTMAP OFF -
HEAD "<TITLE>Health Report for DB:&dbname,Inst:&instname</TITLE>  -
<STYLE type='text/css'>  -
body {font:bold 10pt Arial,Helvetica,Geneva,sans-serif;color:black; background:White;}  -
table	{border_collapse: collapse; }  -
th {font:bold 8pt Arial,Helvetica,Geneva,sans-serif; color:White; background:#0066CC;padding-left:4px; padding-right:4px;padding-bottom:2px}  -
td {font:8pt Arial,Helvetica,Geneva,sans-serif;color:black;background:#FFFFCC; vertical-align:top;}  -
tr:nth-child(even) td  {font:8pt Arial,Helvetica,Geneva,sans-serif;color:black;background:#FFFFCC; vertical-align:top;} -
tr:nth-child(odd) td {font:8pt Arial,Helvetica,Geneva,sans-serif;color:black;background:White;vertical-align:top;} -
a:-webkit-any-link {color: -webkit-link;text-decoration: underline;cursor: auto;}-
a.awr {font: bold 8pt Arial,Helvetica,sans-serif;color: #663300;vertical-align: top;margin-top: 0pt;margin-bottom: 0pt;}-
li {display: list-item;text-align: -webkit-match-parent;} -
li.awr {font: 8pt Arial,Helvetica,Geneva,sans-serif;color: black;background: White;} -
H1 {font: bold 18pt Arial,Helvetica,Geneva,sans-serif;color: #336699;background-color: White;margin-top: 5pt;margin-bottom: 5pt;} -
H3 {font: bold 16pt Arial,Helvetica,Geneva,sans-serif;color: #336699;background-color: White;margin-top: 5pt;margin-bottom: 5pt;} -
H1.title {font: bold 20pt Arial,Helvetica,Geneva,sans-serif;color: #336699;background-color: White;border-bottom: 1px solid #cccc99;margin-top: 0pt;margin-bottom: 0pt;padding: 0px 0px 0px 0px;}-
table.awrred td:last-child{text-align:right;} -
table.awrredf td:nth-child(12){text-align:right;} -
table.awrredmax td:nth-child(4){text-align:right;} -
div.header{display: block;-
border-bottom: 1px solid #3D6679;margin-bottom: 20px;}-
div.eventbegin{background-color:#0066CC;color: white;}-	
table.awrdbcpu td:last-child{text-align:right;} -   
</STYLE>" -
BODY  "border='0'   summary='Script output'" -
TABLE "class='awr'"
SET ECHO OFF
--SET FEEDBACK OFF
SET PAGESIZE 1400
SET termout off
set verify off
spool &report_file
PRO <div class='header'><H4>Author : &Author</h4> <h4>Date : &time</h4></div>

@@theme/theme_summary.sql

@@theme/theme_main_tree.sql

@@theme/theme_event.sql

@@theme/theme_tablespace.sql

@@theme/theme_objects.sql

@@theme/theme_statistics.sql

@@theme/theme_security.sql

@@theme/theme_redo.sql

@@theme/theme_rman.sql

@@theme/theme_archive.sql

@@theme/theme_flashback.sql

@@theme/theme_asm.sql

@@theme/theme_parameter.sql

@@script/tag/P "End of Report"
SET ECHO ON
SET FEEDBACK ON
spool off
exit

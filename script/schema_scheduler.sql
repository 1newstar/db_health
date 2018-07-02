select *
  from dba_scheduler_job_run_details a
 where a.owner = '&special_users'
   and trunc(a.actual_start_date) = trunc(sysdate)
 order by a.actual_start_date desc;
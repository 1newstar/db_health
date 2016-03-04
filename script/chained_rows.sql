select table_name,num_rows,chain_cnt From dba_tables Where owner not in ('SYS','SYSTEM') And chain_cnt<>0;

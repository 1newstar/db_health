select table_owner,
       table_name,
       count(1) "partition_count",
       max(substr(partition_name, 2)) "max_range_partition"
  from dba_tab_partitions
 where TABLE_OWNER in (&special_users)
 group by table_owner, table_name
 order by table_owner, table_name;

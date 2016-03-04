select owner,index_name,blevel,LEAF_BLOCKS,DISTINCT_KEYS,CLUSTERING_FACTOR from dba_indexes where blevel > 3;

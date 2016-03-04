select db.NAME,
       db.PLATFORM_NAME,
       os.cpus,
       os.cores,
       os.sockets,
       round(os.memory / 1024 / 1024 / 1024, 2) "Memory(GB)"
  from (select *
          from (select stat_name, value from v$osstat)
        pivot(sum(value)
           for stat_name in('NUM_CPUS' as cpus,
                           'NUM_CPU_CORES' as cores,
                           'NUM_CPU_SOCKETS' as sockets,
                           'PHYSICAL_MEMORY_BYTES' as memory))) os,
       v$database db;

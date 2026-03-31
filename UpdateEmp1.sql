-- Enable CDC at database level
USE demo;
EXEC sys.sp_cdc_enable_db;

-- Check if CDC enabled for DB
SELECT name, is_cdc_enabled 
FROM sys.databases 
WHERE name = 'demo';

-- Enable CDC for table
EXEC sys.sp_cdc_enable_table
    @source_schema = 'dbo',
    @source_name   = 'tes',
    @role_name     = NULL;

-- Check if CDC enabled for table
SELECT name, is_tracked_by_cdc
FROM sys.tables
WHERE name = 'tes';

-- List CDC tables created
SELECT * 
FROM cdc.change_tables;

-- Read CDC data
SELECT * 
FROM cdc.fn_cdc_get_all_changes_dbo_tes
(
    sys.fn_cdc_get_min_lsn('dbo_tes'),
    sys.fn_cdc_get_max_lsn(),
    'all'
);

-- Read net changes
SELECT * 
FROM cdc.fn_cdc_get_net_changes_dbo_tes
(
    sys.fn_cdc_get_min_lsn('dbo_tes'),
    sys.fn_cdc_get_max_lsn(),
    'all'
);

-- Check capture job
EXEC msdb.dbo.sp_help_job @job_name = 'cdc.demo_capture';

-- Check cleanup job
EXEC msdb.dbo.sp_help_job @job_name = 'cdc.demo_cleanup';

-- Enable capture job
EXEC sys.sp_cdc_enable_job @job_type = 'capture';

-- Enable cleanup job
EXEC sys.sp_cdc_enable_job @job_type = 'cleanup';

-- Check CDC enabled tables and columns
SELECT * FROM cdc.captured_columns;

-- Check LSN ranges
SELECT 
    * 
FROM cdc.lsn_time_mapping;

-- Disable CDC table
EXEC sys.sp_cdc_disable_table
    @source_schema = 'dbo',
    @source_name   = 'tes',
    @capture_instance = 'dbo_tes';

-- Disable CDC database
EXEC sys.sp_cdc_disable_db;


select 
A as Prd_A,
B as PRD_B,
C as PRD_C
from (select product, sales from TABLE) as pd
PIVOT 
(
sum(sales) for product in ([A],[B],[C]) 
)as P;
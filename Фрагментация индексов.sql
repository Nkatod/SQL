SELECT
	OBJECT_NAME(object_id) AS TableName, 
	object_id,
	index_id,
	partition_number,
	page_count, 
	partition_number, 
	index_type_desc,
	avg_fragmentation_in_percent
FROM sys.dm_db_index_physical_stats (DB_ID(), NULL, NULL , NULL, 'LIMITED')
WHERE index_id > 0 
	AND avg_fragmentation_in_percent > 5.0
	AND page_count > 128
ORDER BY avg_fragmentation_in_percent DESC
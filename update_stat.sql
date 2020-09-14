DECLARE @DateNow DATETIME
SELECT @DateNow = DATEADD(dd, 0, DATEDIFF(dd, 0, GETDATE()))

DECLARE @SQL NVARCHAR(MAX)
SELECT @SQL = (
    SELECT '
	UPDATE STATISTICS [' + SCHEMA_NAME(o.[schema_id]) + '].[' + o.name + '] [' + s.name + ']
		WITH FULLSCAN' + CASE WHEN s.no_recompute = 1 THEN ', NORECOMPUTE' ELSE '' END + ';'
	FROM sys.stats s WITH(NOLOCK)
	JOIN sys.objects o WITH(NOLOCK) ON s.[object_id] = o.[object_id]
	WHERE o.[type] IN ('U', 'V')
		AND o.is_ms_shipped = 0
		AND ISNULL(STATS_DATE(s.[object_id], s.stats_id), GETDATE()) <= @DateNow
    FOR XML PATH(''), TYPE).value('.', 'NVARCHAR(MAX)')

PRINT @SQL
EXEC sys.sp_executesql @SQL
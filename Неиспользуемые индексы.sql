
--USE [»мя Ѕазы];
SELECT        OBJECT_NAME(SI.object_id) AS [»м€ таблицы], SI.name AS [»м€ индекса] 
              --,SI.index_id AS indexid, SI.type_desc AS [Тип индекса]
FROM            sys.indexes AS SI INNER JOIN
                         sys.objects AS SO ON SO.object_id = SI.object_id
WHERE        (SI.object_id > 100) AND (SI.type_desc = 'NONCLUSTERED') AND (SI.index_id NOT IN
                             (SELECT        index_id
                               FROM            sys.dm_db_index_usage_stats AS S
                               WHERE        (object_id = SI.object_id) AND (SI.index_id = index_id) 
							   AND (database_id = 5))) -- ѕомен€йте id базы на свой
							--  AND OBJECT_NAME(SI.object_id) = ''
ORDER BY [»м€ таблицы], [»м€ индекса]
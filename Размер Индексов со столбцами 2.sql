SELECT        sys.tables.name AS Таблица, SUM(sys.columns.max_length) AS [Длинна индекса], i.name AS Индекс, sys.columns.name AS Столбец 
                        
FROM            sys.tables INNER JOIN
                         sys.indexes AS i INNER JOIN
                         sys.index_columns AS ic ON i.object_id = ic.object_id AND i.index_id = ic.index_id INNER JOIN
                         sys.columns ON ic.column_id = sys.columns.column_id AND ic.object_id = sys.columns.object_id ON sys.tables.object_id = i.object_id
						 --where sys.tables.name = ''
GROUP BY  sys.tables.name, i.name, sys.columns.name
ORDER BY Таблица,Индекс
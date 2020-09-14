SELECT TOP 10
 [Wait type] = wait_type,
 [Wait time (s)] = wait_time_ms / 1000,
 [% waiting] = CONVERT(DECIMAL(12,2), wait_time_ms * 100.0 
               / SUM(wait_time_ms) OVER()),
			   *
  FROM sys.dm_os_wait_stats
  WHERE wait_type NOT LIKE '%SLEEP%' 
  ORDER BY wait_time_ms DESC;

  
  SELECT  top 15 *
  FROM
  sys.dm_os_latch_stats
  ORDER BY wait_time_ms DESC;

-- i/o-�������� �� �����
SELECT TOP 10 DB_NAME(saf.dbid) AS [���� ������],
       saf.name AS [���������� ���],
       vfs.BytesRead/1048576 AS [��������� (��)],
       vfs.BytesWritten/1048576 AS [�������� (��)],
       saf.filename AS [���� � �����]
  FROM master..sysaltfiles AS saf
  JOIN ::fn_virtualfilestats(NULL,NULL) AS vfs ON vfs.dbid = saf.dbid AND
                                                  vfs.fileid = saf.fileid AND
                                                  saf.dbid NOT IN (1,3,4)
  ORDER BY vfs.BytesRead/1048576 + BytesWritten/1048576 DESC


-- i/o-�������� �� �����
SELECT SUBSTRING(saf.physical_name, 1, 1)    AS [����],
       SUM(vfs.num_of_bytes_read/1048576)    AS [��������� (��)],
       SUM(vfs.num_of_bytes_written/1048576) AS [�������� (��)]
  FROM sys.master_files AS saf
  JOIN sys.dm_io_virtual_file_stats(NULL,NULL) AS vfs ON vfs.database_id = saf.database_id AND
                                                         vfs.file_id = saf.file_id AND
                                                         saf.database_id NOT IN (1,3,4) AND
                                                         saf.type < 2
  GROUP BY SUBSTRING(saf.physical_name, 1, 1)
  ORDER BY [����]
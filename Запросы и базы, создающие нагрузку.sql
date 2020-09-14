Use dblf_test11

IF EXISTS ( SELECT  Name

            FROM    tempdb..sysobjects

            WHERE   name LIKE '#TTT1%' )
    DROP TABLE #TTT1

	IF EXISTS ( SELECT  Name

            FROM    tempdb..sysobjects

            WHERE   name LIKE '#TTT2%' )
    DROP TABLE #TTT2

SELECT 
 SUM(qs.total_physical_reads) as physical_reads,
 SUM(qs.total_logical_reads) as logical_reads 
 into #TTT1 
 FROM 
	 ( select top 100000 * from 
	 sys.dm_exec_query_stats qs 
	 where qs.last_execution_time > (CURRENT_TIMESTAMP - '01:00:00.000') 
	 order by qs.total_physical_reads desc ) as qs; 
	 
 select top 100 
 (qs.total_physical_reads) as physical_reads,
  (qs.total_logical_reads) as logical_reads,
   qp.query_plan,
    st.text,
	 dtb.name,
	  qs.*,
	   st.dbid
	    INTO #TTT2 
		FROM sys.dm_exec_query_stats qs
		 CROSS APPLY sys.dm_exec_query_plan(qs.plan_handle) qp 
		 CROSS APPLY sys.dm_exec_sql_text(qs.sql_handle) st 
		 left outer join sys.databases as dtb 
		 on st.dbid = dtb.database_id 
		 where qs.last_execution_time > (CURRENT_TIMESTAMP - '01:00:00.000') 
		 order by qs.total_physical_reads desc;
		 
select 
Case when T1.physical_reads = 0 Then 0 else (T2.physical_reads*100/T1.physical_reads) END as percent_physical_reads,
 (T2.logical_reads*100/T1.logical_reads) as percent_logical_reads,
  T2.* 
  from
#TTT2 as T2 
INNER JOIN #TTT1 as T1 
ON 1=1 
order by T2.total_physical_reads desc;
 drop table #TTT2;
 drop table #TTT1;

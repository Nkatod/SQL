/****** Скрипт для команды SelectTopNRows из среды SSMS  ******/
DECLARE @datetime2 datetime2(4) = '4018-01-01 00:00:00';  
 Delete FROM [db_log_archive].[dbo].[_Reference10]  
 WHERE
  [_Fld11] > @datetime2;


SELECT * into #tt1
      
  FROM [db_log_archive].[dbo].[_Reference10] as T1

  WHERE
  [_Fld11] > @datetime2;
  --group by [_IDRRef]


  Select Count([_Reference10_IDRRef]) 
  from [db_log_archive].[dbo].[_Reference10_VT17] 
  WHERE [_Reference10_IDRRef] IN   
    (SELECT [_IDRRef]   
     FROM #tt1);  

  Delete top (10000000) FROM [db_log_archive].[dbo].[_Reference10_VT17]   
WHERE [_Reference10_IDRRef] IN   
    (SELECT [_IDRRef]   
     FROM #tt1);



  Drop table #tt1
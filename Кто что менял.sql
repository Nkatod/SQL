USE [db_log]
GO

SELECT [_IDRRef]
      ,[_Version]
      ,[_Marked]
      ,[_PredefinedID]
      ,[_Fld11]
      ,[_Fld12]
      ,[_Fld13]
      ,[_Fld14]
      ,[_Fld15]
      ,[_Fld16]
	  , td.*
	  --into #tt
  FROM [dbo].[_Reference10] tm
  join [dbo].[_Reference10_VT17] td 
  on td._Reference10_IDRRef = tm._IDRRef
  where tm._Fld12 like '%e58977a2-3a92-4895-ab3c-7c62a5a2fb3b,10341%'
  and _Fld22 = 'Îğãàíèçàöèÿ'
  and td._Fld24 =  '{"S","ËÅÊÑÒÎĞ ÎÎÎ"}'
  and tm._Fld11 >= convert(date,'01.06.4018')

  
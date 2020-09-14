--SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
DECLARE
      @DataStart date = DATEFROMPARTS ( 4018, 04, 01 ),
	  @DataEnd  date = DATEFROMPARTS ( 4018, 05, 01 )


--1)
SELECT    _IDRRef, _Marked, _PredefinedID, _Fld11, _Fld12, _Fld13, _Fld14, _Fld15, _Fld16
INTO            [#PerenosArchive]
FROM         _Reference10
WHERE     (_Fld11 >= @DataStart) AND (_Fld11 < @DataEnd)



--2)
--Insert  INTO [SRV-DEV\SQL2012].[db_log_archive].[dbo]._Reference10 (T1._IDRRef, T1._Marked, T1._PredefinedID, T1._Fld11, T1._Fld12, T1._Fld13, T1._Fld14, T1._Fld15, T1._Fld16)
--   select * from #PerenosArchive as T1
--   LEFT OUTER JOIN [SRV-DEV\SQL2012].[db_log_archive].[dbo]._Reference10 as T2
--   on T1._IDRRef = T2._IDRRef 
--   where T2._IDRRef is NULL


--3)
select [_Reference10_IDRRef], [_KeyField],[_LineNo18],[_Fld19],[_Fld20],[_Fld21],[_Fld22],[_Fld23],[_Fld24]
INTO #PerenosArchiveDop
from [dbo].[_Reference10_VT17] as T1
Join #PerenosArchive as T2 
on T1.[_Reference10_IDRRef] = T2.[_IDRRef]

--4) 
--Insert INTO [SRV-DEV\SQL2012].[db_log_archive].[dbo].[_Reference10_VT17] ([T1._Reference10_IDRRef], [T1._KeyField],[T1._LineNo18],[T1._Fld19],[T1._Fld20],[T1._Fld21],[T1._Fld22],[T1._Fld23],[T1._Fld24])
--   select * from #PerenosArchiveDop AS T1
--      LEFT OUTER JOIN [SRV-DEV\SQL2012].[db_log_archive].[dbo].[_Reference10_VT17]  as T2
--		on T1._Reference10_IDRRef = T2._Reference10_IDRRef 
--			and T1._KeyField = T2._KeyField
--			and T1._LineNo18 = T2._LineNo18
--			and T1._Fld19 = T2._Fld19
--			and T1._Fld20 = T2._Fld20
--			and T1._Fld21 = T2._Fld21
--			and T1._Fld22 = T2._Fld22
--   where T2._Reference10_IDRRef is NULL


----5)
--DELETE FROM [dbo].[_Reference10_VT17]  
--WHERE [_Reference10_IDRRef] in (select [_Reference10_IDRRef] from #PerenosArchiveDop group by [_Reference10_IDRRef])

--6)
--DELETE FROM [dbo].[_Reference10]  
--WHERE [_IDRRef] in (select [_IDRRef] from #PerenosArchive group by [_IDRRef])

--7)
--drop table #PerenosArchive 
--drop table #PerenosArchiveDop 

SELECT  Count([_Fld11402])
  FROM [dblf_test11].[dbo].[_InfoRg11401]
  where [_Fld21171] =''

SELECT  top 3000000 * into  #tt1
  FROM [dblf_test11].[dbo].[_InfoRg11401]
 
  where [_Fld21171] ='' 

  --drop table #tt1

  --cast(ABS(CHECKSUM(NEWID())) as nvarchar(10)) 
  --select * from #tt1

update [dblf_test11].[dbo].[_InfoRg11401]
set [_Fld21172] = #tt1.[_Fld11402]
	,[_Fld21173] = #tt1.[_Fld11403]
	,[_Fld21171] = cast(ABS(CHECKSUM(NEWID())) as nvarchar(10)) 

from #tt1 
where #tt1.[_Fld11402] = [dblf_test11].[dbo].[_InfoRg11401].[_Fld11402]
and #tt1.[_Fld11403] = [dblf_test11].[dbo].[_InfoRg11401].[_Fld11403]
and #tt1.[_Fld12086RRef] = [dblf_test11].[dbo].[_InfoRg11401].[_Fld12086RRef]
and #tt1.[_Fld17563RRef] = [dblf_test11].[dbo].[_InfoRg11401].[_Fld17563RRef]

drop table #tt1

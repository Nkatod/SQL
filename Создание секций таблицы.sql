alter database HWC_DATA_LANCET add filegroup HWCUPDATE2012;
alter database HWC_DATA_LANCET add filegroup HWCUPDATE2013;
alter database HWC_DATA_LANCET add filegroup HWCUPDATE2014;
alter database HWC_DATA_LANCET add filegroup HWCUPDATE2015;
alter database HWC_DATA_LANCET add filegroup HWCUPDATE2016;
alter database HWC_DATA_LANCET add filegroup HWCUPDATE2017;
alter database HWC_DATA_LANCET add filegroup HWCUPDATE2018;
alter database HWC_DATA_LANCET add filegroup HWCUPDATE2019;
alter database HWC_DATA_LANCET add filegroup HWCUPDATE2020;
alter database HWC_DATA_LANCET add filegroup HWCUPDATE2021;
alter database HWC_DATA_LANCET add filegroup HWCUPDATE2022;
alter database HWC_DATA_LANCET add filegroup HWCUPDATE2023;
go
 
alter database HWC_DATA_LANCET
add file  ( name = 'HWCUPDATE2012',  filename = 'D:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\Data\HWCUPDATE2012.ndf'  ) to filegroup HWCUPDATE2012;
alter database HWC_DATA_LANCET
add file  ( name = 'HWCUPDATE2013',  filename = 'D:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\Data\HWCUPDATE2013.ndf'  ) to filegroup HWCUPDATE2013;
alter database HWC_DATA_LANCET
add file  ( name = 'HWCUPDATE2014',  filename = 'D:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\Data\HWCUPDATE2014.ndf'  ) to filegroup HWCUPDATE2014;
alter database HWC_DATA_LANCET
add file  ( name = 'HWCUPDATE2015',  filename = 'D:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\Data\HWCUPDATE2015.ndf'  ) to filegroup HWCUPDATE2015;
alter database HWC_DATA_LANCET
add file  ( name = 'HWCUPDATE2016',  filename = 'D:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\Data\HWCUPDATE2016.ndf'  ) to filegroup HWCUPDATE2016;
alter database HWC_DATA_LANCET
add file  ( name = 'HWCUPDATE2017',  filename = 'D:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\Data\HWCUPDATE2017.ndf'  ) to filegroup HWCUPDATE2017;
alter database HWC_DATA_LANCET
add file  ( name = 'HWCUPDATE2018',  filename = 'D:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\Data\HWCUPDATE2018.ndf'  ) to filegroup HWCUPDATE2018;
alter database HWC_DATA_LANCET
add file  ( name = 'HWCUPDATE2019',  filename = 'D:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\Data\HWCUPDATE2019.ndf'  ) to filegroup HWCUPDATE2019;
alter database HWC_DATA_LANCET
add file  ( name = 'HWCUPDATE2020',  filename = 'D:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\Data\HWCUPDATE2020.ndf'  ) to filegroup HWCUPDATE2020;
alter database HWC_DATA_LANCET
add file  ( name = 'HWCUPDATE2021',  filename = 'D:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\Data\HWCUPDATE2021.ndf'  ) to filegroup HWCUPDATE2021;
alter database HWC_DATA_LANCET
add file  ( name = 'HWCUPDATE2022',  filename = 'D:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\Data\HWCUPDATE2022.ndf'  ) to filegroup HWCUPDATE2022;
alter database HWC_DATA_LANCET
add file  ( name = 'HWCUPDATE2023',  filename = 'D:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\Data\HWCUPDATE2023.ndf'  ) to filegroup HWCUPDATE2023;


create partition function pf_export_lancetAll_UPDATE_dt (datetime)
as range right
for values ( '20130101', '20140101', '20150101', '20160101'
           , '20170101', '20180101', '20190101', '20200101'
           , '20210101', '20220101', '20230101', '20240101'
           , '20250101'
           );
go

create partition scheme ps_export_lancetAll_UPDATE_dt
as partition pf_export_lancetAll_UPDATE_dt
to ( [primary], HWCUPDATE2012, HWCUPDATE2013, HWCUPDATE2014, HWCUPDATE2015, HWCUPDATE2016,
HWCUPDATE2017, HWCUPDATE2018, HWCUPDATE2019, HWCUPDATE2020, HWCUPDATE2021, HWCUPDATE2022, HWCUPDATE2023, [primary] );
go


  CREATE TABLE CReference10
( 

 _IDRRef binary(16) PRIMARY KEY,
 Fld11 datetime2(0) NOT NULL,
 Fld12 nvarchar(100) NOT NULL,
 UserID smallint NOT NULL,
 ComputerID smallint NOT NULL, 
 OperationID smallint NOT NULL

 )

CREATE TABLE UsersName
( 
 UserID smallint PRIMARY KEY IDENTITY(1, 1),
 UserName nvarchar(100) NOT NULL
)

CREATE TABLE ComputerNames
( 
ComputerID smallint PRIMARY KEY IDENTITY(1, 1),
ComputerName nvarchar(100) NOT NULL
)

CREATE TABLE OperationNames
( 
OperationID smallint PRIMARY KEY IDENTITY(1, 1),
OperationName nvarchar(100) NOT NULL
)

--Insert new users
Insert dbo.UsersName (UserName)
Select DISTINCT ST.UserName
from 
(SELECT Distinct
      _Fld13 as UserName
  FROM dbo._Reference10) AS ST
 Left outer join
dbo.UsersName AS TT
ON
ST.UserName = TT.UserName
where TT.UserName is null;

--Insert new computers
Insert dbo.ComputerNames (ComputerName)
Select DISTINCT ST.ComputerName
from 
(SELECT Distinct
      _Fld14 as ComputerName
  FROM dbo._Reference10) AS ST
 Left outer join
dbo.ComputerNames AS TT
ON
ST.ComputerName = TT.ComputerName
where TT.ComputerName is null;

--Insert new operations
Insert dbo.OperationNames (OperationName)
Select DISTINCT ST.OperationName
from 
(SELECT Distinct
      _Fld15 as OperationName
  FROM dbo._Reference10) AS ST
 Left outer join
dbo.OperationNames AS TT
ON
ST.OperationName = TT.OperationName
where TT.OperationName is null;


Insert CReference10( _IDRRef, Fld11, Fld12, UserID, ComputerID, OperationID )
SELECT [_IDRRef]
      ,[_Fld11]
      ,[_Fld12]
      ,TUsers.UserID as UserID
      ,TComputers.ComputerID as ComputerID
      ,TOperations.OperationID as OperationID
  FROM db_log_archive.[dbo].[_Reference10] AS SourceT
  INNER JOIN dbo.UsersName AS TUsers ON SourceT._Fld13 = TUsers.UserName
  INNER JOIN dbo.ComputerNames AS TComputers ON SourceT._Fld14 = TComputers.ComputerName
  INNER JOIN dbo.OperationNames AS TOperations ON SourceT._Fld15 = TOperations.OperationName







CREATE TABLE CReference10_VT17
( 
 _Reference10_IDRRef binary(16) NOT NULL,
 _LineNo18 numeric(5,0) NOT NULL,
 TypeID smallint NOT NULL,
 TableID int NOT NULL,
 Fld21 numeric(7,0) NOT NULL, 
 PropertyID int NOT NULL,
 Fld23 nvarchar(1000) NOT NULL,
 Fld24 nvarchar(1000) NOT NULL
 )
 ALTER TABLE dbo.CReference10_VT17   
ADD CONSTRAINT PK_IDref_LineNo PRIMARY KEY CLUSTERED (_Reference10_IDRRef, _LineNo18); 

  CREATE TABLE ChangeTypes
( 
TypeID smallint PRIMARY KEY IDENTITY(1, 1),
TypeName nvarchar(100) NOT NULL
)
  CREATE TABLE TableNames
( 
TableID int PRIMARY KEY IDENTITY(1, 1),
TableName nvarchar(100) NOT NULL
)
  CREATE TABLE PropertyNames
( 
PropertyID int PRIMARY KEY IDENTITY(1, 1),
PropertyName nvarchar(100) NOT NULL
)

--Insert new type
Insert dbo.ChangeTypes (TypeName)
Select DISTINCT ST.TypeName
from 
(SELECT Distinct
      _Fld19 as TypeName
  FROM dbo._Reference10_VT17) AS ST
 Left outer join
dbo.ChangeTypes AS TT
ON
ST.TypeName = TT.TypeName
where TT.TypeName is null;

--Insert new table name
Insert dbo.TableNames (TableName)
Select DISTINCT ST.TableName
from 
(SELECT Distinct
      _Fld20 as TableName
  FROM dbo._Reference10_VT17) AS ST
 Left outer join
dbo.TableNames AS TT
ON
ST.TableName = TT.TableName
where TT.TableName is null;

--Insert new property name
Insert dbo.PropertyNames (PropertyName)
Select DISTINCT ST.PropertyName
from 
(SELECT Distinct
      _Fld22 as PropertyName
  FROM dbo._Reference10_VT17) AS ST
 Left outer join
dbo.PropertyNames AS TT
ON
ST.PropertyName = TT.PropertyName
where TT.PropertyName is null;





 Insert CReference10_VT17( _Reference10_IDRRef, _LineNo18, TypeID, TableID, Fld21, PropertyID, Fld23, Fld24 )
 SELECT
        _Reference10_IDRRef
      ,_LineNo18
      ,TChangeTypes.TypeID as TypeID
      ,TTableNames.TableID as TableID
	  ,_Fld21 as Fld21
      ,TPropertyNames.PropertyID as PropertyID
      ,_Fld23 as Fld23
      ,_Fld24 as Fld24
  FROM dbo._Reference10_VT17 AS SourceT
  INNER JOIN dbo.ChangeTypes AS TChangeTypes ON SourceT._Fld19 = TChangeTypes.TypeName
  INNER JOIN dbo.TableNames  AS TTableNames ON SourceT._Fld20 = TTableNames.TableName
  INNER JOIN dbo.PropertyNames AS TPropertyNames ON SourceT._Fld22 = TPropertyNames.PropertyName
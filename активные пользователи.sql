select CAST(db_name(dbid) AS NVARCHAR(20)) as db, spid as idproc, loginame, program_name, status
from   sys.sysprocesses
Where CAST(db_name(dbid) AS NVARCHAR(20))  = 'dblf_test11'

--kill 84
--��������� �� �������: ���� Free Pages ������ 300, ����� ��� ����� ����� � ������������������ �������: 

SELECT * FROM sys.sysperfinfo  where counter_name like 'Page Writes%' or counter_name like 'Page reads%' 
or counter_name like 'lazy%' or counter_name like 'Page Life%' or counter_name like 'Memory Grants Pending%'
or (counter_name = 'Free pages' and [object_name] LIKE '%BUFFER MANAGER%')
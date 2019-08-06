
USE master;


RESTORE DATABASE Quali
FROM DISK = 'c:\DBs\Quali.bak'
   WITH REPLACE, FILE=1

RESTORE DATABASE QualiInsight
FROM DISK = 'c:\DBs\QualiInsight.bak'
   WITH REPLACE, FILE=1

RESTORE DATABASE QualiResults
FROM DISK = 'c:\DBs\QualiResults.bak'
   WITH REPLACE, FILE=1



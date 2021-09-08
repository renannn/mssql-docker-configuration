# wait for the SQL Server to come up
sleep 90s
#run the setup script to create the DB and the schema in the DB
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P Testing22@@ -i /usr/work/setup.sql
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P Testing22@@ -i /usr/work/CreateTables.sql
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P Testing22@@ -i /usr/work/CreateJobBackupCompleto.sql
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P Testing22@@ -i /usr/work/CreateJobBackupDiferencial.sql

# import the data from the csv file
/opt/mssql-tools/bin/bcp heroes.dbo.HeroValue in "/usr/work/heroes.csv" -c -t',' -S localhost -U SA -P Testing22@@
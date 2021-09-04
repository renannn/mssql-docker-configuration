SqlPassword="Testing22@@"
# wait for the SQL Server to come up
sleep 90s
#run the setup script to create the DB and the schema in the DB
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P $SqlPassword -i setup.sql
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P $SqlPassword -i CreateTables.sql
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P $SqlPassword -i CreateJobBackupCompleto.sql
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P $SqlPassword -i CreateJobBackupDiferencial.sql

# import the data from the csv file
/opt/mssql-tools/bin/bcp heroes.dbo.HeroValue in "/usr/work/heroes.csv" -c -t',' -S localhost -U SA -P $SqlPassword
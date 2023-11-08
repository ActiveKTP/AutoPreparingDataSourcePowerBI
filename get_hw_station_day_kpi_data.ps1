#Install-Module -Name SimplySql -Force

#Get-Module SimplySQL

Import-Module SimplySql

# MySQL database connection parameters
$db_name = "db_name"
$db_host = "db_host"
$db_username = "db_username"
$db_password = "db_password"

# CSV Path
$path = "$PATH\data\account_data.csv"

$db_password = ConvertTo-SecureString $db_password -AsPlainText -Force
$credential = New-Object System.Management.Automation.PSCredential ($db_username, $db_password)

# SQL query
$query = 'SELECT ... ' 

# Connect to the database and fetch data
Open-MySqlConnection -Server $db_host -Port 3306 -Database $db_name -Credential $credential

# Query
Invoke-SqlQuery -Query $query | Export-Csv -Path $path -Encoding UTF8 -NoTypeInformation
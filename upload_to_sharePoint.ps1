#First time tasks ######
#Install -Module SharePointPnPPowerShellOnline
# #Password
#$password_ = "your password"
#$password = ConvertTo-SecureString $password_ -AsPlainText -Force

# #UPN to login to 365
# $upn = "your login"

# #Automated login
#$appcredentials = New-Object System.Management.Automation.PSCredential($upn, $password)

# #store credential
# Add-PnPStoredCredential -Name $url -Username $appcredentials.UserName -Password $appcredentials.Password
#########################


Import-Module SharePointPnPPowerShellOnline

# This sharepoint site url
$URL = "my_sharepoint_site"

# Login to sharepointonline
Connect-PnPOnline $URL

$sourceDirectory = $PATH

$targetFloder = "Shared Documents/PowerBIReportSource"

$csvFiles = Get-ChildItem -Path $sourceDirectory -Filter *.csv

foreach ($csvFile in $csvFiles) {
    Add-PnPFile -Folder $targetFloder -Path $csvFile.FullName
}

# Disconnect from the SharePoint site
Disconnect-PnPOnline
 


####################################################
##  Export AD users to a .csv file.               ##
##                                                ##
##  NOTES:                                        ##
##  Author: Federico Jose                         ##
##  Create: 20 Jun 2022                           ##
##                                                ##
##  Modified:                                     ##
##  Version 1.0 - Initial Script Creation         ##
####################################################

#Create a variable for the date stamp in the log file
$LogDate = get-date -f yyyyMMddhhmm

#Exporting AD users to a .csv file.
$csvfile = ".\ADUsers_$logDate.csv"

Import-Module ActiveDirectory

$SearchBase = "dc=xyz, dc=com"

$GetAdminact = Get-Credential

$ADServer = Read-Host -Prompt 'AD Server'

$AllADUsers = Get-ADUser -server $ADServer `
-Credential $GetAdminact -searchbase $SearchBase `
-Filter * -Properties * | Where-Object {$_.info -NE 'Migrated'}

$AllADUsers |
Select-Object @{Label = "First Name";Expression = {$_.GivenName}},
@{Label = "Last Name";Expression = {$_.Surname}},
@{Label = "Display Name";Expression = {$_.DisplayName}},
@{Label = "Logon Name";Expression = {$_.sAMAccountName}},
@{Label = "Full address";Expression = {$_.StreetAddress}},
@{Label = "City";Expression = {$_.City}},
@{Label = "State";Expression = {$_.st}},
@{Label = "Post Code";Expression = {$_.PostalCode}},
@{Label = "Country/Region";Expression = {if (($_.Country -eq 'US')  ) {'United States'} Else {''}}},
@{Label = "Job Title";Expression = {$_.Title}},
@{Label = "Company";Expression = {$_.Company}},
@{Label = "Directorate";Expression = {$_.Description}},
@{Label = "Department";Expression = {$_.Department}},
@{Label = "Office";Expression = {$_.OfficeName}},
@{Label = "Phone";Expression = {$_.telephoneNumber}},
@{Label = "Email";Expression = {$_.Mail}},
@{Label = "Manager";Expression = {ForEach-Object{(Get-AdUser $_.Manager -server $ADServer -Properties DisplayName).DisplayName}}},
@{Label = "Account Status";Expression = {if (($_.Enabled -eq 'TRUE')  ) {'Enabled'} Else {'Disabled'}}}, # the 'if statement# replaces $_.Enabled
@{Label = "Last LogOn Date";Expression = {$_.lastlogondate}} |

#Export CSV report

Export-Csv -Path $csvfile -NoTypeInformation
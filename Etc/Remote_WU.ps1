
####################################################
##  Install Windows Updates on Remote             ##
##  Computers with PowerShell                     ##
##                                                ##
##  NOTES:                                        ##
##  Author: Federico Jose                         ##
##  Create: 19 Jul 2022                           ##
##                                                ##
##  Modified:                                     ##
##  Version 1.0 - Initial Script Creation         ##
####################################################

param(
[string]$Server
)

$Creds = Get-Credential
#Create a variable for the date stamp in the log file
$LogDate = get-date -f yyyyMMddhhmm
$lf = ".\Windows10Upgrade.exe"
$rf = "C:\Temp\Windows10Upgrade.exe"
$dc = New-PSSession -ComputerName $Server -Credential $Creds

Get-PSSession
Copy-Item -Path $lf -Destination $rf -ToSession $dc
Write-Output "$lf Copied"

#Starting Remote WU
#Invoke-Command -Session $dc -ScriptBlock { Start-Process "C:\Temp\Windows10Upgrade.exe"}

Invoke-WUInstall -ComputerName $Server -Script {
    Import-Module PSWindowsUpdate; Get-WUInstall -AcceptAll -AutoReboot | Out-File C:\Temp\PSWindowsUpdate.log 
    } -Confirm:$false -Verbose -SkipModuleTest –RunNow

$Output = Write-Output C:\Temp\PSWindowsUpdate.log 
Write-Output "$LogDate $Output $Server Windows 10 Upgrade Installed Succesfully" >> ".\Windows10Upgrade.log"

Remove-PSSession -Session $dc

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

Invoke-WUInstall -ComputerName $Server -Script {
    Import-Module PSWindowsUpdate; Get-WUInstall -AcceptAll -AutoReboot | Out-File C:\Temp\PSWindowsUpdate.log 
    } -Confirm:$false -Verbose -SkipModuleTest –RunNow

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
$lf = ".\Windows10Upgrade.exe"
$rf = "C:\Temp\Windows10Upgrade.exe"
$dc = New-PSSession -ComputerName $Server -Credential $Creds

Get-PSSession
Copy-Item -Path $lf -Destination $rf -ToSession $dc
Write-Output $lf + ' Copied'

Invoke-Command -Session $dc -ScriptBlock {                                         
                                         }




Write-Output $Server + " Windows 10 Upgrade Installed Succesfully" >> ".\Windows10Upgrade.log"

Remove-PSSession -Session $dc



#Invoke-WUInstall -ComputerName $Server -Script {
#    Import-Module PSWindowsUpdate; Get-WUInstall -AcceptAll -AutoReboot | Out-File C:\Temp\PSWindowsUpdate.log 
#    } -Confirm:$false -Verbose -SkipModuleTest –RunNow
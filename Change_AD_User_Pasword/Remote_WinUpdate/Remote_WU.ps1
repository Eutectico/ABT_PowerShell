
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

#$Targets = "PC1-name", "PC2-name"
param(
[string]$Server
)


$Creds = Get-Credential
#Create a variable for the date stamp in the log file
$LogDate = get-date -f yyyyMMddhhmm
$dc = New-PSSession -ComputerName $Server -Credential $Creds

Get-PSSession

Invoke-Command -Session $dc -ScriptBlock  {
    If ($null -eq (Get-Module -Name PSWindowsUpdate -ListAvailable) ) {
        Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force
        Install-Module PSWindowsUpdate -Force
        Import-Module PSWindowsUpdate
        Get-WindowsUpdate | Out-File C:\Temp\PSWindowsUpdate.log        
    }
    Install-WindowsUpdate -AcceptAll -AutoReboot -Verbose | Out-File C:\Temp\PSWindowsUpdate_$LogDate.log
} >> ".\Windows10Upgrade.log"
Write-Output "$LogDate $Output $Server Windows 10 Upgrade Installed Succesfully" >> ".\Windows10Upgrade.log"

Remove-PSSession -Session $dc
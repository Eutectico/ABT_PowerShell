####################################################
##  Get PC Administrator Password from LAPS       ##
##                                                ##
##  NOTES:                                        ##
##  Author: Federico Jose                         ##
##  Create: 21 Jun 2022                           ##
##                                                ##
##  Modified:                                     ##
##  Version 1.0 - Initial Script Creation         ##
####################################################

$Client = Read-Host -Prompt 'Computer Name'
$Computers = Get-AdmPwdPassword -ComputerName $Client 
Write-Output $computers | Select-Object -Property Password | format-table -hidetableheaders

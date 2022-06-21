####################################################
##  Force PC Shutdown                             ##
##                                                ##
##  NOTES:                                        ##
##  Author: Federico Jose                         ##
##  Create: 21 Jun 2022                           ##
##                                                ##
##  Modified:                                     ##
##  Version 1.0 - Initial Script Creation         ##
####################################################

$Client = Read-Host -Prompt 'Computer Name'
$Creds = Get-Credential localhost\administrator
Stop-Computer -ComputerName $Client -Force -Credential $Creds 


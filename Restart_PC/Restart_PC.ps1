####################################################
##  Force Remote PC Restart                       ##
##                                                ##
##  NOTES:                                        ##
##  Author: Federico Jose                         ##
##  Create: 21 Jun 2022                           ##
##                                                ##
##  Modified:                                     ##
##  Version 1.0 - Initial Script Creation         ##
####################################################


$Creds = Get-Credential
$Client = Read-Host -Prompt 'Computer Name'
Restart-Computer -ComputerName $Client -Credential $Creds -Force
####################################################
##  Automate Remote PSSEssion                     ##
##                                                ##
##  NOTES:                                        ##
##  Author: Federico Jose                         ##
##  Create: 26 Jun 2022                           ##
##                                                ##
##  Modified:                                     ##
##  Version 1.0 - Initial Script Creation         ##
####################################################

$client = Read-Host -Prompt 'Remote Computer Name'
$cred = Get-Credential
$dc = New-PSSEssion $client -Credential $cred
Enter-PSSession $dc

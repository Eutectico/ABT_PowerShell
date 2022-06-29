####################################################
##  Copy Remotefile to Local PC                   ##
##                                                ##
##  NOTES:                                        ##
##  Author: Federico Jose                         ##
##  Create: 27 Jun 2022                           ##
##                                                ##
##  Modified:                                     ##
##  Version 1.0 - Initial Script Creation         ##
####################################################

$Creds = Get-Credential

$Client = Read-Host -Prompt 'Computer Name'

$dc = New-PSSession -ComputerName $Client -Credential $Creds

$rf = Read-Host -Prompt 'Remote File'
$lf= Read-Host -Prompt 'Local File'

Get-PSSession

Copy-Item -Path $rf -Destination $lf -FromSession $dc

Write-Output $rf + ' Copied'

Remove-PSSession -Session $dc

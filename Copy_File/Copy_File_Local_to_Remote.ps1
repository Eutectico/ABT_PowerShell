####################################################
##  Copy Localfile to Remote PC                   ##
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

$lf= Read-Host -Prompt 'Local File'
$rf = Read-Host -Prompt 'Remote File'

Get-PSSession

Copy-Item -Path $lf -Destination $rf -ToSession $dc

Write-Output $lf + ' Copied'

Remove-PSSession -Session $dc

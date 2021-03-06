####################################################
##  Remote Microsoft SilverLight Uninstall        ##
##                                                ##
##  NOTES:                                        ##
##  Author: Federico Jose                         ##
##  Create: 12 Jul 2022                           ##
##                                                ##
##  Modified:                                     ##
##  Version 1.1 - Initial Script Creation         ##
####################################################


$Creds = Get-Credential
$Client = Read-Host -Prompt 'Computer Name'
$s = New-PSSession -ComputerName $Client -Credential $Creds

Invoke-Command -Session $s -ScriptBlock {$app = Get-WmiObject Win32_Product | Where-Object {$_.name -eq "Microsoft Silverlight"}
                                        Write-Output $app
                                         $app.Uninstall()}

Remove-PSSession -Session $s

####################################################
##  Remote Microsoft SilverLight Uninstall        ##
##                                                ##
##  NOTES:                                        ##
##  Author: Federico Jose                         ##
##  Create: 12 Jul 2022                           ##
##                                                ##
##  Modified:                                     ##
##  Version 1.0 - Initial Script Creation         ##
####################################################


$Creds = Get-Credential
$Client = Read-Host -Prompt 'Computer Name'
$s = New-PSSession -ComputerName $Client -Credential $Creds

#Invoke-Command -Session $s {wmic product where caption='Microsoft SilverLight' call uninstall}

Invoke-Command -Session $s -ScriptBlock {$app = Get-WmiObject Win32_Product | where {$_.name -eq "Microsoft Silverlight"}
                                        echo $app
                                         $app.Uninstall()}

Remove-PSSession -Session $s

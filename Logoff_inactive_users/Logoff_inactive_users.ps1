####################################################
##  Logoff inactive users from a Server           ##
##                                                ##
##  NOTES:                                        ##
##  Author: Federico Jose                         ##
##  Create: 06 Jul 2022                           ##
##                                                ##
##  Modified:                                     ##
##  Version 1.0 - Initial Script Creation         ##
####################################################

$Creds = Get-Credential
$Client = Read-Host -Prompt 'Computer Name'

$MYSESSION = New-PSSession -ComputerName $Client -Credential $Creds

Get-PSSession

Invoke-Command -ScriptBlock { 
    $isession = query session | Select-String "Getr." | Select-String -notmatch "services"
    if ($isession){
        $isession | % {
            logoff ($_.tostring() -split ' +')[2] /server:localhost 
        } 
    }
} -Session $MYSESSION

Remove-PSSession -Session $MYSESSION
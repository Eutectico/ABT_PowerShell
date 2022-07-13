####################################################
##  Reset AD users Password                       ##
##                                                ##
##  NOTES:                                        ##
##  Author: Federico Jose                         ##
##  Create: 13 Jul 2022                           ##
##                                                ##
##  Modified:                                     ##
##  Version 1.0 - Initial Script Creation         ##
####################################################

param(
[string]$user
)

Write-Host $user

$newpwd = ConvertTo-SecureString -String "P@ssw0rd" -AsPlainText -Force

ForEach-Object {Set-ADUser -Identity $user -PasswordNeverExpires:$FALSE}
Set-ADAccountPassword $user -NewPassword $newpwd -Reset -PassThru | Set-ADuser -ChangePasswordAtLogon $True 

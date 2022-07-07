####################################################
##  Script for deleting a line containing a       ##
##  certain pattern from a file                   ##
##                                                ##
##  NOTES:                                        ##
##  Author: Federico Jose                         ##
##  Create: 07 Jul 2022                           ##
##                                                ##
##  Modified:                                     ##
##  Version 1.0 - Initial Script Creation         ##
####################################################

$Orgfile = Read-Host -Prompt 'Original File'
$newfile = Read-Host -Prompt 'New File'
$pattern = Read-Host -Prompt 'Pattern'


Get-Content $Orgfile | Select-String -pattern $pattern -NotMatch | Set-Content $newfile



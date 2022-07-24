@echo on 

FOR /F %%i in (PCList.txt) do ( 

echo __________________________________________________________________________________ >> ./Windows10Upgrade.log
echo PC-Name %%i >> ./Windows10Upgrade.log 
powershell .\Remote_WU.ps1 "%%i" >> ./Windows10Upgrade.log
) 
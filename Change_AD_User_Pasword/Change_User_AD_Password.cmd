@echo on 

FOR /F %%i in (userlist.txt) do ( 

echo ################################################################# >> ./PasswordChange.log 
echo Username %%i >> ./PasswordChange.log 
powershell .\Change_User_AD_Password.ps1 "%%i" >> ./PasswordChange.log 
) 
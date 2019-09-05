@echo off&setlocal enabledelayedexpansion

set host="localhost"
set port="3306"
set user="root"
set password="123456"

set temp=temp.txt
mysql -h%host% -P%port% -u%user% -p%password% -e"show databases" > %temp%
set /a n=0
for /f "tokens=*" %%i in (%temp%) do (
	if !n! gtr 4 (
		set ddl=drop database %%i;
		set batch=!batch!!ddl!
	) 
	set /a n+=1
)
mysql -h%host% -P%port% -u%user% -p%password% -e"!batch!"
del %temp%
echo "all done,congratulations!"
pause

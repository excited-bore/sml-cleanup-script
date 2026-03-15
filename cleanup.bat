@echo off

echo Checking explorer settings 
powershell -NoProfile -ExecutionPolicy Bypass -Command "Start-Process powershell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%~dp0scripts\fileExplorer.ps1""'"

REM Batch has no 'or' statements???
REM set value2=0

REM for /f "tokens=3" %%a in ('reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideFileExt"') do set value=%%a

REM if "%value%" neq "0x0" (
REM 	set value2=1
REM )

REM reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "FullPath" >nul 2>&1
REM if %errorlevel% neq 0 (
REM 	set value2=1
REM ) else (
	
REM	for /f "tokens=3" %%b in ('reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "FullPath"') do set value1=%%b

REM	if "%value1%"=="0x0" (
REM	    set value2=1
REM	)
REM )

REM if "%value2%" == "1" (
REM	powershell -NoProfile -ExecutionPolicy Bypass -Command "Start-Process powershell -Verb RunAs -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%~dp0scripts\fileExplorer.ps1""'"
REM )

echo Disabling taskview button on taskbar
powershell -NoProfile -ExecutionPolicy Bypass -Command "Start-Process powershell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%~dp0scripts\disable_taskview.ps1""'"

REM for /f "tokens=3" %%c in ('reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowTaskViewButton"') do set value3=%%c
REM if "%value3%" neq "0x0" (
REM	powershell -NoProfile -ExecutionPolicy Bypass -Command "Start-Process powershell -Verb RunAs -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%~dp0scripts\disable_taskview.ps1""'"
REM )

echo Removing unnecessary packages 
powershell -NoProfile -ExecutionPolicy Bypass -Command ^
"Start-Process powershell -Verb RunAs -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%~dp0scripts\remove_packages.ps1""'"
pause

echo Disabling the ability to run unknown exes, msi's, ps1's, bats and appx' by importing rules for local security policy's applocker
powershell -NoProfile -ExecutionPolicy Bypass -Command ^
"Start-Process powershell -Verb RunAs -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%~dp0scripts\import_local_security_policy.ps1""'"

reg query "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "PasswordManagerEnabled" >nul 2>&1
if %errorlevel% == 1 (
	echo Disabling Edge's password manager
	powershell -NoProfile -ExecutionPolicy Bypass -Command "Start-Process powershell -Verb RunAs -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%~dp0scripts\no_passwords_edge.ps1""'"
)

REM Clean Edge data
powershell -NoProfile -ExecutionPolicy Bypass -File ".\scripts\clean_edge.ps1"

reg query "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /v "PasswordManagerEnabled" >nul 2>&1
if %errorlevel% == 1 (
	echo Disabling Firefox' password manager
	powershell -NoProfile -ExecutionPolicy Bypass -Command "Start-Process powershell -Verb RunAs -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%~dp0scripts\no_passwords_firefox.ps1""'"
)

REM Clean Firefox data
powershell -NoProfile -ExecutionPolicy Bypass -File ".\scripts\clean_firefox.ps1"

reg query "HKLM\SOFTWARE\Policies\Google\Chrome" /v "PasswordManagerEnabled" >nul 2>&1
if %errorlevel% == 1 (
	echo Disabling Chrome's password manager
	powershell -NoProfile -ExecutionPolicy Bypass -Command "Start-Process powershell -Verb RunAs -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%~dp0scripts\no_passwords_chrome.ps1""'"
)

REM Clean Google Chrome data
powershell -NoProfile -ExecutionPolicy Bypass -File ".\scripts\clean_chrome.ps1"

REM Remove empty programs from startmenu
REM powershell -NoProfile -ExecutionPolicy Bypass -Command ^
REM "Start-Process powershell -Verb RunAs -Wait -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%~dp0scripts\clean_startmenu.ps1""'"

REM Empty Userfolders
powershell -NoProfile -ExecutionPolicy Bypass -Command ^
"Start-Process powershell -Verb RunAs -Wait -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%~dp0scripts\clean_userfolders.ps1""'"

REM Empty Trash
powershell -NoProfile -ExecutionPolicy Bypass -File ".\scripts\clean_trash.ps1"

REM Empty Terminal history
powershell -NoProfile -ExecutionPolicy Bypass -File ".\scripts\cleanhistory.ps1"

pause

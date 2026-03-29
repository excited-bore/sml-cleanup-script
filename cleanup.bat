@echo off

REM Attempt to resync time if out of sync
powershell -NoProfile -ExecutionPolicy Bypass -Command ^
"Start-Process powershell -Verb RunAs -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%~dp0scripts\dateandtime.ps1""'"

echo Checking explorer settings 
powershell -NoProfile -ExecutionPolicy Bypass -File ".\scripts\fileExplorer.ps1"

echo Disabling notifications 
powershell -NoProfile -ExecutionPolicy Bypass -File ".\scripts\disable_notifications.ps1"

echo Disabling chat button on taskbar
powershell -NoProfile -ExecutionPolicy Bypass -File ".\scripts\disable_chat.ps1"

echo Disabling taskview button on taskbar
powershell -NoProfile -ExecutionPolicy Bypass -File ".\scripts\disable_taskview.ps1"

:: echo Removing unnecessary packages 
:: powershell -NoProfile -ExecutionPolicy Bypass -Command ^
:: "Start-Process powershell -Verb RunAs -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%~dp0scripts\remove_packages.ps1""'"
:: pause

:: echo Disabling the ability to run unknown exes, msi's, ps1's, bats and appx' by importing rules for local security policy's applocker
:: powershell -NoProfile -ExecutionPolicy Bypass -Command ^
:: "Start-Process powershell -Verb RunAs -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%~dp0scripts\import_local_security_policy.ps1""'"

REM reg query "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "PasswordManagerEnabled" >nul 2>&1
REM if %errorlevel% == 1 (
REM 	echo Disabling Edge's password manager
REM 	powershell -NoProfile -ExecutionPolicy Bypass -Command "Start-Process powershell -Verb RunAs -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%~dp0scripts\no_passwords_edge.ps1""'"
REM )

REM Clean Edge data
powershell -NoProfile -ExecutionPolicy Bypass -File ".\scripts\clean_edge.ps1"

REM reg query "HKLM\SOFTWARE\Policies\Mozilla\Firefox" /v "PasswordManagerEnabled" >nul 2>&1
REM if %errorlevel% == 1 (
REM	echo Disabling Firefox' password manager
REM	powershell -NoProfile -ExecutionPolicy Bypass -Command "Start-Process powershell -Verb RunAs -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%~dp0scripts\no_passwords_firefox.ps1""'"
REM )

REM Clean Firefox data
powershell -NoProfile -ExecutionPolicy Bypass -File ".\scripts\clean_firefox.ps1"

REM reg query "HKLM\SOFTWARE\Policies\Google\Chrome" /v "PasswordManagerEnabled" >nul 2>&1
REM if %errorlevel% == 1 (
REM	echo Disabling Chrome's password manager
REM	powershell -NoProfile -ExecutionPolicy Bypass -Command "Start-Process powershell -Verb RunAs -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%~dp0scripts\no_passwords_chrome.ps1""'"
REM )

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

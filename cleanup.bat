@echo off

echo Removing unnecessary packages 
powershell -NoProfile -ExecutionPolicy Bypass -Command ^
"Start-Process powershell -Verb RunAs -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%~dp0scripts\remove_packages.ps1""'"
pause

echo Disabling Edge's password manager
powershell -NoProfile -ExecutionPolicy Bypass -Command ^
"Start-Process powershell -Verb RunAs -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%~dp0scripts\no_passwords_edge.ps1""'"

REM Clean Edge data
powershell -NoProfile -ExecutionPolicy Bypass -File ".\scripts\clean_edge.ps1"

echo Disabling Firefox' password manager
powershell -NoProfile -ExecutionPolicy Bypass -Command ^
"Start-Process powershell -Verb RunAs -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%~dp0scripts\no_passwords_firefox.ps1""'"

REM Clean Firefox data
powershell -NoProfile -ExecutionPolicy Bypass -File ".\scripts\clean_firefox.ps1"

echo Disabling Chrome's password manager
powershell -NoProfile -ExecutionPolicy Bypass -Command ^
"Start-Process powershell -Verb RunAs -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%~dp0scripts\no_passwords_chrome.ps1""'"

REM Clean Google Chrome data
powershell -NoProfile -ExecutionPolicy Bypass -File ".\scripts\clean_chrome.ps1"

REM Empty Userfolders
powershell -NoProfile -ExecutionPolicy Bypass -File ".\scripts\clean_userfolders.ps1"

REM Empty Trash
powershell -NoProfile -ExecutionPolicy Bypass -File ".\scripts\clean_trash.ps1"

REM Empty Terminal history
powershell -NoProfile -ExecutionPolicy Bypass -File ".\scripts\cleanhistory.ps1"

pause

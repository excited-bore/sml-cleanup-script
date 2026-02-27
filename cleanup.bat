@echo off

REM Clean Edge data
powershell -NoProfile -ExecutionPolicy Bypass -File ".\scripts\clean_edge.ps1"

REM Clean Firefox data
powershell -NoProfile -ExecutionPolicy Bypass -File ".\scripts\clean_firefox.ps1"

REM Clean Google Chrome data
powershell -NoProfile -ExecutionPolicy Bypass -File ".\scripts\clean_chrome.ps1"

REM Empty Userfolders
powershell -NoProfile -ExecutionPolicy Bypass -File ".\scripts\clean_userfolders.ps1"

REM Empty Trash
powershell -NoProfile -ExecutionPolicy Bypass -File ".\scripts\clean_trash.ps1"

REM Empty Terminal history
powershell -NoProfile -ExecutionPolicy Bypass -File ".\scripts\cleanhistory.ps1"

pause

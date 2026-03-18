@echo off

echo Synchronise clock before resuming to update Windows / drivers.
pause

REM Try and install updaters and support assisters
powershell -NoProfile -ExecutionPolicy Bypass -File ".\scripts\update_drivers.ps1"

REM Windows Update
powershell -NoProfile -ExecutionPolicy Bypass -File ".\scripts\windows_update.ps1"

REM Update winget
winget update --all --accept-source-agreements --accept-package-agreements

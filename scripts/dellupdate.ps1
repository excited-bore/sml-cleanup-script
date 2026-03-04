powershell -NoProfile -ExecutionPolicy Bypass -File ".\scripts\check_winget.ps1"

if ( -Not (Test-Path -Path "C:\Program Files (x86)\Dell\CommandUpdate\dcu-cli.exe")){
    winget install --id Dell.CommandUpdate --accept-package-agreements --accept-source-agreements
}
Start-Process "C:\Program Files (x86)\Dell\CommandUpdate\dcu-cli.exe" -ArgumentList "/scan" -Wait
Start-Process "C:\Program Files (x86)\Dell\CommandUpdate\dcu-cli.exe" -ArgumentList "/applyupdates" -Wait
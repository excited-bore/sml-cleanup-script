Write-Host "Disabling taskview"

Start-Process powershell -ArgumentList '-NoProfile','-ExecutionPolicy','Bypass','-Command','New-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ShowTaskViewButton" -PropertyType DWord -Value 0 -Force' -Wait
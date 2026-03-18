# Checking for updates
Write-Host "Updating Windows in the background.."

start ms-settings:windowsupdate
wuauclt.exe /detectnow /updatenow
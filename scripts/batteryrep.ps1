Write-Host "Creating battery report and opening it with edge"
powercfg /BATTERYREPORT /OUTPUT "$env:TEMP/Battery.html"

if (Test-Path -Path "$env:TEMP/Battery.html"){
    & 'C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe' @("$env:TEMP/Battery.html")
}

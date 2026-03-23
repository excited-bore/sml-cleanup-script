if (-not (Test-Path 'C:\SWSetup\HPImageAssistant\HPImageAssistant.dll' -ErrorAction SilentlyContinue)){
    winget install --id HP.ImageAssistant --silent --accept-package-agreements --accept-source-agreements
}

if (Get-Variable update -ErrorAction SilentlyContinue){

    Write-Host "Updating HP Firmware (Drivers, BIOS, ...)" -ForegroundColor Cyan
    Start-Process -Verb RunAs "C:\SWSetup\HPImageAssistant\HPImageAssistant.exe" -ArgumentList "/Operation:Analyze /Action:Install /AutoCleanup /Category:BIOS,Drivers,Firmware /Noninteractive" -Wait

    Write-Host "Done updating!" -ForegroundColor Green
    cmd.exe /c 'pause'
}

if ((winget list -q HP.ImageAssistant --accept-source-agreements) -eq 'No installed package found matching input criteria.'){
    winget install --id HP.ImageAssistant --silent --accept-package-agreements --accept-source-agreements
}

if (Get-Variable $update -ErrorAction SilentlyContinue){

    Write-Host "Updating HP Firmware (Drivers, BIOS, ...)" -ForegroundColor Cyan
    Start-Process -Verb RunAs "C:\SWSetup\HPImageAssistant\HPImageAssistant.exe" -ArgumentList "/Operation:Analyze /Action:Install /AutoCleanup /Category:BIOS,Drivers,Firmware /Noninteractive" -Wait

    Write-Host "Done updating!" -ForegroundColor Green
    cmd.exe /c 'pause'
}

if ( -not ( Test-Path -Path "C:\Program Files\Dell\SupportAssistAgent\bin\SupportAssistAgent.exe")){
  
    Write-Host "Installing Dell SupportAssist..." 
    
    if (-Not (Test-Path -Path "$env:TEMP\DellSupport\" )) {
        mkdir "$env:TEMP\DellSupport\"
    }

    if (-Not (Test-Path -Path "$env:TEMP\DellSupport\SupportAssistinstaller.exe" )){
        if (Test-Path -Path "$PSScriptRoot\update-assists\sp155262.exe" ) {
            Copy-Item -Force "$PSScriptRoot\update-assists\sp155262.exe" -Destination "$env:TEMP\DellSupport\SupportAssistinstaller.exe"
        } else {
            Invoke-WebRequest -Method Get https://downloads.dell.com/serviceability/catalog/SupportAssistinstaller.exe -OutFile "$env:TEMP\DellSupport\SupportAssistinstaller.exe"
        }
    }

    if (Test-Path -Path $env:TEMP\DellSupport\SupportAssistinstaller.exe) {
        Start-Process "$env:TEMP\DellSupport\SupportAssistinstaller.exe" -Wait
    }
}

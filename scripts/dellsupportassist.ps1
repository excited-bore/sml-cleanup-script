# powershell -NoProfile -ExecutionPolicy Bypass -File ".\scripts\check_wget.ps1"

if ( -not ( Test-Path -Path "C:\Program Files\Dell\SupportAssistAgent\bin\SupportAssistAgent.exe")){
  
    Write-Host "Installing Dell SupportAssist..." 
    
    if (-Not (Test-Path -Path "$env:TEMP\DellSupport\" )) {
        mkdir "$env:TEMP\DellSupport\"
    }

    if (-Not (Test-Path -Path "$env:TEMP\DellSupport\SupportAssistinstaller.exe" )){
        Invoke-WebRequest -Method Get https://downloads.dell.com/serviceability/catalog/SupportAssistinstaller.exe -OutFile "$env:TEMP\DellSupport\SupportAssistinstaller.exe"
    }

    if (Test-Path -Path $env:TEMP\DellSupport\SupportAssistinstaller.exe) {
        Start-Process "$env:TEMP\DellSupport\SupportAssistinstaller.exe" -Wait
    }
}

# if (Test-Path variable:INS_WGET) {
#    winget remove --id JernejSimoncic.Wget --silent --accept-package-agreements --accept-source-agreements
# }

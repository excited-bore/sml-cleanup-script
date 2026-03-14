if ( -Not (Test-Path -Path 'C:\Program Files (x86)\HP\HP Support Framework\HPSupportAssistant.dll' )){
	
	Write-Host "Installing HPSupportAssist..."
	
	if (-Not (Test-Path -Path "$env:TEMP\HpSupport")){
    		mkdir "$env:TEMP\HpSupport"
	}
	if (Test-Path -Path "$PSScriptRoot\update-assists\sp155262.exe" ) {
            Copy-Item -Force "$PSScriptRoot\update-assists\sp155262.exe" -Destination "$env:TEMP\HpSupport\SupportAssistinstaller.exe"
        } else {
        	Invoke-WebRequest -Method Get -Uri https://ftp.hp.com/pub/softpaq/sp160001-160500/sp160330.exe -OutFile "$env:TEMP\HpSupport\SupportAssistinstaller.exe"
	}

	Start-Process "$env:TEMP\HpSupport\SupportAssistinstaller.exe" -Wait 
}

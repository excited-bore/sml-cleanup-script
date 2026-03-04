if ( -Not (Test-Path -Path 'C:\Program Files (x86)\HP\HP Support Framework\HPSupportAssistant.dll' )){
	
	Write-Host "Installing HPSupportAssist..."
	
	if (-Not (Test-Path -Path "$env:TEMP\HpSupport")){
    		mkdir "$env:TEMP\HpSupport"
	}

	if (-Not (Test-Path -Path "$env:TEMP\HpSupport\sp160330.exe")){
    		Invoke-WebRequest -Method Get -Uri https://ftp.hp.com/pub/softpaq/sp160001-160500/sp160330.exe -OutFile "$env:TEMP\HpSupport\sp160330.exe"
	}

	Start-Process "$env:TEMP\HpSupport\sp160330.exe" -Wait 
}

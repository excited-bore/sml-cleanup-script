$chromeRoaming = "$env:APPDATA\Google\Chrome"
$chromeLocal = "$env:LOCALAPPDATA\Google\Chrome\User Data"                                                                                                                                                                                                                    

Write-Host "Closing Chrome if still running..." -ForegroundColor Yellow                                                                               
Get-Process chrome -ErrorAction SilentlyContinue | Stop-Process -Force

#if (Test-Path $chromeRoaming -ErrorAction SilentlyContinue) { 
#        
#	Write-Host "Deleting Chrome roaming data folder..." -ForegroundColor Cyan 
#	try {                                                                                                                                     
#		Remove-Item -Path $chromeRoaming -Recurse -Force -ErrorAction SilentlyContinue                                                         
#	} catch {
#		Remove-Item -Path $chromeRoaming -Recurse -Force
#	}
#}

if (Test-Path $chromeLocal -ErrorAction SilentlyContinue){
	
	Write-Host "Deleting Chrome local data folder..." -ForegroundColor Cyan
	try {                                                                                                                                     
		Remove-Item -Path $chromeLocal -Recurse -Force -ErrorAction SilentlyContinue                                                         
	} catch {
		Remove-Item -Path $chromeLocal -Recurse -Force
	}
}
Write-Host "Chrome data has been wiped" -ForegroundColor Green 

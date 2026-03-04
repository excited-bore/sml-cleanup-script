$ffxPath = "$env:APPDATA\Mozilla\Firefox"
$ffxPath1 = "$env:LOCALAPPDATA\Mozilla\Firefox"                                                                                                                                                                                                                    

Write-Host "Closing Firefox if still running..." -ForegroundColor Yellow                                                                            
Get-Process firefox -ErrorAction SilentlyContinue | Stop-Process -Force

if (Test-Path $ffxPath -ErrorAction SilentlyContinue) { 
        
	Write-Host "Deleting Firefox roaming data folder..." -ForegroundColor Cyan 
	try {                                                                                                                                     
		Remove-Item -Path $ffxPath -Recurse -Force -ErrorAction SilentlyContinue                                                         
	} catch {
		Remove-Item -Path $ffxPath -Recurse -Force
	}
}
if (Test-Path $ffxPath1 -ErrorAction SilentlyContinue){
	
	Write-Host "Deleting Firefox local data folder..." -ForegroundColor Cyan
	try {                                                                                                                                     
		Remove-Item -Path $ffxPath1 -Recurse -Force -ErrorAction SilentlyContinue                                                         
	} catch {
		Remove-Item -Path $ffxPath1 -Recurse -Force
	}
}
Write-Host "Firefox data has been wiped" -ForegroundColor Green 

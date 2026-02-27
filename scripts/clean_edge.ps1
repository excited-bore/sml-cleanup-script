$EdgePath = "$env:APPDATA\Microsoft\Edge"
$EdgePath1 = "$env:LOCALAPPDATA\Microsoft\Edge"                                                                                                                                                                                                                    

Write-Host "Closing Edge if still running..." -ForegroundColor Yellow                                                                               
Get-Process msedge -ErrorAction SilentlyContinue | Stop-Process -Force

if (Test-Path $EdgePath -ErrorAction SilentlyContinue) { 
        
	Write-Host "Deleting Edge roaming data folder..." -ForegroundColor Cyan
	try {                                                                                                                                     
		Remove-Item -Path $EdgePath -Recurse -Force -ErrorAction SilentlyContinue                                                         
	} catch {
		Remove-Item -Path $EdgePath -Recurse -Force
	}
}
if (Test-Path $EdgePath1 -ErrorAction SilentlyContinue){
	
	Write-Host "Deleting Edge local data folder..." -ForegroundColor Cyan
	try {                                                                                                                                     
		Remove-Item -Path $EdgePath1 -Recurse -Force -ErrorAction SilentlyContinue                                                         
	} catch {
		Remove-Item -Path $EdgePath1 -Recurse -Force
	}	
}
Write-Host "Edge data has been wiped" -ForegroundColor Green 

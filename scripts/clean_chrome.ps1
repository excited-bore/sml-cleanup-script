$chromePath = "$env:APPDATA\Google\Chrome"
$chromePath1 = "$env:LOCALAPPDATA\Google\Chrome"                                                                                                                                                                                                                    

Write-Host "Closing Chrome if still running..." -ForegroundColor Yellow                                                                               
Get-Process chrome -ErrorAction SilentlyContinue | Stop-Process -Force

if (Test-Path $chromePath -ErrorAction SilentlyContinue) { 
        
	Write-Host "Deleting Chrome roaming data folder..." -ForegroundColor Cyan 
	try {                                                                                                                                     
		Remove-Item -Path $chromePath -Recurse -Force -ErrorAction SilentlyContinue                                                         
	} catch {
		Remove-Item -Path $chromePath -Recurse -Force
	}
}
if (Test-Path $chromePath1 -ErrorAction SilentlyContinue){
	
	Write-Host "Deleting Chrome local data folder..." -ForegroundColor Cyan
	try {                                                                                                                                     
		Remove-Item -Path $chromePath1 -Recurse -Force -ErrorAction SilentlyContinue                                                         
	} catch {
		Remove-Item -Path $chromePath1 -Recurse -Force
	}
}
Write-Host "Chrome data has been wiped" -ForegroundColor Green 

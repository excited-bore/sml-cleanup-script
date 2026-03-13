#$EdgeRoaming = "\\?\$env:APPDATA\Microsoft\Edge\User Data\Default"
$EdgeLocalCookies = "\\?\$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\Cookies"
$EdgeLocalHistory = "\\?\$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\History"             
$EdgeLocalWebdata = "\\?\$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\Web Data"
$EdgeLocalBookmarks = "\\?\$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\Bookmark*"
$EdgeLocalExtensions = "\\?\$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\Extensions\*"

Write-Host "Closing Edge if still running..." -ForegroundColor Yellow                                                                               
Get-Process msedge -ErrorAction SilentlyContinue | Stop-Process -Force

#if (Test-Path $EdgeRoaming -ErrorAction SilentlyContinue) { 
#        
#	Write-Host "Deleting Edge roaming data folder..." -ForegroundColor Cyan
#	try {                                                                                                                                     
#		Remove-Item -Path $EdgeRoaming -Recurse -Force -ErrorAction SilentlyContinue                                                         
#	} catch {
#		Remove-Item -Path $EdgeRoaming -Recurse -Force
#	}
#}

# Cookies

if (Test-Path $EdgeLocalCookies -ErrorAction SilentlyContinue){
	
	Write-Host "Deleting Edge local cookies data folder..." -ForegroundColor Cyan
	try {                                                                                                                                     
		Remove-Item -Path $EdgeLocalCookies -Recurse -Force -ErrorAction SilentlyContinue                                                         
	} catch {
		Remove-Item -Path $EdgeLocalCookies -Recurse -Force
	}	
}

# History

if (Test-Path $EdgeLocalHistory -ErrorAction SilentlyContinue){
	
	Write-Host "Deleting Edge local history data folder..." -ForegroundColor Cyan
	try {                                                                                                                                     
		Remove-Item -Path $EdgeLocalHistory -Recurse -Force -ErrorAction SilentlyContinue                                                         
	} catch {
		Remove-Item -Path $EdgeLocalHistory -Recurse -Force
	}	
}

# Web data

if (Test-Path $EdgeLocalWebdata -ErrorAction SilentlyContinue){
	
	Write-Host "Deleting Edge local web data folder..." -ForegroundColor Cyan
	try {                                                                                                                                     
		Remove-Item -Path $EdgeLocalWebdata -Recurse -Force -ErrorAction SilentlyContinue                                                         
	} catch {
		Remove-Item -Path $EdgeLocalWebdata -Recurse -Force
	}	
}

# Bookmarks 

if (Test-Path $EdgeLocalBookmarks -ErrorAction SilentlyContinue){
	
	Write-Host "Deleting Edge local bookmarks..." -ForegroundColor Cyan
	try {                                                                                                                                     
		Remove-Item -Path $EdgeLocalBookmarks -Recurse -Force -ErrorAction SilentlyContinue                                                         
	} catch {
		Remove-Item -Path $EdgeLocalBookmarks -Recurse -Force
	}	
}

# Extensions 

if (Test-Path $EdgeLocalExtensions -ErrorAction SilentlyContinue){
	
	Write-Host "Deleting Edge local extensions..." -ForegroundColor Cyan
	try {                                                                                                                                     
		Remove-Item -Path $EdgeLocalExtensions -Recurse -Force -ErrorAction SilentlyContinue                                                         
	} catch {
		Remove-Item -Path $EdgeLocalExtensions -Recurse -Force
	}	
}

Write-Host "Edge data has been wiped" -ForegroundColor Green 

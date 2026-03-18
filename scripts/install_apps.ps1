Write-Host "Checking if Firefox is installed"
if ((winget list -q Mozilla.Firefox.nl --accept-source-agreements) -eq 'No installed package found matching input criteria.' ){
    Write-Host "Installing Firefox"
        winget install --id Mozilla.Firefox.nl --source winget --accept-package-agreements --accept-source-agreements
}
# https://addons.mozilla.org/firefox/downloads/file/3736679/belgium_eid-1.0.32.xpi   

Write-Host "Checking if Chrome is installed" 
if ((winget list -q Google.Chrome --accept-source-agreements) -eq 'No installed package found matching input criteria.' ){ 
   Write-Host "Installing Chrome"
   try {
     	winget install --id Google.Chrome --source winget --accept-package-agreements --accept-source-agreements
   } catch {
	Write-Host "Installing Google chrome .msi failed. Trying .exe..." -ForegroundColor Yellow
 	winget install --id Google.Chrome.EXE --source winget --accept-package-agreements --accept-source-agreements
    }
}


$restart = 0
$path = "HKU\Default:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
if (-not (Test-Path -Path "$path\HideFileExt")){ 
   		Write-Host "Setting file explorer option to show file extensions"
		Set-ItemProperty $path HideFileExt 0;
		$restart = 1;
}
if (-not (Test-Path -Path "$path\FullPath")){ 
 		Write-Host "Setting file explorer option to show full path in titlebar"
		Set-ItemProperty $path FullPath 1;
		$restart = 1;
}	

# Hidden Files
# Set-ItemProperty $key Hidden 1
# Set-ItemProperty $key ShowSuperHidden 1

if ($restart -eq 1){
   Write-Host "Restarting explorer..."
   Stop-Process -Name explorer -Force
}

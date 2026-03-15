# https://learn.microsoft.com/en-us/answers/questions/62380/how-to-set-default-registry-value-for-all-users-in
$restart = 0 
$path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
$hive = "C:\Users\Default\NTUSER.DAT"
$temp  = "HKU\DefaultUserTemp"
$path1 = "Registry::HKU\DefaultUserTemp\Software\Microsoft\Windows\CurrentVersion\Explorer"

# Set to show file extensions for admin

if (-not ((Get-ItemPropertyValue -Path "$path" -Name "HideFileExt") -eq 0)){ 
   	Write-Host "Setting file explorer option to show file extensions for $env:USERNAME"
	Set-ItemProperty -Path "$path" HideFileExt 0;
	$restart = 1;
}

# Set to show full path in title bar

$fullpath = Get-ItemProperty -Path "$path" -Name 'FullPath' -ErrorAction SilentlyContinue
if ((-not $fullpath) -or ( -not ($fullpath -eq 1))){ 
 	Write-Host "Setting file explorer option to show full path in titlebar for $env:USERNAME"
	Set-ItemProperty -Path "$path" FullPath 1;
	$restart = 1;
} 

if ($restart -eq 1){
   Write-Host "Restarting explorer..."
   Stop-Process -Name explorer -Force
}

reg load $temp $hive | Out-Null

if (-not (Test-Path -Path "$path1\Advanced")){
	New-Item -Path "$path1" -Name "Advanced" -Force | Out-Null 
}

# Set to show file extensions

if (-not (Get-ItemProperty -Path "$path1\Advanced" -Name "HideFileExt")){ 
   	Write-Host "Setting file explorer option to show file extensions"
	Set-ItemProperty -Path "$path1\Advanced" HideFileExt 0;
}

# Set to show full path in title bar

if (-not (Get-ItemProperty -Path "$path1\Advanced" -Name "FullPath")){ 
 	Write-Host "Setting file explorer option to show full path in titlebar"
	Set-ItemProperty "$path1\Advanced" FullPath 1;
}

# Hidden Files
# Set-ItemProperty $key Hidden 1
# Set-ItemProperty $key ShowSuperHidden 1

# Collect garbage to free up memory and unload the hive 
[gc]::Collect()
reg unload $temp | Out-Null

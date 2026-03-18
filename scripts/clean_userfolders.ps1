Write-Host "Cleaning up Start Menu entries" -ForegroundColor Cyan

$path = "C:\ProgramData\Microsoft\Windows\Start Menu\Programs"

Get-ChildItem -Path "$path" -Filter "*.lnk" -Recurse -ErrorAction SilentlyContinue | ForEach-Object {
    if (Test-Path $_.FullName) {
    	$shell = New-Object -ComObject WScript.Shell
    	$shortcut = $shell.CreateShortcut($_.FullName)
    	$target = $shortcut.TargetPath
	
    	if (([string]::IsNullOrWhiteSpace($target)) -or (-not (Test-Path $target))) {
		
		# Check if parent containing dangling link is not Start Menu\Programs, and if so remove parent folder that sits in Start Menu\Programs instead of links itself
		$path1 = Split-Path -Path $_.FullName
	
        	if ( -not ( $path -eq $path1 )){
	   
           		$relative = $path1.Substring($path.Length).TrimStart('\')
	   		$top = $relative.Split('\')[0]
	   		$top = Join-Path $path $top
 	   
	   		Write-Host "Dangling shortcut '$_' found found among startmenu entries" -ForegroundColor Yellow
			Write-Host "Remove containing folder '$top'? [Y/n]: " -ForegroundColor Yellow
			$answer = Read-Host
	   		if ([string]::IsNullOrWhiteSpace($answer) -or $answer -eq 'y' -or $answer -eq 'Y'){
				Remove-Item -Path "\\?\$($top)" -Recurse -Force
			}
		} else {
           		Write-Host "Dangling shortcut '$_' found among startmenu entries" -ForegroundColor Yellow
	   		Write-Host "Remove shortcut '$_'? [Y/n]: " -ForegroundColor Yellow
			$answer = Read-Host
			if ([string]::IsNullOrWhiteSpace($answer) -or $answer -eq 'y' -or $answer -eq 'Y'){
				Remove-Item -Path "\\?\$($_.FullName)" -Force
			}
		}
    	}
    }
}


Write-Host "Cleaning up Desktop shortcuts" -ForegroundColor Cyan

$desktop = "C:\Users\$env:USERNAME\Desktop"
$desktop_public = "C:\Users\Public\Desktop"

Get-ChildItem -Path "$desktop" -Filter "*.lnk" -Recurse -ErrorAction SilentlyContinue | ForEach-Object {
    if (Test-Path $_.FullName) {
    	$shell = New-Object -ComObject WScript.Shell
    	$shortcut = $shell.CreateShortcut($_.FullName)
    	$target = $shortcut.TargetPath
	
    	if (([string]::IsNullOrWhiteSpace($target)) -or (-not (Test-Path $target))) {
		
	        Write-Host "Dangling shortcut '$_' found on Desktop" -ForegroundColor Yellow
	   	Write-Host "Remove shortcut '$_'? [Y/n]: " -ForegroundColor Yellow
		$answer = Read-Host
		if ([string]::IsNullOrWhiteSpace($answer) -or $answer -eq 'y' -or $answer -eq 'Y'){
			Remove-Item -Path "\\?\$($_.FullName)" -Force
		}
    	}
    }
}

Get-ChildItem -Path "$desktop_public" -Filter "*.lnk" -Recurse -ErrorAction SilentlyContinue | ForEach-Object {
    if (Test-Path $_.FullName) {
    	$shell = New-Object -ComObject WScript.Shell
    	$shortcut = $shell.CreateShortcut($_.FullName)
    	$target = $shortcut.TargetPath
	
    	if (([string]::IsNullOrWhiteSpace($target)) -or (-not (Test-Path $target))) {
		
	        Write-Host "Dangling shortcut '$_' found on the public Desktop" -ForegroundColor Yellow
	   	Write-Host "Remove shortcut '$_'? [Y/n]: " -ForegroundColor Yellow
		$answer = Read-Host
		if ([string]::IsNullOrWhiteSpace($answer) -or $answer -eq 'y' -or $answer -eq 'Y'){
			Remove-Item -Path "\\?\$($_.FullName)" -Force
		}
    	}
    }
}

$manufacturer = Get-CimInstance -Classname Win32_ComputerSystem | Select-Object -Property Manufacturer -ExpandProperty Manufacturer

Write-Host "Removing unknown files and folders from 'C:\'" -ForegroundColor Yellow

# Don't remove 'C:\SWSetup' if it's a HP machine
if ( ( $manufacturer -eq 'HP' ) -or ( $manufacturer -eq 'Hewlett-Packard' )){
    $excludes = @('PerfLogs', 'Program Files', 'Program Files (x86)', 'Users', 'Windows', 'SWSetup')
} else {
    $excludes = @('PerfLogs', 'Program Files', 'Program Files (x86)', 'Users', 'Windows')
}
Get-ChildItem -Path 'C:\' | Where-Object { $_.Name -notin $excludes } | ForEach-Object {
    Remove-Item -Recurse -Force "\\?\$($_.FullName)" -ErrorAction SilentlyContinue
}


Write-Host "Removing unknown users from 'C:\Users'" -ForegroundColor Yellow
$excludes = @('LaptopSML', 'Public', "$env:USERNAME")
Get-ChildItem -Path 'C:\Users\' | Where-Object { $_.Name -notin $excludes } | ForEach-Object {
    Remove-Item -Recurse -Force "\\?\$($_.FullName)" -ErrorAction SilentlyContinue
}

Write-Host "Removing unknown files and folders from 'C:\Users\$env:USERNAME'" -ForegroundColor Yellow
$excludes = @('Contacts', 'Desktop', "Documents", 'Downloads', 'Favorites', 'Links', 'Music', 'OneDrive', 'Pictures', 'Saved Games', 'Searches', 'Videos')
Get-ChildItem -Path "C:\Users\$env:USERNAME" | Where-Object { $_.Name -notin $excludes } | ForEach-Object {
    Remove-Item -Recurse -Force "\\?\$($_.FullName)" -ErrorAction SilentlyContinue
}

# Unnessecary?
#Write-Host "Cleaning up 3D Objects" -ForegroundColor Cyan
#Get-ChildItem -Path "C:\Users\$env:USERNAME\3D Objects\" | ForEach-Object {
#     Remove-Item -Recurse -Force "\\?\$($_.FullName)" -ErrorAction SilentlyContinue
#}

Write-Host "Cleaning up Contacts" -ForegroundColor Cyan
Get-ChildItem -Path "C:\Users\$env:USERNAME\Contacts\" | ForEach-Object {
     Remove-Item -Recurse -Force "\\?\$($_.FullName)" -ErrorAction SilentlyContinue
}

Write-Host "Cleaning up Desktop" -ForegroundColor Cyan
$excludes = @('Google Chrome.lnk', 'PDF-Xchange Editor.lnk', 'Smartschool.lnk')
Get-ChildItem -Path "C:\Users\$env:USERNAME\Desktop\" | Where-Object { $_.Name -notin $excludes } | ForEach-Object {
     Remove-Item -Recurse -Force "\\?\$($_.FullName)" -ErrorAction SilentlyContinue
}

Write-Host "Cleaning up Downloads" -ForegroundColor Cyan
Get-ChildItem -Path "C:\Users\$env:USERNAME\Downloads\" | ForEach-Object {
     Remove-Item -Recurse -Force "\\?\$($_.FullName)" -ErrorAction SilentlyContinue
}

Write-Host "Cleaning up Documents" -ForegroundColor Cyan
Get-ChildItem -Path "C:\Users\$env:USERNAME\Documents\" | ForEach-Object {
    Remove-Item -Recurse -Force "\\?\$($_.FullName)" -ErrorAction SilentlyContinue 
}

Write-Host "Cleaning up Favorites" -ForegroundColor Cyan
Get-ChildItem -Path "C:\Users\$env:USERNAME\Favorites\" | ForEach-Object {
    Remove-Item -Recurse -Force "\\?\$($_.FullName)" -ErrorAction SilentlyContinue 
}

Write-Host "Cleaning up Links" -ForegroundColor Cyan 
Get-ChildItem -Path "C:\Users\$env:USERNAME\Links\" | ForEach-Object {
    Remove-Item -Recurse -Force "\\?\$($_.FullName)" -ErrorAction SilentlyContinue 
}

Write-Host "Cleaning up Onedrive" -ForegroundColor Cyan 
Get-ChildItem -Path "C:\Users\$env:USERNAME\Onedrive\" | ForEach-Object {
    Remove-Item -Recurse -Force "\\?\$($_.FullName)" -ErrorAction SilentlyContinue 
}

Write-Host "Cleaning up Pictures" -ForegroundColor Cyan
Get-ChildItem -Path "C:\Users\$env:USERNAME\Pictures\" | ForEach-Object {
    Remove-Item -Recurse -Force "\\?\$($_.FullName)" -ErrorAction SilentlyContinue 
}

Write-Host "Cleaning up Music" -ForegroundColor Cyan
Get-ChildItem -Path "C:\Users\$env:USERNAME\Music\" | ForEach-Object {
    Remove-Item -Recurse -Force "\\?\$($_.FullName)" -ErrorAction SilentlyContinue 
}

Write-Host "Cleaning up Saved Games" -ForegroundColor Cyan
Get-ChildItem -Path "C:\Users\$env:USERNAME\Saved Games\" | ForEach-Object {
    Remove-Item -Recurse -Force "\\?\$($_.FullName)" -ErrorAction SilentlyContinue 
}

Write-Host "Cleaning up Searches" -ForegroundColor Cyan
Get-ChildItem -Path "C:\Users\$env:USERNAME\Searches\" | ForEach-Object {
    Remove-Item -Recurse -Force "\\?\$($_.FullName)" -ErrorAction SilentlyContinue 
}

Write-Host "Cleaning up Videos" -ForegroundColor Cyan
Get-ChildItem -Path "C:\Users\$env:USERNAME\Videos\" | ForEach-Object {
    Remove-Item -Recurse -Force "\\?\$($_.FullName)" -ErrorAction SilentlyContinue 
}

cmd.exe /c 'pause'

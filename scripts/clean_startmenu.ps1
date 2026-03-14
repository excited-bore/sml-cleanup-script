Write-Host "Cleaning up Start Menu programs"

$path = "C:\ProgramData\Microsoft\Windows\Start Menu\Programs"

Get-ChildItem -Path "$path" -Filter "*.lnk" -Recurse | ForEach-Object {
    if (Test-Path $_.FullName) {
    	$shell = New-Object -ComObject WScript.Shell
    	$shortcut = $shell.CreateShortcut($_.FullName)
    	$target = $shortcut.TargetPath

    	if (-not (Test-Path $target)) {

		# Check if parent containing dangling link is not Start Menu\Programs, and if so remove parent folder that sits in Start Menu\Programs instead of links itself
		$path1 = Split-Path -Path $_.FullName
	
        	if ( -not ( $path -eq $path1 )){
	   
           		$relative = $path1.Substring($path.Length).TrimStart('\')
	   		$top = $relative.Split('\')[0]
	   		$top = Join-Path $path $top
 	   
 	   		Write-Host "Removing folder '$top'" -ForegroundColor Yellow
	   		Remove-Item -Path "\\?\$($top)" -Recurse -Force
		} else {
           		Write-Host "Removing shortcut '$_'" -ForegroundColor Yellow
	   		Remove-Item -Path "\\?\$($_.FullName)" -Force
		}
    	}
    }
}

cmd.exe /c 'pause'
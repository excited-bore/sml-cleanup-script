Write-Host "Cleaning up Start Menu programs"

$path = "C:\ProgramData\Microsoft\Windows\Start Menu\Programs"

Get-ChildItem -Path "$path" -Filter "*.lnk" -Recurse | ForEach-Object {
    $shell = New-Object -ComObject WScript.Shell
    $shortcut = $shell.CreateShortcut($_.FullName)
    $target = $shortcut.TargetPath

    if (-not (Test-Path $target)) {
	Write-Host "Removing dangling shortcut: $($_.FullName) -> $target"
        
	# Check if parent containing dangling link is not Start Menu\Programs, and if so remove parent folder that sits in Start Menu\Programs instead of links itself
	$path1 = Split-Path -Path $_.FullName -Parent
	if ( -not ( $path -eq $path1 )){
	   $relative = $path1.Substring($path.Length).TrimStart('\')
	   $top = $relative.Split('\')[0]
 	   Remove-Item -Path "\\?\$($top)" -Force
	} else {	   
	   Remove-Item -Path "\\?\$($_.FullName)" -Force
	}
    }
}

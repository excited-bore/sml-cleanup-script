Write-Host "Removing unknown files and folders from 'C:\'" -ForegroundColor Yellow
$excludes = @('PerfLogs', 'Program Files', 'Program Files (x86)', 'Users', 'Windows')
Get-ChildItem -Path 'C:\' | Where-Object { $_.Name -notin $excludes } | ForEach-Object {
    Remove-Item -Recurse -Force "\\?\$($_.FullName)" -ErrorAction SilentlyContinue
}


Write-Host "Removing unknown users from 'C:\Users'" -ForegroundColor Yellow
$excludes = @('LaptopSML', 'Public', "$env:USERNAME")
Get-ChildItem -Path 'C:\Users\' | Where-Object { $_.Name -notin $excludes } | ForEach-Object {
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

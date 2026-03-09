Write-Host "Removing unknown files and folders from 'C:\'" -ForegroundColor Yellow
$excludes = @('PerfLogs', 'Program Files', 'Program Files (x86)', 'Users', 'Windows')
Get-ChildItem -Path 'C:\' | Where-Object { $_.Name -notin $excludes } | ForEach-Object {
    cmd.exe /c rd /s /q $_.FullName 
}

Write-Host "Removing unknown users from 'C:\Users'" -ForegroundColor Yellow
$excludes = @('LaptopSML', 'Public', 'leerlingdbs')
Get-ChildItem -Path 'C:\Users\' | Where-Object { $_.Name -notin $excludes } | ForEach-Object {
    cmd.exe /c rd /s /q $_.FullName 
}

# Unnessecary?
#Write-Host "Cleaning up 3D Objects" -ForegroundColor Cyan
#Get-ChildItem -Path "C:\Users\$env:USERNAME\3D Objects\" | ForEach-Object {
#    cmd.exe /c rd /s /q $_.FullName 
#}

Write-Host "Cleaning up Contacts" -ForegroundColor Cyan
Get-ChildItem -Path "C:\Users\$env:USERNAME\Contacts\" | ForEach-Object {
    cmd.exe /c rd /s /q $_.FullName 
}

Write-Host "Cleaning up Desktop" -ForegroundColor Cyan
$excludes = @('Google Chrome.lnk', 'PDF-Xchange Editor.lnk', 'Smartschool.lnk')
Get-ChildItem -Path "C:\Users\$env:USERNAME\Desktop\" | Where-Object { $_.Name -notin $excludes } | ForEach-Object {
    cmd.exe /c rd /s /q $_.FullName 
}

Write-Host "Cleaning up Downloads" -ForegroundColor Cyan
Get-ChildItem -Path "C:\Users\$env:USERNAME\Downloads\" | ForEach-Object {
    cmd.exe /c rd /s /q $_.FullName 
}

Write-Host "Cleaning up Documents" -ForegroundColor Cyan
Get-ChildItem -Path "C:\Users\$env:USERNAME\Documents\" | ForEach-Object {
    cmd.exe /c rd /s /q $_.FullName 
}

Write-Host "Cleaning up Favorites" -ForegroundColor Cyan
Get-ChildItem -Path "C:\Users\$env:USERNAME\Favorites\" | ForEach-Object {
    cmd.exe /c rd /s /q $_.FullName 
}

Write-Host "Cleaning up Links" -ForegroundColor Cyan 
Get-ChildItem -Path "C:\Users\$env:USERNAME\Links\" | ForEach-Object {
    cmd.exe /c rd /s /q $_.FullName 
}

Write-Host "Cleaning up Onedrive" -ForegroundColor Cyan 
Get-ChildItem -Path "C:\Users\$env:USERNAME\Onedrive\" | ForEach-Object {
    cmd.exe /c rd /s /q $_.FullName 
}

Write-Host "Cleaning up Pictures" -ForegroundColor Cyan
Get-ChildItem -Path "C:\Users\$env:USERNAME\Pictures\" | ForEach-Object {
    cmd.exe /c rd /s /q $_.FullName 
}

Write-Host "Cleaning up Music" -ForegroundColor Cyan
Get-ChildItem -Path "C:\Users\$env:USERNAME\Music\" | ForEach-Object {
    cmd.exe /c rd /s /q $_.FullName 
}

Write-Host "Cleaning up Saved Games" -ForegroundColor Cyan
Get-ChildItem -Path "C:\Users\$env:USERNAME\Saved Games\" | ForEach-Object {
    cmd.exe /c rd /s /q $_.FullName 
}

Write-Host "Cleaning up Searches" -ForegroundColor Cyan
Get-ChildItem -Path "C:\Users\$env:USERNAME\Searches\" | ForEach-Object {
    cmd.exe /c rd /s /q $_.FullName 
}

Write-Host "Cleaning up Videos" -ForegroundColor Cyan
Get-ChildItem -Path "C:\Users\$env:USERNAME\Videos\" | ForEach-Object {
    cmd.exe /c rd /s /q $_.FullName 
}

cmd.exe /c 'pause'

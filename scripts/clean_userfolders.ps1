Write-Host "Cleaning up 3D Objects" -ForegroundColor Cyan
Remove-Item -Path "C:\Users\$env:USERNAME\3D Objects\*" -Recurse -Force -ErrorAction SilentlyContinue

Write-Host "Cleaning up Contacts" -ForegroundColor Cyan
Remove-Item -Path "C:\Users\$env:USERNAME\Contacts\*" -Recurse -Force -ErrorAction SilentlyContinue

Write-Host "Cleaning up Desktop" -ForegroundColor Cyan
Get-ChildItem "C:\Users\$env:USERNAME\Desktop\" -Exclude 'Google Chrome.lnk', 'PDF-Xchange Editor.lnk', 'Smartschool.lnk' | Remove-Item -Force -Recurse -ErrorAction SilentlyContinue
#Remove-Item -Path "C:\Users\$env:USERNAME\Desktop\*" -Recurse -Force -ErrorAction SilentlyContinue

Write-Host "Cleaning up Downloads" -ForegroundColor Cyan
Remove-Item -Path "C:\Users\$env:USERNAME\Downloads\*" -Recurse -Force -ErrorAction SilentlyContinue

Write-Host "Cleaning up Documents" -ForegroundColor Cyan
Remove-Item -Path "C:\Users\$env:USERNAME\Documents\*" -Recurse -Force -ErrorAction SilentlyContinue

Write-Host "Cleaning up Favourites" -ForegroundColor Cyan
Remove-Item -Path "C:\Users\$env:USERNAME\Favourites\*" -Recurse -Force -ErrorAction SilentlyContinue

Write-Host "Cleaning up Links" -ForegroundColor Cyan 
Remove-Item -Path "C:\Users\$env:USERNAME\Links\*" -Recurse -Force -ErrorAction SilentlyContinue

Write-Host "Cleaning up Onedrive" -ForegroundColor Cyan 
Remove-Item -Path "C:\Users\$env:USERNAME\Onedrive\*" -Recurse -Force -ErrorAction SilentlyContinue

Write-Host "Cleaning up Pictures" -ForegroundColor Cyan
Remove-Item -Path "C:\Users\$env:USERNAME\Pictures\*" -Recurse -Force -ErrorAction SilentlyContinue

Write-Host "Cleaning up Music" -ForegroundColor Cyan
Remove-Item -Path "C:\Users\$env:USERNAME\Music\*" -Recurse -Force -ErrorAction SilentlyContinue

Write-Host "Cleaning up Saved Games" -ForegroundColor Cyan
Remove-Item -Path "C:\Users\$env:USERNAME\Saved Games\*" -Recurse -Force -ErrorAction SilentlyContinue

Write-Host "Cleaning up Searches" -ForegroundColor Cyan
Remove-Item -Path "C:\Users\$env:USERNAME\Searches\*" -Recurse -Force -ErrorAction SilentlyContinue

Write-Host "Cleaning up Videos" -ForegroundColor Cyan
Remove-Item -Path "C:\Users\$env:USERNAME\Videos\*" -Recurse -Force -ErrorAction SilentlyContinue

Write-Host "Cleaning up Contacts" -ForegroundColor Cyan
Remove-Item -Path "C:\User\$env:USERNAME\Contacts\" -Recurse -Force -ErrorAction SilentlyContinue

Write-Host "Cleaning up Desktop" -ForegroundColor Cyan
Remove-Item -Path "C:\User\$env:USERNAME\Desktop\" -Recurse -Force -ErrorAction SilentlyContinue

Write-Host "Cleaning up Downloads" -ForegroundColor Cyan
Remove-Item -Path "C:\User\$env:USERNAME\Downloads\" -Recurse -Force -ErrorAction SilentlyContinue

Write-Host "Cleaning up Documents" -ForegroundColor Cyan
Remove-Item -Path "C:\User\$env:USERNAME\Documents\" -Recurse -Force -ErrorAction SilentlyContinue

Write-Host "Cleaning up Onedrive" -ForegroundColor Cyan 
Remove-Item -Path "C:\User\$env:USERNAME\Onedrive\" -Recurse -Force -ErrorAction SilentlyContinue

Write-Host "Cleaning up Pictures" -ForegroundColor Cyan
Remove-Item -Path "C:\User\$env:USERNAME\Pictures\" -Recurse -Force -ErrorAction SilentlyContinue

Write-Host "Cleaning up Music" -ForegroundColor Cyan
Remove-Item -Path "C:\User\$env:USERNAME\Music\" -Recurse -Force -ErrorAction SilentlyContinue

Write-Host "Cleaning up Saved Games" -ForegroundColor Cyan
Remove-Item -Path "C:\User\$env:USERNAME\Saved Games\" -Recurse -Force -ErrorAction SilentlyContinue

Write-Host "Cleaning up Searches" -ForegroundColor Cyan
Remove-Item -Path "C:\User\$env:USERNAME\Searches\" -Recurse -Force -ErrorAction SilentlyContinue

Write-Host "Cleaning up Videos" -ForegroundColor Cyan
Remove-Item -Path "C:\User\$env:USERNAME\Videos\" -Recurse -Force -ErrorAction SilentlyContinue

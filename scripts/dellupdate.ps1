if (( -Not (Test-Path -Path "C:\Program Files (x86)\Dell\CommandUpdate\dcu-cli.exe")) -and ( -Not (Test-Path -Path "C:\Program Files\Dell\CommandUpdate\dcu-cli.exe"))) {
    
    Write-Host "Installing Dell Commandline." 
  
    winget install --id Dell.CommandUpdate --accept-package-agreements --accept-source-agreements
}

if ( Test-Path -Path "C:\Program Files\Dell\CommandUpdate\dcu-cli.exe"){
    Start-Process "C:\Program Files\Dell\CommandUpdate\dcu-cli.exe" -ArgumentList "/scan" -Wait
    Start-Process "C:\Program Files\Dell\CommandUpdate\dcu-cli.exe" -ArgumentList "/applyupdates" -Wait
}elseif ( Test-Path -Path "C:\Program Files (x86)\Dell\CommandUpdate\dcu-cli.exe"){
    Start-Process "C:\Program Files (x86)\Dell\CommandUpdate\dcu-cli.exe" -ArgumentList "/scan" -Wait
    Start-Process "C:\Program Files (x86)\Dell\CommandUpdate\dcu-cli.exe" -ArgumentList "/applyupdates" -Wait
}

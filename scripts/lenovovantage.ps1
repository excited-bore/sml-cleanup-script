powershell -NoProfile -ExecutionPolicy Bypass -File ".\scripts\check_winget.ps1"

if ((winget list -q 9WZDNCRFJ4MV) -eq 'No installed package found matching input criteria.' ){
    winget install --id 9WZDNCRFJ4MV --silent --accept-package-agreements --accept-source-agreements
}
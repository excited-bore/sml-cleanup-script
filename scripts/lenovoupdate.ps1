if ((winget list -q Lenovo.SystemUpdate) -eq 'No installed package found matching input criteria.' ){
    winget install --id Lenovo.SystemUpdate --silent --accept-package-agreements --accept-source-agreements
}

Start-Process "C:\Program Files (x86)\Lenovo\System Update\tvsu.exe" -ArgumentList "/CM -search A -action INSTALL -noicon -rebootprompt -nolicense" -Wait
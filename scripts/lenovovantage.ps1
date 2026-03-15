if ((winget list -q 9WZDNCRFJ4MV --accept-source-agreements) -eq 'No installed package found matching input criteria.' ){
    winget install --id 9WZDNCRFJ4MV --silent --accept-package-agreements --accept-source-agreements
}
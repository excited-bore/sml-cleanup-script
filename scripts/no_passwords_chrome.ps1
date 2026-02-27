$key = 'HKLM:\SOFTWARE\Policies\Google\Chrome'

if (-not (Test-Path -Path $key)) {
    New-Item -Path $key -Force | Out-Null
}
Set-ItemProperty -Path $key -Name 'PasswordManagerEnabled' -Value 0

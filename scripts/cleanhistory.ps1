<#
Wipe PowerShell (5/7+) and Windows Terminal history
#>

Write-Host "Clearing PowerShell 5 (ConsoleHost) history..." -ForegroundColor Cyan
$ps5Hist = Join-Path $env:APPDATA "Microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt"
if (Test-Path $ps5Hist) {
    Clear-Content $ps5Hist -Force
    Write-Host "PS5 history cleared."
}

Write-Host "`nClearing PowerShell 7+ history..." -ForegroundColor Cyan
$ps7Hist = Join-Path $env:USERPROFILE ".dotnet-tools\PowerShell\history\history.sqlite"
$ps7Hist2 = Join-Path $env:APPDATA "Microsoft\PowerShell\PSReadLine\ConsoleHost_history.txt" # Newer versions
$ps7Locations = @($ps7Hist, $ps7Hist2)

foreach ($path in $ps7Locations) {
    if (Test-Path $path) {
        try {
            # If SQLite DB, wipe it; if text file, clear it
            $ext = [IO.Path]::GetExtension($path)
            if ($ext -eq ".sqlite") {
                Remove-Item $path -Force
            } else {
                Clear-Content $path -Force
            }
            Write-Host "PS7 history cleared: $path"
        } catch {
            Write-Warning "Failed to clear PS7 history at $path"
        }
    }
}

Write-Host "`nClearing Windows Terminal history..." -ForegroundColor Cyan
$terminalSettingsPath = Join-Path $env:LOCALAPPDATA "Packages"
$terminalMatches = Get-ChildItem $terminalSettingsPath -Directory | Where-Object { $_.Name -like "*WindowsTerminal*" }

foreach ($folder in $terminalMatches) {
    $historyPath = Join-Path $folder.FullName "LocalState\cache"
    if (Test-Path $historyPath) {
        try {
            Remove-Item "$historyPath\*" -Force -Recurse -ErrorAction SilentlyContinue
            Write-Host "Windows Terminal cache/history cleared at: $historyPath"
        } catch {
            Write-Warning "Failed to clear some Terminal cache items."
        }
    }
}
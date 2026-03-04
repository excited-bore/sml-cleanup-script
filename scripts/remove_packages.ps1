# $modules = Get-Module -ListAvailable | Out-String

#if ( -not $modules -match "Microsoft.Winget.Client") {
#
#	Install-Package -Force -Name NuGet
#	Install-Module -Force Microsoft.Winget.Client
#}

$packages = @(Get-WinGetPackage | Select-Object Name, Id)
$filePath = ".\scripts\packages-test.csv"
$packages2 = Import-Csv -Path $filePath
foreach ($package in $packages) {
	if (( $packages2.Name -notcontains $package.Name ) -and ( $packages2.Id -notcontains $package.Id ) ) 
	{
		$name = $package.Name
		$id = $package.Id
		Write-Host "$name with id '$id' is unknown." -ForegroundColor Red
		Write-Host "Remove it? [Y/n]: " -ForegroundColor Yellow
		$answer = Read-Host
		if ([string]::IsNullOrWhiteSpace($answer) -or $answer -eq 'y' -or $answer -eq 'Y'){
			winget uninstall --id $package.Id --purge --disable-interactivity --accept-source-agreements
		}
	}
}


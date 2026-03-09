$modules = Get-Module -ListAvailable | Out-String
$manufacturer = Get-CimInstance -Classname Win32_ComputerSystem | Select-Object -Property Manufacturer -ExpandProperty Manufacturer

if ( -not ( Test-Path -path "C:\Program Files\WindowsPowerShell\Modules\Microsoft.WinGet.Client" )){
	Install-Package -Force -Name NuGet
	Install-Module -Force Microsoft.Winget.Client
}

if ( $manufacturer -eq 'Dell Inc.'){
    
    Write-Host "Dell System detected. Installing Dell Commandline"
    
    & "$PSScriptRoot\dellupdate.ps1" 
    
    
} elseif ( ( $manufacturer -eq 'HP' ) -or ( $manufacturer -eq 'Hewlett-Packard' )){
    Write-Host "HP system detected."
    
    # Now hpsupportassist 

    & "$PSScriptRoot\hpsupportassist.ps1"

    $filePath = ".\hp-packages.csv"

} elseif ( $manufacturer -eq 'LENOVO' ){
    Write-Host "Lenovo system detected. Installing Lenovo Update..."
    
    & "$PSScriptRoot\lenovoupdate.ps1"
    
    # Now lenovo vantage 
    
    Write-Host "Installing Lenovo Vantage..." 

    & "$PSScriptRoot\lenovovantage.ps1"

} elseif ( $manufacturer -eq "ASUSTeK COMPUTER INC." ) {
    Write-Host "This is an ASUS system."
} elseif ( $manufacturer -eq 'Acer' ) {
    Write-Host "This is an Acer system."
} elseif ( $manufacturer -eq "Gigabyte Technology Co., Ltd." ){
    Write-Host "This is a Gigabyte system."
} else {
    Write-Host "Unknown system."
}

$packages = @(Get-WinGetPackage | Select-Object Name, Id)
if ( Test-Path -path $filePath){
	$packages2 = Import-Csv -Path $filePath
	foreach ($package in $packages) {
		if (( $packages2.Name -notcontains $package.Name ) -and ( $packages2.Id -notcontains $package.Id ) ) 
		{
			$name = $package.Name
			$id = $package.Id
			Write-Host "$name with id '$id' is unknown / seems unecessary." -ForegroundColor Red
			Write-Host "Remove it? [Y/n]: " -ForegroundColor Yellow
			$answer = Read-Host
			if ([string]::IsNullOrWhiteSpace($answer) -or $answer -eq 'y' -or $answer -eq 'Y'){
				winget uninstall --id $package.Id --purge --disable-interactivity --accept-source-agreements
			}
		}
	}
}else{
	Write-Host "Cant find packages.csv file. Exiting..." -ForegroundColor Yellow
}


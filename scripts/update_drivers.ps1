Write-Host "Checking manufacturer of device (HP, Lenovo, Dell...)"

$manufacturer = Get-CimInstance -Classname Win32_ComputerSystem | Select-Object -Property Manufacturer -ExpandProperty Manufacturer

Write-Host "Attempting to update firmware before removing programs and locking down system"

$update = 1

if ( $manufacturer -eq 'Dell Inc.'){
    
    Write-Host "Dell System detected." -ForegroundColor Cyan

    # Check if Dell Commandline is installed; if not, install 

    
    Write-Host "Installing and running Dell Commandline for updates..." -ForegroundColor Yellow

    & "$PSScriptRoot\dellupdate.ps1"

    # Same for Dell Supportassist
	
	
    Write-Host "Installing Dell SupportAssist..." -ForegroundColor Yellow

    & "$PSScriptRoot\dellsupportassist.ps1"
    
    
} elseif ( ( $manufacturer -eq 'HP' ) -or ( $manufacturer -eq 'Hewlett-Packard' )){
    
    Write-Host "HP system detected." -ForegroundColor Cyan
    
    # Check if HPsupportassist is installed; if not, install 

    Write-Host "Installing HP Support Assistant..." -ForegroundColor Yellow

    & "$PSScriptRoot\hpsupportassist.ps1"

    # Same for HP Image assistant. This will also update

    Write-Host "Installing and running HP Image assistant for updates..." -ForegroundColor Yellow
    
    & "$PSScriptRoot\hpupdates.ps1"
    	
} elseif ( $manufacturer -eq 'LENOVO' ){
    
    Write-Host "Lenovo system detected." -ForegroundColor Cyan
    
    Write-Host "Installing Lenovo Vantage..." -ForegroundColor Yellow

    & "$PSScriptRoot\lenovovantage.ps1"
    
    Write-Host "Installing Lenovo Update..." -ForegroundColor Yellow
    
    & "$PSScriptRoot\lenovoupdate.ps1"

} elseif ( $manufacturer -eq "ASUSTeK COMPUTER INC." ) {
    Write-Host "This is an ASUS system."
} elseif ( $manufacturer -eq 'Acer' ) {
    Write-Host "This is an Acer system."
} elseif ( $manufacturer -eq "Gigabyte Technology Co., Ltd." ){
    Write-Host "This is a Gigabyte system."
} else {
    Write-Host "Unknown system."
}

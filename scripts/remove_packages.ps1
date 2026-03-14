$modules = Get-Module -ListAvailable | Out-String
$manufacturer = Get-CimInstance -Classname Win32_ComputerSystem | Select-Object -Property Manufacturer -ExpandProperty Manufacturer

if ( -not ( Test-Path -path "C:\Program Files\WindowsPowerShell\Modules\Microsoft.WinGet.Client" )){
	winget upgrade Microsoft.AppInstaller --source winget
        Install-Package -Force -Name NuGet
	Install-Module -Force Microsoft.Winget.Client
}

Write-Host "Removing some Microsoft store apps"
Write-Host "Removing Teams"
Get-AppxPackage -AllUsers MSTeams | Remove-AppxPackage -AllUsers
# Prevent it being reinstalled for new users
Get-AppxProvisionedPackage -Online | Where-Object DisplayName -like 'MSTeams' | Remove-AppxProvisionedPackage -Online

Write-Host "Removing Outlook"
Get-AppxPackage -AllUsers Microsoft.OutlookForWindows | Remove-AppxPackage -AllUsers
Get-AppxProvisionedPackage -Online | Where-Object DisplayName -like 'Microsoft.OutlookForWindows' | Remove-AppxProvisionedPackage -Online

Write-Host "Removing Sticky Notes"
Get-AppxPackage -AllUsers Microsoft.MicrosoftStickyNotes | Remove-AppxPackage -AllUsers
Get-AppxProvisionedPackage -Online | Where-Object DisplayName -like 'Microsoft.MicrosoftStickyNotes' | Remove-AppxProvisionedPackage -Online

Write-Host "Removing Microsoft DevHome"
Get-AppxPackage -AllUsers Microsoft.Windows.DevHome | Remove-AppxPackage -AllUsers
Get-AppxProvisionedPackage -Online | Where-Object DisplayName -like 'Microsoft.Windows.DevHome' | Remove-AppxProvisionedPackage -Online

Write-Host "Removing Microsoft Widgets"
Get-AppxPackage -AllUsers MicrosoftWindows.Client.WebExperience | Remove-AppxPackage -AllUsers
Get-AppxPackage -AllUsers Microsoft.WidgetsPlatformRuntime | Remove-AppxPackage -AllUsers
Get-AppxProvisionedPackage -Online | Where-Object DisplayName -like 'MicrosoftWindows.Client.WebExperience' | Remove-AppxProvisionedPackage -Online
Get-AppxProvisionedPackage -Online | Where-Object DisplayName -like 'Microsoft.WidgetsPlatformRuntime' | Remove-AppxProvisionedPackage -Online

Write-Host "Removing Microsoft StartExperiencesApp"
Get-AppxPackage -AllUsers Microsoft.StartExperiencesApp | Remove-AppxPackage -AllUsers
Get-AppxProvisionedPackage -Online | Where-Object DisplayName -like 'Microsoft.StartExperiencesApp' | Remove-AppxProvisionedPackage -Online

Write-Host "Removing Linkedin (if it's installed)"
Get-AppxPackage -AllUsers 7EE7776C.LinkedInforWindows | Remove-AppxPackage -AllUsers
Get-AppxProvisionedPackage -Online | Where-Object DisplayName -like '7EE7776C.LinkedInforWindows' | Remove-AppxProvisionedPackage -Online

Write-Host "Removing cross device related programs (Crossdevice, quickassist, yourphone)"
Get-AppxPackage -AllUsers MicrosoftWindows.CrossDevice | Remove-AppxPackage -AllUsers
Get-AppxPackage -AllUsers MicrosoftCorporationII.QuickAssist | Remove-AppxPackage -AllUsers
Get-AppxPackage -AllUsers Microsoft.YourPhone | Remove-AppxPackage -AllUsers
Get-AppxProvisionedPackage -Online | Where-Object DisplayName -like 'MicrosoftWindows.CrossDevice' | Remove-AppxProvisionedPackage -Online
Get-AppxProvisionedPackage -Online | Where-Object DisplayName -like 'MicrosoftCorporationII.QuickAssistMicrosoft.YourPhone' | Remove-AppxProvisionedPackage -Online
Get-AppxProvisionedPackage -Online | Where-Object DisplayName -like 'Microsoft.OutlookForWindows' | Remove-AppxProvisionedPackage -Online

Write-Host "Removing Todos"
Get-AppxPackage -AllUsers Microsoft.Todos | Remove-AppxPackage -AllUsers
Get-AppxProvisionedPackage -Online | Where-Object DisplayName -like 'Microsoft.Todos' | Remove-AppxProvisionedPackage -Online

Write-Host "Removing Feedback hub"
Get-AppxPackage -AllUsers Microsoft.WindowsFeedbackHub | Remove-AppxPackage -AllUsers
Get-AppxProvisionedPackage -Online | Where-Object DisplayName -like 'Microsoft.WindowsFeedbackHub' | Remove-AppxProvisionedPackage -Online

Write-Host "Removing Bing related programs, like bing news, search and weather"
Get-AppxPackage -AllUsers Microsoft.BingNews | Remove-AppxPackage -AllUsers
Get-AppxPackage -AllUsers Microsoft.BingSearch | Remove-AppxPackage -AllUsers
Get-AppxPackage -AllUsers Microsoft.BingWeather | Remove-AppxPackage -AllUsers
Get-AppxProvisionedPackage -Online | Where-Object DisplayName -like 'Microsoft.BingNews' | Remove-AppxProvisionedPackage -Online
Get-AppxProvisionedPackage -Online | Where-Object DisplayName -like 'Microsoft.BingSearch' | Remove-AppxProvisionedPackage -Online
Get-AppxProvisionedPackage -Online | Where-Object DisplayName -like 'Microsoft.BingWeather' | Remove-AppxProvisionedPackage -Online

Write-Host "Removing Solitaire Collection"
Get-AppxPackage -AllUsers Microsoft.MicrosoftSolitaireCollection | Remove-AppxPackage -AllUsers
Get-AppxProvisionedPackage -Online | Where-Object DisplayName -like 'Microsoft.MicrosoftSolitaireCollection' | Remove-AppxProvisionedPackage -Online

Write-Host "Removing Xbox and other game related programs"
Get-AppxPackage -AllUsers Microsoft.GamingApp | Remove-AppxPackage -AllUsers
Get-AppxPackage -AllUsers Microsoft.Edge.GameAssist | Remove-AppxPackage -AllUsers
# Get-AppxPackage -AllUsers Microsoft.XboxGameCallableUI | Remove-AppxPackage -AllUsers
Get-AppxPackage -AllUsers Microsoft.XboxIdentityProvider | Remove-AppxPackage -AllUsers
Get-AppxPackage -AllUsers Microsoft.XboxSpeechToTextOverlay | Remove-AppxPackage -AllUsers
Get-AppxPackage -AllUsers Microsoft.XboxGamingOverlay | Remove-AppxPackage -AllUsers
Get-AppxPackage -AllUsers Microsoft.Xbox.TCUI | Remove-AppxPackage -AllUsers
Get-AppxProvisionedPackage -Online | Where-Object DisplayName -like 'Microsoft.GamingApp' | Remove-AppxProvisionedPackage -Online
Get-AppxProvisionedPackage -Online | Where-Object DisplayName -like 'Microsoft.Edge.GameAssist' | Remove-AppxProvisionedPackage -Online
# Get-AppxProvisionedPackage -Online | Where-Object DisplayName -like 'Microsoft.XboxGameCallableUI' | Remove-AppxProvisionedPackage -Online
Get-AppxProvisionedPackage -Online | Where-Object DisplayName -like 'Microsoft.XboxIdentityProvider' | Remove-AppxProvisionedPackage -Online
Get-AppxProvisionedPackage -Online | Where-Object DisplayName -like 'Microsoft.XboxSpeechToTextOverlay' | Remove-AppxProvisionedPackage -Online
Get-AppxProvisionedPackage -Online | Where-Object DisplayName -like 'Microsoft.XboxGamingOverlay' | Remove-AppxProvisionedPackage -Online
Get-AppxProvisionedPackage -Online | Where-Object DisplayName -like 'Microsoft.Xbox.TCUI' | Remove-AppxProvisionedPackage -Online

Write-Host "Attempting to update firmware before removing programs and locking down system"


if ( $manufacturer -eq 'Dell Inc.'){
    
    Write-Host "Dell System detected. Installing Dell Commandline"
    
    & "$PSScriptRoot\dellupdate.ps1" 
    
    
} elseif ( ( $manufacturer -eq 'HP' ) -or ( $manufacturer -eq 'Hewlett-Packard' )){
    
    Write-Host "HP system detected."
    
    # Now hpsupportassist 

    & "$PSScriptRoot\hpsupportassist.ps1"

    $filePath = "$PSScriptRoot\packages-dbs\hp-packages.csv"

} elseif ( $manufacturer -eq 'LENOVO' ){
    Write-Host "Lenovo system detected. Installing Lenovo Update..."
    
    & "$PSScriptRoot\lenovoupdate.ps1"
    
    # Now lenovo vantage 
    
    Write-Host "Installing Lenovo Vantage..." 

    & "$PSScriptRoot\lenovovantage.ps1"

    $filePath = "$PSScriptRoot\packages-dbs\lenovo-packages.csv"

} elseif ( $manufacturer -eq "ASUSTeK COMPUTER INC." ) {
    Write-Host "This is an ASUS system."
} elseif ( $manufacturer -eq 'Acer' ) {
    Write-Host "This is an Acer system."
} elseif ( $manufacturer -eq "Gigabyte Technology Co., Ltd." ){
    Write-Host "This is a Gigabyte system."
} else {
    Write-Host "Unknown system."
    
    $filePath = "$PSScriptRoot\packages-dbs\packages-test.csv"

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
				try { 
				     winget uninstall --id $package.Id --purge --disable-interactivity --accept-source-agreements
				} catch {
				     # Try with --source winget
                                     winget uninstall --id $package.Id --source winget --purge --disable-interactivity --accept-source-agreements
				}
			}
		}
	}
}else{
	Write-Host "Cant find packages.csv file. Exiting..." -ForegroundColor Yellow
}

cmd.exe /c 'pause'

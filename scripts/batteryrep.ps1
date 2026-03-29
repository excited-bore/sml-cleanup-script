$designCap = Get-WmiObject -Class 'BatteryStaticData' -Namespace 'root\wmi' | 
Group-Object -Property InstanceName -AsHashTable -AsString
    
Get-CimInstance -Class 'BatteryFullChargedCapacity' -Namespace 'root/wmi' | 
Select-Object -Property InstanceName, FullChargedCapacity, DesignedCapacity, Percent |
ForEach-Object {
	$_.DesignedCapacity = $designCap[$_.InstanceName].DesignedCapacity
	$_.Percent = [Math]::Round( ( $_.FullChargedCapacity * 100 / $_.DesignedCapacity), 2)
	$_
}
cmd.exe /c 'pause'
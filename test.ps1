# https://learn.microsoft.com/en-us/answers/questions/62380/how-to-set-default-registry-value-for-all-users-in

$Hive = "C:\Users\Default\NTUSER.DAT"
$Temp  = "HKU\DefaultUserTemp"
$path = "Registry::HKU\DefaultUserTemp\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"

reg load $Temp $Hive

Set-ItemProperty -Path "$path" -Name "HideFileExt" -Value 0 

# Collect garbage to free up memory and unload the hive 
[gc]::Collect()
reg unload $Temp

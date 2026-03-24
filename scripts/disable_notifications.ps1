# Source - https://stackoverflow.com/a/72232863
# Posted by Andy McRae, modified by community. See post 'Timeline' for change history
# Retrieved 2026-03-24, License - CC BY-SA 4.0

# New-Item -Path "HKCU:\Software\Policies\Microsoft\Windows" -Name "Explorer" -Force
# New-ItemProperty -Path "HKCU:\Software\Policies\Microsoft\Windows\Explorer" -Name "DisableNotificationCenter" -PropertyType "DWord" -Value 1 -Force
New-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\PushNotifications" -Name "ToastEnabled" -PropertyType "DWord" -Value 0 -Force

# There's also "don't disturb" but ironically it's notifications of except priorities, so we just leave it at turning notifications off

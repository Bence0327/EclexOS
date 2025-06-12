$HandBrakeInstallerUrl = "https://github.com/HandBrake/HandBrake/releases/download/1.9.2/HandBrake-1.9.2-x86_64-Win_GUI.exe"
$InstallerPath = "$env:TEMP\HandBrake-1.9.2-x86_64-Win_GUI.exe"

# Download the installer
Invoke-WebRequest -Uri $HandBrakeInstallerUrl -OutFile $InstallerPath

# Silent istall
Start-Process -FilePath $InstallerPath -ArgumentList "/S" -Wait -Verb RunAs

# Deleting the installer
Remove-Item -Path $InstallerPath -Force

Write-Host "HandBrake sikeresen telep�tve!"

# Make a shortcut into the desktop
$ShortcutPath = "$env:USERPROFILE\Desktop\HandBrake.lnk"
$TargetPath = "C:\Program Files\HandBrake\HandBrake.exe"  

$WshShell = New-Object -ComObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut($ShortcutPath)
$Shortcut.TargetPath = $TargetPath
$Shortcut.WorkingDirectory = "C:\Program Files\HandBrake"
$Shortcut.Save()

Write-Host "HandBrake successfully installed!"
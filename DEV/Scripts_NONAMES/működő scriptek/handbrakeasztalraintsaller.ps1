$HandBrakeInstallerUrl = "https://github.com/HandBrake/HandBrake/releases/download/1.9.2/HandBrake-1.9.2-x86_64-Win_GUI.exe"
$InstallerPath = "$env:TEMP\HandBrake-1.9.2-x86_64-Win_GUI.exe"

# Let�lt�s
Invoke-WebRequest -Uri $HandBrakeInstallerUrl -OutFile $InstallerPath

# Csendes telep�t�s
Start-Process -FilePath $InstallerPath -ArgumentList "/S" -Wait -Verb RunAs

# Telep�t� t�rl�se
Remove-Item -Path $InstallerPath -Force

Write-Host "HandBrake sikeresen telep�tve!"

# Ikon elhelyez�se az asztalra
$ShortcutPath = "$env:USERPROFILE\Desktop\HandBrake.lnk"
$TargetPath = "C:\Program Files\HandBrake\HandBrake.exe"  # Friss�tsd az el�r�si �tvonalat, ha sz�ks�ges

$WshShell = New-Object -ComObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut($ShortcutPath)
$Shortcut.TargetPath = $TargetPath
$Shortcut.WorkingDirectory = "C:\Program Files\HandBrake"
$Shortcut.Save()

Write-Host "HandBrake parancsikon l�trehozva az asztalon!"
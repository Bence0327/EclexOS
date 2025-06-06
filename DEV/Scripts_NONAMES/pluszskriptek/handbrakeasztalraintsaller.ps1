$HandBrakeInstallerUrl = "https://github.com/HandBrake/HandBrake/releases/download/1.9.2/HandBrake-1.9.2-x86_64-Win_GUI.exe"
$InstallerPath = "$env:TEMP\HandBrake-1.9.2-x86_64-Win_GUI.exe"

# Letöltés
Invoke-WebRequest -Uri $HandBrakeInstallerUrl -OutFile $InstallerPath

# Csendes telepítés
Start-Process -FilePath $InstallerPath -ArgumentList "/S" -Wait -Verb RunAs

# Telepítõ törlése
Remove-Item -Path $InstallerPath -Force

Write-Host "HandBrake sikeresen telepítve!"

# Ikon elhelyezése az asztalra
$ShortcutPath = "$env:USERPROFILE\Desktop\HandBrake.lnk"
$TargetPath = "C:\Program Files\HandBrake\HandBrake.exe"  # Frissítsd az elérési útvonalat, ha szükséges

$WshShell = New-Object -ComObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut($ShortcutPath)
$Shortcut.TargetPath = $TargetPath
$Shortcut.WorkingDirectory = "C:\Program Files\HandBrake"
$Shortcut.Save()

Write-Host "HandBrake parancsikon létrehozva az asztalon!"
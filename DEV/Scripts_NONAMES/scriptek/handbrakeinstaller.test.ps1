$HandBrakeInstallerUrl = "https://github.com/HandBrake/HandBrake/releases/download/1.9.2/HandBrake-1.9.2-x86_64-Win_GUI.exe"
$InstallerPath = "$env:TEMP\HandBrake-1.9.2-x86_64-Win_GUI.exe"

# Letöltés
Invoke-WebRequest -Uri $HandBrakeInstallerUrl -OutFile $InstallerPath

# Csendes telepítés
Start-Process -FilePath $InstallerPath -ArgumentList "/S" -Wait -Verb RunAs

# Telepítő törlése
Remove-Item -Path $InstallerPath -Force

Write-Host "HandBrake sikeresen telepítve!"
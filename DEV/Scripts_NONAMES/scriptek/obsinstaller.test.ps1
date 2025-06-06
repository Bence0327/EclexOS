$ObsInstallerUrl = "https://cdn-fastly.obsproject.com/downloads/OBS-Studio-29.0.2-Full-Installer-x64.exe"
$InstallerPath = "$env:TEMP\OBSSetup.exe"

# Letöltés
Invoke-WebRequest -Uri $ObsInstallerUrl -OutFile $InstallerPath

# Csendes telepítés
Start-Process -FilePath $InstallerPath -ArgumentList "/S" -Wait -Verb RunAs

# Telepítő törlése
Remove-Item -Path $InstallerPath -Force

Write-Host "OBS Studio sikeresen telepítve!"
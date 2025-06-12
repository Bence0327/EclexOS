$ObsInstallerUrl = "https://cdn-fastly.obsproject.com/downloads/OBS-Studio-29.0.2-Full-Installer-x64.exe"
$InstallerPath = "$env:TEMP\OBSSetup.exe"

# Download the installer
Invoke-WebRequest -Uri $ObsInstallerUrl -OutFile $InstallerPath

# Silent install
Start-Process -FilePath $InstallerPath -ArgumentList "/S" -Wait -Verb RunAs

# Delete the installer
Remove-Item -Path $InstallerPath -Force

Write-Host "OBS Studio successfully installed!"
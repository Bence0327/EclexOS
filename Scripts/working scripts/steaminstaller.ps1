$SteamInstallerUrl = "https://cdn.cloudflare.steamstatic.com/client/installer/SteamSetup.exe"
$InstallerPath = "$env:TEMP\SteamSetup.exe"

# Download the installer
Invoke-WebRequest -Uri $SteamInstallerUrl -OutFile $InstallerPath

# Silent install
Start-Process -FilePath $InstallerPath -ArgumentList "/S" -Wait -Verb RunAs

# Deleting the installer
Remove-Item -Path $InstallerPath -Force

Write-Host "Steam successfully installed!"
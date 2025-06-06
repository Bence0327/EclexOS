$SteamInstallerUrl = "https://cdn.cloudflare.steamstatic.com/client/installer/SteamSetup.exe"
$InstallerPath = "$env:TEMP\SteamSetup.exe"

# Letöltés
Invoke-WebRequest -Uri $SteamInstallerUrl -OutFile $InstallerPath

# Csendes telepítés
Start-Process -FilePath $InstallerPath -ArgumentList "/S" -Wait -Verb RunAs

# Telepítő törlése
Remove-Item -Path $InstallerPath -Force

Write-Host "Steam sikeresen telepítve!"
$SpotifyInstallerUrl = "https://download.spotify.com/SpotifyFullSetup.exe"
$InstallerPath = "$env:TEMP\SpotifySetup.exe"

# Letöltés
Invoke-WebRequest -Uri $SpotifyInstallerUrl -OutFile $InstallerPath

# Csendes telepítés
Start-Process -FilePath $InstallerPath -ArgumentList "/silent" -Wait -Verb RunAs

# Telepítő törlése
Remove-Item -Path $InstallerPath -Force

Write-Host "Spotify sikeresen telepítve!"
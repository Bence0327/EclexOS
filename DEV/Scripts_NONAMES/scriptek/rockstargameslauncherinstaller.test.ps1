$RockstarInstallerUrl = "https://gamedownloads.rockstargames.com/public/installer/Rockstar-Games-Launcher.exe"
$InstallerPath = "$env:TEMP\Rockstar-Games-Launcher.exe"

# Letöltés
Invoke-WebRequest -Uri $RockstarInstallerUrl -OutFile $InstallerPath

# Csendes telepítés
Start-Process -FilePath $InstallerPath -ArgumentList "/S" -Wait -Verb RunAs

# Telepítő törlése
Remove-Item -Path $InstallerPath -Force

Write-Host "Rockstar Games Launcher sikeresen telepítve!"
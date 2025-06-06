$DiscordInstallerUrl = "https://discord.com/api/downloads/distributions/app/installers/latest?channel=stable&platform=win&arch=x64"
$InstallerPath = "$env:TEMP\DiscordSetup.exe"

# Letöltés
Invoke-WebRequest -Uri $DiscordInstallerUrl -OutFile $InstallerPath

# Csendes telepítés (Discord alapértelmezetten elindul a telepítés után)
Start-Process -FilePath $InstallerPath -ArgumentList "/S" -Wait -Verb RunAs

# Telepítő törlése
Remove-Item -Path $InstallerPath -Force

Write-Host "Discord sikeresen telepítve, és az automatikus indítás letiltva!"

# Bezárja a Discord folyamatot, ha elindult a telepítés után
Stop-Process -Name "Discord" -Force -ErrorAction SilentlyContinue
$RevoInstallerUrl = "https://f3b1cfc5d488c0384dc3-056ccca39cd416ca6db85fa26f78b9ef.ssl.cf1.rackcdn.com/revosetup.exe"
$InstallerPath = "$env:TEMP\RevoUninProSetup.exe"

# Letöltés
Invoke-WebRequest -Uri $RevoInstallerUrl -OutFile $InstallerPath

# Csendes telepítés
Start-Process -FilePath $InstallerPath -ArgumentList "/VERYSILENT" -Wait -Verb RunAs

Write-Host "Revo Uninstaller sikeresen telep�tve!"
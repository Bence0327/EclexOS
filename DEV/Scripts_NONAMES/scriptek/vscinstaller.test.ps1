$VscInstallerUrl = "https://aka.ms/win32-x64-user-stable"
$InstallerPath = "$env:TEMP\VSCodeUserSetup-x64-1.99.1.exe"

# Letöltés
Invoke-WebRequest -Uri $VscInstallerUrl -OutFile $InstallerPath

# Csendes telepítés
Start-Process -FilePath $InstallerPath -ArgumentList "/VERYSILENT /NORESTART /MERGETASKS=!runcode" -Wait -Verb RunAs

# Telepítő törlése
Remove-Item -Path $InstallerPath -Force

Write-Host "Visual Studio Code sikeresen telepítve!"
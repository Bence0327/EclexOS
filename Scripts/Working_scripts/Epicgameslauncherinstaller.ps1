$EpicInstallerUrl = "https://launcher-public-service-prod06.ol.epicgames.com/launcher/api/installer/download/EpicGamesLauncherInstaller.msi"
$InstallerPath = "$env:TEMP\EpicGamesLauncher.msi"

# Download the installer
Invoke-WebRequest -Uri $EpicInstallerUrl -OutFile $InstallerPath

# Silent isnatll
Start-Process -FilePath "msiexec.exe" -ArgumentList "/i $InstallerPath /quiet /norestart" -Wait -Verb RunAs

# Deleting the installer
Remove-Item -Path $InstallerPath -Force

Write-Host "Epic Games Launcher successfully installed!"

#Just some placeholder coming. It's easier to me to make the scripts bigger, any sign them with just one script.
# placeholder
# placeholder
# placeholder
# placeholder
# placeholder
# placeholder
# placeholder
# placeholder
# placeholder
# placeholder
# placeholder
# placeholder
# placeholder
$EAInstallerUrl = "https://origin-a.akamaihd.net/EA-Desktop-Client-Download/installer-releases/EAappInstaller.exe"
$InstallerPath = "$env:TEMP\EAAppSetup.exe"

# Download the installer
Invoke-WebRequest -Uri $EAInstallerUrl -OutFile $InstallerPath

# Silent install
Start-Process -FilePath $InstallerPath -ArgumentList "/silent /install" -Wait -Verb RunAs

# Deleting the installer
Remove-Item -Path $InstallerPath -Force

# Closing EA App
Start-Sleep -Seconds 60
Stop-Process -Name "EA" -Force

Write-Host "EA App successfully installed!"

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
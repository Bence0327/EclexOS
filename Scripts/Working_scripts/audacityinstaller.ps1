$AudacityInstallerUrl = "https://github.com/audacity/audacity/releases/download/Audacity-3.7.3/audacity-win-3.7.3-64bit.exe"
$InstallerPath = "$env:TEMP\AudacitySetup.exe"

# Download the installer
Invoke-WebRequest -Uri $AudacityInstallerUrl -OutFile $InstallerPath

# Silent install
Start-Process -FilePath $InstallerPath -ArgumentList "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-" -Wait -Verb RunAs

# Delete the installer
Remove-Item -Path $InstallerPath -Force

Write-Host "Audacity successfully installed!"

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
$BraveInstallerUrl = "https://laptop-updates.brave.com/download/BRV010?bitness=64"
$InstallerPath = "$env:TEMP\BraveSetup.exe"

# Download the installer
Invoke-WebRequest -Uri $BraveInstallerUrl -OutFile $InstallerPath

# Silent install
Start-Process -FilePath $InstallerPath -ArgumentList "/silent /install" -Wait -Verb RunAs

# Delete the installer
Remove-Item -Path $InstallerPath -Force

Write-Host "Brave browser succesfully installed!"

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
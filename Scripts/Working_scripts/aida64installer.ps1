$AidaInstallerUrl = "https://download.aida64.com/aida64extreme765.exe"
$InstallerPath = "$env:TEMP\aida64extreme765.exe"

# download the AIDA64 installer
Invoke-WebRequest -Uri $AidaInstallerUrl -OutFile $InstallerPath

# Silent install
Start-Process -FilePath $InstallerPath -ArgumentList "/SILENT" -Wait -Verb RunAs

# Deleting the isntaller
Remove-Item -Path $InstallerPath -Force

Write-Host "AIDA64 succesfully installed!"

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
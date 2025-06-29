$VlcInstallerUrl = "https://www.sooftware.com/mirrors/VLC/vlc/3.0.21/win64/vlc-3.0.21-win64.exe"
$InstallerPath = "$env:TEMP\vlc-3.0.21-win64.exe"

# Installer download
Invoke-WebRequest -Uri $VlcInstallerUrl -OutFile $InstallerPath

# Silent install
Start-Process -FilePath $InstallerPath -ArgumentList "/S" -Wait -Verb RunAs

# Deleting the installer
Remove-Item -Path $InstallerPath -Force

Write-Host "VLC Media player installed succesfully!"
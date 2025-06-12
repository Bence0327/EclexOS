$VscInstallerUrl = "https://aka.ms/win32-x64-user-stable"
$InstallerPath = "$env:TEMP\VSCodeUserSetup-x64-1.99.1.exe"

# Download the installer
Invoke-WebRequest -Uri $VscInstallerUrl -OutFile $InstallerPath

# Silent install
Start-Process -FilePath $InstallerPath -ArgumentList "/VERYSILENT /NORESTART /MERGETASKS=!runcode" -Wait -Verb RunAs

# Deleting the installer
Remove-Item -Path $InstallerPath -Force

Write-Host "Visual Studio Code successfully installed!"
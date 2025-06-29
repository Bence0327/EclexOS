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
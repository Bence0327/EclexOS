# Download the installer
$tempPath = "$env:TEMP\VencordInstallerCli.exe"
$downloadUrl = "https://github.com/Vencord/Installer/releases/latest/download/VencordInstallerCli.exe"

Invoke-WebRequest -Uri $downloadUrl -OutFile $tempPath

# Execute the installer - The installation part is not working, I need to find the good argument for it
Start-Process -FilePath $tempPath -ArgumentList "--install --branch stable --no-prompt" -Wait

#Remove the installer after installation
Remove-Item -Path $tempPath -Force -ErrorAction SilentlyContinue
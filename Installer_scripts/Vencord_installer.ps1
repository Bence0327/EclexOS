# Download
$installerUrl = "https://github.com/Vencord/Installer/releases/latest/download/VencordInstallerCli.exe"
$installerPath = "$env:TEMP\VencordInstallerCli.exe"

Invoke-WebRequest -Uri $installerUrl -OutFile $installerPath

# Start the installer
Start-Process -FilePath $installerPath
Start-Sleep -Seconds 2  # Give it a moment to launch

# Simulate key presses
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing


[System.Windows.Forms.SendKeys]::SendWait("{ENTER}")
Start-Sleep -Seconds 10
[System.Windows.Forms.SendKeys]::SendWait("{ENTER}")
Start-Sleep -Seconds 10
[System.Windows.Forms.SendKeys]::SendWait("{ENTER}")
Start-Sleep -Seconds 10

# Delete the installer
Remove-Item -Path $installerPath -Force
$InstallerUrl = "https://gamedownloads.rockstargames.com/public/installer/Rockstar-Games-Launcher.exe"
$InstallerPath = "$env:TEMP\RockstarInstaller.exe"

# Download the installer
Invoke-WebRequest -Uri $InstallerUrl -OutFile $InstallerPath

# Start installer WITHOUT waiting
Start-Process -FilePath $InstallerPath
Start-Sleep -Seconds 3  # Give it time to open

# Create WScript object for hotkeys
$wshell = New-Object -ComObject WScript.Shell

# Simulate key presses while installer is open
$wshell.SendKeys("{TAB 14}")
$wshell.SendKeys("{ENTER}")
Start-Sleep -Seconds 2

$wshell.SendKeys("{TAB 7}")
$wshell.SendKeys("{ENTER}")
Start-Sleep -Seconds 2

$wshell.SendKeys("{TAB 4}")
$wshell.SendKeys("{ENTER}")

$wshell.SendKeys("{TAB 3}")
$wshell.SendKeys("{ENTER}")
Start-Sleep -Seconds 2

$wshell.SendKeys("{TAB 8}")
$wshell.SendKeys("{ENTER}")
Start-Sleep -Seconds 30

$wshell.SendKeys("{TAB 4}")
$wshell.SendKeys("{ENTER}")

$wshell.SendKeys("{TAB 2}")
$wshell.SendKeys("{ENTER}")

Write-Host "Rockstar Games Launcher has been installed with automated key presses!"
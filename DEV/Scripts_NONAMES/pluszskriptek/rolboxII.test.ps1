Start-Process "$env:TEMP\RobloxInstaller.exe"
Start-Sleep -Seconds 120  # Wait for the installer to open

# Force close the Roblox process
taskkill /F /IM "Roblox.exe"

Write-Host "Roblox installer has been forcefully closed!"
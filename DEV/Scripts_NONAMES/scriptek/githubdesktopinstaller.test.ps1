$GithubDesktopInstallerUrl = "https://central.github.com/deployments/desktop/desktop/latest/win32"
$InstallerPath = "$env:TEMP\GitHubDesktopSetup-x64.exe"

# Let�lt�s
Invoke-WebRequest -Uri $GithubDesktopInstallerUrl -OutFile $InstallerPath

# Csendes telep�t�s
Start-Process -FilePath $InstallerPath -ArgumentList "/S" -Wait -Verb RunAs

# Telep�t� t�rl�se
Remove-Item -Path $InstallerPath -Force

Write-Host "GitHub Desktop sikeresen telep�tve!"
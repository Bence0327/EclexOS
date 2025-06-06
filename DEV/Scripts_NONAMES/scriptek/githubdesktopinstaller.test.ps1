$GithubDesktopInstallerUrl = "https://central.github.com/deployments/desktop/desktop/latest/win32"
$InstallerPath = "$env:TEMP\GitHubDesktopSetup-x64.exe"

# Letöltés
Invoke-WebRequest -Uri $GithubDesktopInstallerUrl -OutFile $InstallerPath

# Csendes telepí­tés
Start-Process -FilePath $InstallerPath -ArgumentList "/S" -Wait -Verb RunAs

# Telepítõ törlése
Remove-Item -Path $InstallerPath -Force

Write-Host "GitHub Desktop sikeresen telepítve!"
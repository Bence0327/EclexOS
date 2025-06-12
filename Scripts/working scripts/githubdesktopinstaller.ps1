#Github Desktop installer script
$GithubDesktopInstallerUrl = "https://central.github.com/deployments/desktop/desktop/latest/win32"
$InstallerPath = "$env:TEMP\GitHubDesktopSetup-x64.exe"

# Installer download
Invoke-WebRequest -Uri $GithubDesktopInstallerUrl -OutFile $InstallerPath

# Start the insatllation process
Start-Process -FilePath $InstallerPath -ArgumentList "/S" -Wait -Verb RunAs

Start-Sleep -Seconds 60

# Close the app after the insatllation
$maxRetry = 5
$retry = 0
while ($retry -lt $maxRetry) {
    try {
        Remove-Item -Path $InstallerPath -Force -ErrorAction Stop
        break
    }
    catch {
        Start-Sleep -Seconds 10
        $retry++
    }
}


Stop-Process -Name "GitHubDesktop" -Force


Write-Host "Github desktop client succesfully installed!"
# GitHub raw link to the uninstaller
$url = "https://raw.githubusercontent.com/Bence0327/EclexOS/refs/heads/main/Installer_scripts/Uninstallers/Uninstall_office_activation.ps1"

# Giving the place and name to download the script
$filename = "I don't need Office activation.ps1"
$desktop = [Environment]::GetFolderPath("Desktop")
$destination = Join-Path $desktop $filename

# Downloading the script so it can be executed or deleted by the user
Invoke-WebRequest -Uri $url -OutFile $destination
# Links for the installer
$rawUrl = "LINK"  # Needs to be changed after next commit

# Target setting
$desktopPath = [Environment]::GetFolderPath("Desktop")
$targetPath = Join-Path $desktopPath "Installing recommended server services.ps1"

# File download
Invoke-WebRequest -Uri $rawUrl -OutFile $targetPath
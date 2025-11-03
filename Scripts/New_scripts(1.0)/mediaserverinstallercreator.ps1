# Link setup
$rawUrl = "LINK"  # Needs to be changed after next commit

# Target setting
$desktopPath = [Environment]::GetFolderPath("Desktop")
$targetPath = Join-Path $desktopPath "Jellyfin server installer.ps1"

# File download
Invoke-WebRequest -Uri $rawUrl -OutFile $targetPath
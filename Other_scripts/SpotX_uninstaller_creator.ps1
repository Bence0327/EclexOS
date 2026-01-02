# Current desktop
$desktop = [Environment]::GetFolderPath("Desktop")

# Place of the uninstaller
$destination = Join-Path $desktop "I don't need modded Spotify.bat"

# Giving download link
$url = "https://raw.githubusercontent.com/SpotX-Official/SpotX/refs/heads/main/Uninstall.bat"

# Downloading the file to the desired place
Invoke-WebRequest -Uri $url -OutFile $destination
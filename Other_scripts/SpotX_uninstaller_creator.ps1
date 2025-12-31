# GitHub raw link to the uninstaller(not ready)
$url = "https://raw.githubusercontent.com/Bence0327/EclexOS/refs/heads/main/Scripts/New%20scripts(1.0)/Uninstallofficeactivation.ps1"

# Giving the place and name to download the script
$filename = "I don't need modded Spotify.ps1"
$desktop = [Environment]::GetFolderPath("Desktop")
$destination = Join-Path $desktop $filename

# Downloading the script so it can be executed or deleted by the user
Invoke-WebRequest -Uri $url -OutFile $destination
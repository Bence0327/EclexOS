# Az asztal elérési útja a jelenlegi felhasználónál
$desktop = [Environment]::GetFolderPath("Desktop")

# A célfájl teljes elérési útja
$destination = Join-Path $desktop "Uninstall the mod from Spotify.bat"

# A letöltés URL-je
$url = "https://raw.githubusercontent.com/SpotX-Official/SpotX/refs/heads/main/Uninstall.bat"

# Letöltés és mentés az asztalra
Invoke-WebRequest -Uri $url -OutFile $destination
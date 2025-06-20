# GitHub raw link to the uninstaller(not ready)
$url = "https://raw.githubusercontent.com/FELHASZNALO/REPO/BRANCH/fajl.ps1"

# Célfájlnév az asztalon
$filename = "I don't need Office activation.ps1"

# Asztal elérési útja
$desktop = [Environment]::GetFolderPath("Desktop")
$destination = Join-Path $desktop $filename

# Letöltés és mentés új névvel
Invoke-WebRequest -Uri $url -OutFile $destination
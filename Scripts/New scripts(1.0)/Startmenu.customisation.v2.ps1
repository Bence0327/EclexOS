# RAW link — IDE írd be a végleges URL-t, ha már megvan
$url = "https://raw.githubusercontent.com/FELHASZNALO/REPO/BRANCH/fajl.bin"

# Célútvonal a LOCALAPPDATA alá
$destination = Join-Path $env:LOCALAPPDATA "Packages\Microsoft.Windows.StartMenuExperienceHost_cw5n1h2txyewy\LocalState\start2.bin"

# Letöltés és mentés
Invoke-WebRequest -Uri $url -OutFile $destination

Write-Host "A fájl sikeresen le lett töltve: $destination"
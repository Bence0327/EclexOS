# RAW link — IDE írd be a végleges URL-t, ha már megvan
$url = "https://github.com/Bence0327/EclexOS/raw/refs/heads/main/Scripts/New%20scripts(1.0)/Startmenu.gamer.bin"

# Célútvonal a LOCALAPPDATA alá
$destination = Join-Path $env:LOCALAPPDATA "Packages\Microsoft.Windows.StartMenuExperienceHost_cw5n1h2txyewy\LocalState\start2.bin"

# Letöltés és mentés
Invoke-WebRequest -Uri $url -OutFile $destination
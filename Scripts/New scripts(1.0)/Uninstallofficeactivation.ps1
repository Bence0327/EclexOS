# URL a .cmd fájlhoz
$url = "https://raw.githubusercontent.com/massgravel/Microsoft-Activation-Scripts/refs/heads/master/MAS/Separate-Files-Version/Activators/Ohook_Activation_AIO.cmd"

# Ideiglenes fájlútvonal
$tempFile = Join-Path $env:TEMP "Ohook_Activation_AIO.cmd"

# Letöltés
Invoke-WebRequest -Uri $url -OutFile $tempFile

# Futtatás paraméterrel
Start-Process -FilePath $tempFile -ArgumentList "/Ohook-Uninstall" -Wait

# Törlés a futtatás után
Remove-Item -Path $tempFile -Force
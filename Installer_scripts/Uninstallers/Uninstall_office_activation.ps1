# URL for the .cmd file
$url = "https://raw.githubusercontent.com/massgravel/Microsoft-Activation-Scripts/refs/heads/master/MAS/Separate-Files-Version/Activators/Ohook_Activation_AIO.cmd"

# Giving the temp file a place
$tempFile = Join-Path $env:TEMP "Ohook_Activation_AIO.cmd"

# Downloading
Invoke-WebRequest -Uri $url -OutFile $tempFile

# Running with paraemters
Start-Process -FilePath $tempFile -ArgumentList "/Ohook-Uninstall" -Wait

# Removing temp file
Remove-Item -Path $tempFile -Force
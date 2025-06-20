# Office telepítés – GitHub RAW XML használatával
$downloadsFolder = [System.IO.Path]::Combine($env:USERPROFILE, "Downloads", "Office")
$xmlFile = "$downloadsFolder\Configuration.xml"
$setupExe = "$downloadsFolder\setup.exe"

# Példa RAW XML link (ezt cseréld majd ki a sajátodra)
$xmlDownloadUrl = "https://raw.githubusercontent.com/Bence0327/EclexOS/refs/heads/main/XML/OfficeConfiguration.xml"
$setupDownloadUrl = "https://officecdn.microsoft.com/pr/wsus/setup.exe"

# Mappa létrehozása, ha nem létezik
if (!(Test-Path -Path $downloadsFolder)) {
    New-Item -ItemType Directory -Path $downloadsFolder | Out-Null
}

# Letöltés: Office setup és XML
Invoke-WebRequest -Uri $setupDownloadUrl -OutFile $setupExe
Invoke-WebRequest -Uri $xmlDownloadUrl -OutFile $xmlFile

# Telepítés XML alapján
Start-Process -FilePath $setupExe -ArgumentList "/configure `"$xmlFile`"" -Wait

# Letöltött fájlok törlése
Remove-Item -Path $downloadsFolder -Recurse -Force
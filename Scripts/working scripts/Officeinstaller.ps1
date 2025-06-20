# Office installation
$downloadsFolder = [System.IO.Path]::Combine($env:USERPROFILE, "Downloads", "Office")
$xmlFile = "$downloadsFolder\Configuration.xml"
$setupExe = "$downloadsFolder\setup.exe"
$downloadUrl = "https://officecdn.microsoft.com/pr/wsus/setup.exe"

# Download the Office setup
if (!(Test-Path -Path $downloadsFolder)) {
    New-Item -ItemType Directory -Path $downloadsFolder | Out-Null
}

Invoke-WebRequest -Uri $downloadUrl -OutFile $setupExe

$drives = Get-PSDrive -PSProvider FileSystem | Where-Object {$_.Root -match "^[A-Z]:"}


#Installing office using the XML configuration file
foreach ($drive in $drives) {
    $xmlPath = Get-ChildItem -Path "$($drive.Root)" -Recurse -Filter "Configuration.xml" -ErrorAction SilentlyContinue| Select-Object -ExpandProperty FullName
    if ($xmlPath) {
        Copy-Item -Path $xmlPath -Destination $xmlFile -Force
        break
    }
}

#Start the Office installation
Start-Process -FilePath $setupExe -ArgumentList "/configure $xmlFile" -Wait

# Clean up the downloaded files
Remove-Item -Path $downloadsFolder -Recurse -Force

# Note: This script downloads the XML configuration file from my github. Also the installer will instal office in the system's language. If you want ot add more languages, you need to do that manually!
# You can find the XML file at the main\XML\Officecnfiguration folder.


# Office telepítés – GitHub RAW XML használatával
$downloadsFolder = [System.IO.Path]::Combine($env:USERPROFILE, "Downloads", "Office")
$xmlFile = "$downloadsFolder\Configuration.xml"
$setupExe = "$downloadsFolder\setup.exe"

# Példa RAW XML link (ezt cseréld majd ki a sajátodra)
$xmlDownloadUrl = "https://raw.githubusercontent.com/username/repo/branch/path/to/Configuration.xml"
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
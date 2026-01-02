# Office installation using the XML given for EclexOS
$downloadsFolder = [System.IO.Path]::Combine($env:USERPROFILE, "Downloads", "Office")
$xmlFile = "$downloadsFolder\Configuration.xml"
$setupExe = "$downloadsFolder\setup.exe"

# The XML file can be found on EclexOS's GitHub repo
$xmlDownloadUrl = "https://raw.githubusercontent.com/Bence0327/EclexOS/refs/heads/main/Installer_scripts/OfficeConfiguration.xml"
$setupDownloadUrl = "https://officecdn.microsoft.com/pr/wsus/setup.exe"

# Creating the downloads folder in case it doesn't exist - only needed when installing with Windows
if (!(Test-Path -Path $downloadsFolder)) {
    New-Item -ItemType Directory -Path $downloadsFolder | Out-Null
}

# Downloading office installer and the XML
Invoke-WebRequest -Uri $setupDownloadUrl -OutFile $setupExe
Invoke-WebRequest -Uri $xmlDownloadUrl -OutFile $xmlFile

# Installing office using the XML file
Start-Process -FilePath $setupExe -ArgumentList "/configure `"$xmlFile`"" -Wait

# Removing temporary files
Remove-Item -Path $downloadsFolder -Recurse -Force

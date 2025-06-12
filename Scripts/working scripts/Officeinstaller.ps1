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

Write-Host "Office (for personal use) successfully installed!"
# Note: This script assumes that the XML configuration file is present in one of the drives. Using the custom ISOs, you have the XML file on the instalation pendrive.
# You can find the XML file at the main\OFFICE folder.
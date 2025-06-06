# Office telepítése
$downloadsFolder = [System.IO.Path]::Combine($env:USERPROFILE, "Downloads", "Office")
$xmlFile = "$downloadsFolder\Configuration.xml"
$setupExe = "$downloadsFolder\setup.exe"
$downloadUrl = "https://officecdn.microsoft.com/pr/wsus/setup.exe"

if (!(Test-Path -Path $downloadsFolder)) {
    New-Item -ItemType Directory -Path $downloadsFolder | Out-Null
}

Invoke-WebRequest -Uri $downloadUrl -OutFile $setupExe

$drives = Get-PSDrive -PSProvider FileSystem | Where-Object {$_.Root -match "^[A-Z]:"}

foreach ($drive in $drives) {
    $xmlPath = Get-ChildItem -Path "$($drive.Root)" -Recurse -Filter "Configuration.xml" -ErrorAction SilentlyContinue| Select-Object -ExpandProperty FullName
    if ($xmlPath) {
        Copy-Item -Path $xmlPath -Destination $xmlFile -Force
        break
    }
}

Start-Process -FilePath $setupExe -ArgumentList "/configure $xmlFile" -Wait

Remove-Item -Path $downloadsFolder -Recurse -Force

Set-ExecutionPolicy Bypass -Scope Process -Force

$DownloadUrl = "https://github.com/massgravel/Microsoft-Activation-Scripts/archive/refs/heads/master.zip"
$TargetFolder = "$env:USERPROFILE\Downloads\Activator"
$ZipFile = "$TargetFolder\Scripts.zip"

if (!(Test-Path -Path $TargetFolder)) { New-Item -ItemType Directory -Path $TargetFolder | Out-Null }

Write-Host "Office (for personal use) installed sucsessfully! Activation in progress..."

Invoke-WebRequest -Uri $DownloadUrl -OutFile $ZipFile -UseBasicParsing

Expand-Archive -Path $ZipFile -DestinationPath $TargetFolder -Force
$FirstCmdFile = "$TargetFolder\Microsoft-Activation-Scripts-master\MAS\Separate-Files-Version\Activators\HWID_Activation.cmd"
$SecondCmdFile = "$TargetFolder\Microsoft-Activation-Scripts-master\MAS\Separate-Files-Version\Activators\Ohook_Activation_AIO.cmd"

Start-Process -FilePath $FirstCmdFile -ArgumentList "/HWID" -Wait

Start-Process -FilePath $SecondCmdFile -ArgumentList "/Ohook" -Wait

Remove-Item -Path $TargetFolder -Recurse -Force

Write-Output "Windows and Office activated sucsessfully!"

Write-Host "Warning!"
Start-Sleep -Seconds 10
Write-Host "Office and Windows activated via MAS! This activation is unoffical!"
Start-Sleep -Seconds 10
Write-Host "If you'd like to use a custom Windows key, you can activate Windows in the settings!"
Start-Sleep -Seconds 10
Write-Host "For uninstalling the Office activation and for entering a custom key, run the Powershell script on your desktop!"
Start-Sleep -Seconds 10
Write-Host "The Office activation removal Powershell is not available in the Beta version!"
Start-Sleep -Seconds 10
Write-Host  "You can ask for help through Discord (Bence0327). Sorry for the inconvenience!"

# SpotX automatikus beállító script
iex "& { $(iwr -useb 'https://raw.githubusercontent.com/SpotX-Official/spotx-official.github.io/main/run.ps1') } -confirm_uninstall_ms_spoti -confirm_spoti_recomended_over -podcasts_off -block_update_on -start_spoti -new_theme -adsections_off -lyrics_stat spotify"

#Aida64 installer
$AidaInstallerUrl = "https://download.aida64.com/aida64extreme765.exe"
$InstallerPath = "$env:TEMP\aida64extreme765.exe"

Invoke-WebRequest -Uri $AidaInstallerUrl -OutFile $InstallerPath

Start-Process -FilePath $InstallerPath -ArgumentList "/SILENT" -Wait -Verb RunAs

Remove-Item -Path $InstallerPath -Force

Write-Host "Aida64(stresstest softver) installed sucsesfully!"

#Vlc installer
$VlcInstallerUrl = "https://www.sooftware.com/mirrors/VLC/vlc/3.0.21/win64/vlc-3.0.21-win64.exe"
$InstallerPath = "$env:TEMP\vlc-3.0.21-win64.exe"

Invoke-WebRequest -Uri $VlcInstallerUrl -OutFile $InstallerPath

Start-Process -FilePath $InstallerPath -ArgumentList "/S" -Wait -Verb RunAs

Remove-Item -Path $InstallerPath -Force

Write-Host "Vlc media player installed sucsesfully!"

#Brave installer
$BraveInstallerUrl = "https://laptop-updates.brave.com/download/BRV010?bitness=64"
$InstallerPath = "$env:TEMP\BraveSetup.exe"

Invoke-WebRequest -Uri $BraveInstallerUrl -OutFile $InstallerPath

Start-Process -FilePath $InstallerPath -ArgumentList "/silent /install" -Wait -Verb RunAs

Remove-Item -Path $InstallerPath -Force

Write-Host "Brave(browser) installed sucsesfully!"

#Revo uninstaller installer
$installerUrl = "https://f3b1cfc5d488c0384dc3-056ccca39cd416ca6db85fa26f78b9ef.ssl.cf1.rackcdn.com/revosetup.exe"
$installerPath = "$env:TEMP\revosetup.exe"

Invoke-WebRequest -Uri $installerUrl -OutFile $installerPath

Start-Process -FilePath $installerPath -ArgumentList "/VERYSILENT /NORESTART" -Wait

Remove-Item -Path $installerPath -Force

Write-Host "Modded Spotify (Made by: SpotX) installed sucsesfully!"

Write-Output "All app installed successfully, Office and Windows activated! The Windows installation should be finished soon!"
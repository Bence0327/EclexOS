#Aida64 installer
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

# SpotX automatikus beállító script
iex "& { $(iwr -useb 'https://raw.githubusercontent.com/SpotX-Official/spotx-official.github.io/main/run.ps1') } -confirm_uninstall_ms_spoti -confirm_spoti_recomended_over -podcasts_off -block_update_on -start_spoti -new_theme -adsections_off -lyrics_stat spotify"

Stop-Process -Name "Spotify" -Force

Write-Host "Modded Spotify (Made by: SpotX) installed sucsesfully!"

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

Start-Process -FilePath $FirstCmdFile
Start-Sleep -Seconds 200

Add-Type @"
using System;
using System.Runtime.InteropServices;
public class Keyboard {
    [DllImport("user32.dll")]
    public static extern void keybd_event(byte bVk, byte bScan, uint dwFlags, uint dwExtraInfo);
    public static void PressKey(byte key) {
        keybd_event(key, 0, 0, 0); // Press
        keybd_event(key, 0, 2, 0); // Release
    }
}
"@

Start-Sleep -Seconds 10
[Keyboard]::PressKey(0x30)
Start-Sleep -Seconds 10

Start-Process -FilePath $SecondCmdFile
Start-Sleep -Seconds 90

[Keyboard]::PressKey(0x31)
Start-Sleep -Seconds 180

[Keyboard]::PressKey(0x30)

Start-Sleep -Seconds 10

Remove-Item -Path $TargetFolder -Recurse -Force

Write-Output "Windows and Office activated sucsessfully!"

# Egyéb alkalmazások telepítése wingettel
if( [System.Environment]::OSVersion.Version.Build -lt 26100 ) {
    'This script requires Windows 11 24H2 or later.' | Write-Warning;
    return;
}

$timeout = [datetime]::Now.AddMinutes(5);
$exe = "$env:LOCALAPPDATA\Microsoft\WindowsApps\winget.exe";

function Verify-Installation {
    param (
        [string]$appId,
        [int]$maxWaitTime = 300
    )

    $startTime = Get-Date
    while ((Get-Date).Subtract($startTime).TotalSeconds -lt $maxWaitTime) {
        $installed = winget list | Select-String -Pattern $appId
        if ($installed) {
            return $true
        }
        Start-Sleep -Seconds 5
    }
    return $false
}

while( $true ) {
    if( $exe | Test-Path ) {
        # Install Revo Uninstaller
        & $exe install -e --id RevoUninstaller.RevoUninstaller --accept-package-agreements;

        # Verify Revo Uninstaller installation
        if (-not (Verify-Installation -appId "RevoUninstaller.RevoUninstaller")) {
            return;
        }

        return;
    }
    
    if( [datetime]::Now -gt $timeout ) {
        return;
    }
    
    Start-Sleep -Seconds 1;
}

Write-Host "Warning!"
Start-Sleep -Seconds 10
Write-Host "Office and Windows activated via MAS! This activation is unoffical!"
Start-Sleep -Seconds 10
Write-Host "If you'd like to use a custom Windows key, you can activate Windows in the settings!"
Start-Sleep -Seconds 10
Write-Host "For uninstalling the Office activation and for entering a custom key, run the Powershell script on your desktop!"
Start-Sleep -Seconds 10
Write-Host "The Office activation removal Powershell is not available in the Beta version! You can ask for help through Discord (Bence0327). Sorry for the inconvenience!"
Start-Sleep -Seconds 10

Write-Output "All app installed successfully, Office and Windows activated! The Windows installation will be finished soon!"
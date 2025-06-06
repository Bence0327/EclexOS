# Aida64, VLC, GitHub Desktop, Epic Games, VSCode, TeamViewer, Brave, Steam, HandBrake, EA App, Audacity, OBS telepítése
$AidaInstallerUrl = "https://download.aida64.com/aida64extreme765.exe"
$InstallerPath = "$env:TEMP\aida64extreme765.exe"

#Aida64 installer
Invoke-WebRequest -Uri $AidaInstallerUrl -OutFile $InstallerPath

Start-Process -FilePath $InstallerPath -ArgumentList "/SILENT" -Wait -Verb RunAs

Remove-Item -Path $InstallerPath -Force

Write-Host "Aida64(stresstest softver) installed sucsesfully!"Write-Host "Aida64(stresstest softver) installed sucsesfully!"

#Vlc installer
$VlcInstallerUrl = "https://www.sooftware.com/mirrors/VLC/vlc/3.0.21/win64/vlc-3.0.21-win64.exe"
$InstallerPath = "$env:TEMP\vlc-3.0.21-win64.exe"

Invoke-WebRequest -Uri $VlcInstallerUrl -OutFile $InstallerPath

Start-Process -FilePath $InstallerPath -ArgumentList "/S" -Wait -Verb RunAs

Remove-Item -Path $InstallerPath -Force

Write-Host "Vlc media player installed sucsesfully!"

#Teamviewer insatller
$TeamViewerInstallerUrl = "https://download.teamviewer.com/download/TeamViewer_Setup.exe"
$InstallerPath = "$env:TEMP\TeamViewerSetup.exe"

Invoke-WebRequest -Uri $TeamViewerInstallerUrl -OutFile $InstallerPath

Start-Process -FilePath $InstallerPath -ArgumentList "/S" -Wait -Verb RunAs

Remove-Item -Path $InstallerPath -Force

Write-Host "Teamviewer sikeresen telepítve!"

#Brave installer
$BraveInstallerUrl = "https://laptop-updates.brave.com/download/BRV010?bitness=64"
$InstallerPath = "$env:TEMP\BraveSetup.exe"

Invoke-WebRequest -Uri $BraveInstallerUrl -OutFile $InstallerPath

Start-Process -FilePath $InstallerPath -ArgumentList "/silent /install" -Wait -Verb RunAs

Remove-Item -Path $InstallerPath -Force

Write-Host "Brave(browser) installed sucsesfully!"

#Handbrake installer
$HandBrakeInstallerUrl = "https://github.com/HandBrake/HandBrake/releases/download/1.9.2/HandBrake-1.9.2-x86_64-Win_GUI.exe"
$InstallerPath = "$env:TEMP\HandBrake-1.9.2-x86_64-Win_GUI.exe"

Invoke-WebRequest -Uri $HandBrakeInstallerUrl -OutFile $InstallerPath

Start-Process -FilePath $InstallerPath -ArgumentList "/S" -Wait -Verb RunAs

Remove-Item -Path $InstallerPath -Force

$ShortcutPath = "$env:USERPROFILE\Desktop\HandBrake.lnk"
$TargetPath = "C:\Program Files\HandBrake\HandBrake.exe"

$WshShell = New-Object -ComObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut($ShortcutPath)
$Shortcut.TargetPath = $TargetPath
$Shortcut.WorkingDirectory = "C:\Program Files\HandBrake"
$Shortcut.Save()

Write-Host "Handbrake(video converter software) installed successfully!"

Invoke-WebRequest -Uri $DownloadUrl -OutFile $ZipFile -UseBasicParsing

Expand-Archive -Path $ZipFile -DestinationPath $TargetFolder -Force
$FirstCmdFile = "$TargetFolder\Microsoft-Activation-Scripts-master\MAS\Separate-Files-Version\Activators\HWID_Activation.cmd"

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

Write-Output "Windows activated successfully!"

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
        # Install Anydesk
        & $exe install --id Anydesk.Anydesk --accept-package-agreements;

        # Verify Anydesk installation
        if (-not (Verify-Installation -appId "Anydesk.Anydesk")) {
            return;
        }

        # Install qBittorrent
        & $exe install --id qBittorrent.qBittorrent --accept-package-agreements;

        # Verify qBittorrent installation
        if (-not (Verify-Installation -appId "qBittorrent.qBittorrent")) {
            return;
        }

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
Write-Host "Windows activated via MAS! This activation is unoffical!"
Start-Sleep -Seconds 10
Write-Host "If you'd like to use a custom Windows key, you can activate Windows in the settings!"
Start-Sleep -Seconds 10

Write-Output "All app installed successfully, Office and Windows activated! The Windows installation will be finished soon!"
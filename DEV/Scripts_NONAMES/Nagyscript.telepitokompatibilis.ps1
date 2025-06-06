Add-Type @"
using System;
using System.Runtime.InteropServices;

public class Keyboard {
    [DllImport("user32.dll", SetLastError = true)]
    public static extern void keybd_event(byte bVk, byte bScan, uint dwFlags, IntPtr dwExtraInfo);

    public const int KEYEVENTF_KEYDOWN = 0x0000;
    public const int KEYEVENTF_KEYUP = 0x0002;

    public static void PressKey(byte keyCode) {
        keybd_event(keyCode, 0, KEYEVENTF_KEYDOWN, IntPtr.Zero);
        System.Threading.Thread.Sleep(50);
        keybd_event(keyCode, 0, KEYEVENTF_KEYUP, IntPtr.Zero);
    }
}
"@

$wshell = New-Object -ComObject WScript.Shell

[Keyboard]::PressKey(0x5B)
Start-Sleep -Seconds 2

$InstallerUrl = "https://gamedownloads.rockstargames.com/public/installer/Rockstar-Games-Launcher.exe"
$InstallerPath = "$env:TEMP\Rockstar-Games-Launcher.exe"

Invoke-WebRequest -Uri $InstallerUrl -OutFile $InstallerPath

Start-Process -FilePath $InstallerPath
Start-Sleep -Seconds 3


$InstallerRunning = $false

while (-not $InstallerRunning) {
    $ProcessList = Get-Process | Where-Object { $_.ProcessName -like "Rockstar*" }
    if ($ProcessList) {
        $InstallerRunning = $true
        Write-Host "Installer elindult, várunk 10 másodpercet..."
        Start-Sleep -Seconds 10

        [Keyboard]::PressKey(0x5B)
        Start-Sleep -Seconds 2
    } else {
        Write-Host "Installer még nem fut, ellenőrzés újra 2 másodperc múlva..."
        Start-Sleep -Seconds 10
    }
}


$wshell.AppActivate("Rockstar Games Launcher")
Start-Sleep -Seconds 2

$wshell.SendKeys("{TAB 14}")
$wshell.SendKeys("{ENTER}")
Start-Sleep -Seconds 2

$wshell.SendKeys("{TAB 7}")
$wshell.SendKeys("{ENTER}")
Start-Sleep -Seconds 2

$wshell.SendKeys("{TAB 4}")
$wshell.SendKeys("{ENTER}")

$wshell.SendKeys("{TAB 3}")
$wshell.SendKeys("{ENTER}")
Start-Sleep -Seconds 2

$wshell.SendKeys("{TAB 8}")
$wshell.SendKeys("{ENTER}")
Start-Sleep -Seconds 120

$wshell.SendKeys("{TAB 4}")
$wshell.SendKeys("{ENTER}")

$wshell.SendKeys("{TAB 2}")
$wshell.SendKeys("{ENTER}")

Write-Host "Rockstar Games Launcher sikeresen telepítve!"
Start-Sleep -Seconds 200

# Roblox telepítő és bezáró script
Add-Type @"
using System;
using System.Runtime.InteropServices;
public class WinAPI {
    [DllImport("user32.dll", CharSet = CharSet.Auto)]
    public static extern IntPtr FindWindow(string lpClassName, string lpWindowName);
    
    [DllImport("user32.dll", CharSet = CharSet.Auto)]
    public static extern bool PostMessage(IntPtr hWnd, uint Msg, IntPtr wParam, IntPtr lParam);
    public const uint WM_CLOSE = 0x0010;

    public static void CloseWindow(string windowTitle) {
        IntPtr hWnd = FindWindow(null, windowTitle);
        if (hWnd != IntPtr.Zero) {
            PostMessage(hWnd, WM_CLOSE, IntPtr.Zero, IntPtr.Zero);
        }
    }
}
"@

$InstallerUrl = "https://www.roblox.com/download/client?os=win"
$InstallerPath = "$env:TEMP\RobloxPlayerInstaller.exe"
Invoke-WebRequest -Uri $InstallerUrl -OutFile $InstallerPath
Start-Process -FilePath $InstallerPath
Start-Sleep -Seconds 3
Start-Sleep -Seconds 60
[WinAPI]::CloseWindow("Roblox Game Client")
[WinAPI]::CloseWindow("Roblox")

Write-Host "Roblox sikeresen telepítve!"

# Aida64, VLC, GitHub Desktop, Epic Games, VSCode, TeamViewer, Brave, Steam, HandBrake, EA App, Audacity, OBS telepítése
$AidaInstallerUrl = "https://download.aida64.com/aida64extreme765.exe"
$InstallerPath = "$env:TEMP\aida64extreme765.exe"

#Aida64 installer
Invoke-WebRequest -Uri $AidaInstallerUrl -OutFile $InstallerPath

Start-Process -FilePath $InstallerPath -ArgumentList "/SILENT" -Wait -Verb RunAs

Remove-Item -Path $InstallerPath -Force

Write-Host "Aida64(stresszteszt szoftver) sikeresen telepítve!"

#Vlc installer
$VlcInstallerUrl = "https://www.sooftware.com/mirrors/VLC/vlc/3.0.21/win64/vlc-3.0.21-win64.exe"
$InstallerPath = "$env:TEMP\vlc-3.0.21-win64.exe"

Invoke-WebRequest -Uri $VlcInstallerUrl -OutFile $InstallerPath

Start-Process -FilePath $InstallerPath -ArgumentList "/S" -Wait -Verb RunAs

Remove-Item -Path $InstallerPath -Force

Write-Host "Vlc media player sikeresen telepítve!"

#Github Desktop+Git Installer
$GithubDesktopInstallerUrl = "https://central.github.com/deployments/desktop/desktop/latest/win32"
$InstallerPath = "$env:TEMP\GitHubDesktopSetup-x64.exe"
Invoke-WebRequest -Uri $GithubDesktopInstallerUrl -OutFile $InstallerPath

Start-Process -FilePath $InstallerPath -ArgumentList "/S" -Wait -Verb RunAs

Start-Sleep -Seconds 60

$maxRetry = 5
$retry = 0
while ($retry -lt $maxRetry) {
    try {
        Remove-Item -Path $InstallerPath -Force -ErrorAction Stop
        break
    }
    catch {
        Start-Sleep -Seconds 10
        $retry++
    }
}

# Github Desktop bezárása
Stop-Process -Name "GitHubDesktop" -Force

Write-Host "Github desktop client és Git sikeresen telepítve!"

#EpicGames Launcher installer
$EpicInstallerUrl = "https://launcher-public-service-prod06.ol.epicgames.com/launcher/api/installer/download/EpicGamesLauncherInstaller.msi"
$InstallerPath = "$env:TEMP\EpicGamesLauncher.msi"

Invoke-WebRequest -Uri $EpicInstallerUrl -OutFile $InstallerPath

Start-Process -FilePath "msiexec.exe" -ArgumentList "/i $InstallerPath /quiet /norestart" -Wait -Verb RunAs

Remove-Item -Path $InstallerPath -Force

Write-Host "Epic Games Launcher sikeresen telepítve!"

#VSC Installer
$VscInstallerUrl = "https://aka.ms/win32-x64-user-stable"
$InstallerPath = "$env:TEMP\VSCodeUserSetup-x64-1.99.1.exe"

Invoke-WebRequest -Uri $VscInstallerUrl -OutFile $InstallerPath

Start-Process -FilePath $InstallerPath -ArgumentList "/VERYSILENT /NORESTART /MERGETASKS=!runcode" -Wait -Verb RunAs

Remove-Item -Path $InstallerPath -Force

Write-Host "Visual Studio Code sikeresen telepítve!"

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

Write-Host "Brave(böngésző) sikeresen telepítve!"

#Steam installer
$SteamInstallerUrl = "https://cdn.cloudflare.steamstatic.com/client/installer/SteamSetup.exe"
$InstallerPath = "$env:TEMP\SteamSetup.exe"

Invoke-WebRequest -Uri $SteamInstallerUrl -OutFile $InstallerPath

Start-Process -FilePath $InstallerPath -ArgumentList "/S" -Wait -Verb RunAs

Remove-Item -Path $InstallerPath -Force

Write-Host "Steam sikeresen telepítve!"

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

Write-Host "Handbrake(video konveráló szoftver) sikeresen telepítve!"

#Elektronikus művészet app installer
$EAInstallerUrl = "https://origin-a.akamaihd.net/EA-Desktop-Client-Download/installer-releases/EAappInstaller.exe"
$InstallerPath = "$env:TEMP\EAAppSetup.exe"

Invoke-WebRequest -Uri $EAInstallerUrl -OutFile $InstallerPath

Start-Process -FilePath $InstallerPath -ArgumentList "/silent /install" -Wait -Verb RunAs

Remove-Item -Path $InstallerPath -Force

# EA App bezárása
Start-Sleep -Seconds 60
Stop-Process -Name "EA" -Force

Write-Host "Elektronikus művészet app sikeresen telepítve!"

#Audacity installer
$AudacityInstallerUrl = "https://github.com/audacity/audacity/releases/download/Audacity-3.7.3/audacity-win-3.7.3-64bit.exe"
$InstallerPath = "$env:TEMP\AudacitySetup.exe"

Invoke-WebRequest -Uri $AudacityInstallerUrl -OutFile $InstallerPath

Start-Process -FilePath $InstallerPath -ArgumentList "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-" -Wait -Verb RunAs

Remove-Item -Path $InstallerPath -Force

Write-Host "Audacity(hangszerkesztő program) sikeresen telepítve!"

#Obs Studio installer
$ObsInstallerUrl = "https://cdn-fastly.obsproject.com/downloads/OBS-Studio-29.0.2-Full-Installer-x64.exe"
$InstallerPath = "$env:TEMP\OBSSetup.exe"

Invoke-WebRequest -Uri $ObsInstallerUrl -OutFile $InstallerPath

Start-Process -FilePath $InstallerPath -ArgumentList "/S" -Wait -Verb RunAs

Remove-Item -Path $InstallerPath -Force

Write-Host "OBS Studio sikeresen telepítve!"

# SpotX automatikus beállító script
iex "& { $(iwr -useb 'https://raw.githubusercontent.com/SpotX-Official/spotx-official.github.io/main/run.ps1') } -confirm_uninstall_ms_spoti -confirm_spoti_recomended_over -podcasts_off -block_update_on -start_spoti -new_theme -adsections_off -lyrics_stat spotify"

Stop-Process -Name "Spotify" -Force

Write-Host "Modolt Spotify (Made by: SpotX) sikeresen telepítve!"

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

Write-Host "Office (személyes használatra) sikeresen telepítve! Aktiválás folyamatban..."

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

Write-Output "A Windows és az Office sikeresen aktiválva!"

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
        # Install Discord
        & $exe install --id Discord.Discord --silent --accept-package-agreements --accept-source-agreements;

        # Verify Discord installation
        if (Verify-Installation -appId "Discord.Discord") {
            Stop-Process -Name "Discord" -Force -ErrorAction SilentlyContinue;
        } else {
            return;
        }

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

        # Install GIMP
        & $exe install --id=GIMP.GIMP.3 --silent;

        # Verify GIMP installation
        if (-not (Verify-Installation -appId "GIMP.GIMP.3")) {
            return;
        }

        return;
    }
    
    if( [datetime]::Now -gt $timeout ) {
        return;
    }
    
    Start-Sleep -Seconds 1;
}

# Az üzenetablak külön folyamatban fut, így a szkript folytatódhat
Start-Process -FilePath "powershell.exe" -WindowStyle Hidden -ArgumentList "-Command & {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('Üdvözlöm az ITTechOS rendszerén!`nA számítógép használata előtt újraindítás szükséges!`nEzt megteheti az OK gomb megnyomásával, vagy az ablak bezárásával!`n                                                  FIGYELEM! `nAz újraindítást csak az után tegye meg, hogy az ablaktól balra található személyre szabó PowerShell ablak bezáródott!`nSegítségért, valamint a telepítés közben fellépett problémákkal kapcsolatban keressen Discordon!`nA Jelenlegi verziószám: `n                                                  ITTechOS `n                                                  Build 0.1 Alpha', 'ITTechOS telepítési varázsló', 'OK'); Start-Process -FilePath 'shutdown.exe' -ArgumentList '/r /t 0'}"

Write-Host "A Windows és az Office sikeresen aktiválva!"
Start-Sleep -Seconds 10
Write-Host "FIGYELEM!"
Start-Sleep -Seconds 10
Write-Host "Az Office És a windows nem hivatalos módon lett aktiválva!"
Start-Sleep -Seconds 10
Write-Host "Amennyiben egyéni Windows kulcsot szeretne, aktiválhatja a WindowsT a gépházban!"
Start-Sleep -Seconds 10
Write-Host "Az Office aktiváció törléséért és egyéni kulcs megadásáért indítsa el az asztalon található Powershell scriptet!"
Start-Sleep -Seconds 10
Write-Host "Az Office aktiváció törlésére szolgáló Powershell a Beta verzióban nem elérhető! Segítséget kérhet Discordon keresztül. Elnézést a kellemetlenségért!"
Start-Sleep -Seconds 10

Write-Output "Minden szoftver sikeresen telepítve, az Office és a Windows aktiválva! A Windows telepítés hamarosan befejeződik!"
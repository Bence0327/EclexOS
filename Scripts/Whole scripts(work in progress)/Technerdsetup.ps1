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
        Start-Sleep -Seconds 10

        [Keyboard]::PressKey(0x5B)
        Start-Sleep -Seconds 2
    } else {
        Start-Sleep -Seconds 10
    }
}

# Get screen dimensions
$ScreenWidth = [System.Windows.Forms.Screen]::PrimaryScreen.Bounds.Width
$ScreenHeight = [System.Windows.Forms.Screen]::PrimaryScreen.Bounds.Height

# Calculate center of the screen
$CenterX = [math]::Round($ScreenWidth / 2)
$CenterY = [math]::Round($ScreenHeight / 2)

# Move mouse to center and click
Add-Type @"
using System;
using System.Runtime.InteropServices;

public class Mouse {
    [DllImport("user32.dll")]
    public static extern bool SetCursorPos(int X, int Y);

    [DllImport("user32.dll")]
    public static extern void mouse_event(uint dwFlags, int dx, int dy, uint dwData, IntPtr dwExtraInfo);

    public const int MOUSEEVENTF_LEFTDOWN = 0x02;
    public const int MOUSEEVENTF_LEFTUP = 0x04;

    public static void Click(int x, int y) {
        SetCursorPos(x, y);
        mouse_event(MOUSEEVENTF_LEFTDOWN, x, y, 0, IntPtr.Zero);
        mouse_event(MOUSEEVENTF_LEFTUP, x, y, 0, IntPtr.Zero);
    }
}
"@

[Mouse]::Click($CenterX, $CenterY)

# Simulate Tab and Enter keystrokes one by one
Start-Sleep -Seconds 2

# Press Tab 14 times
[Keyboard]::PressKey(0x09)
[Keyboard]::PressKey(0x09)
[Keyboard]::PressKey(0x09)
[Keyboard]::PressKey(0x09)
[Keyboard]::PressKey(0x09)
[Keyboard]::PressKey(0x09)
[Keyboard]::PressKey(0x09)
[Keyboard]::PressKey(0x09)
[Keyboard]::PressKey(0x09)
[Keyboard]::PressKey(0x09)
[Keyboard]::PressKey(0x09)
[Keyboard]::PressKey(0x09)
[Keyboard]::PressKey(0x09)
[Keyboard]::PressKey(0x09)

# Press Enter
[Keyboard]::PressKey(0x0D)

Start-Sleep -Seconds 2

# Press Tab 7 times
[Keyboard]::PressKey(0x09)
[Keyboard]::PressKey(0x09)
[Keyboard]::PressKey(0x09)
[Keyboard]::PressKey(0x09)
[Keyboard]::PressKey(0x09)
[Keyboard]::PressKey(0x09)
[Keyboard]::PressKey(0x09)

# Press Enter
[Keyboard]::PressKey(0x0D)

Start-Sleep -Seconds 2

# Press Tab 4 times
[Keyboard]::PressKey(0x09)
[Keyboard]::PressKey(0x09)
[Keyboard]::PressKey(0x09)
[Keyboard]::PressKey(0x09)

# Press Enter
[Keyboard]::PressKey(0x0D)

Start-Sleep -Seconds 2

# Press Tab 3 times
[Keyboard]::PressKey(0x09)
[Keyboard]::PressKey(0x09)
[Keyboard]::PressKey(0x09)

# Press Enter
[Keyboard]::PressKey(0x0D)

Start-Sleep -Seconds 2

# Press Tab 9 times
[Keyboard]::PressKey(0x09)
[Keyboard]::PressKey(0x09)
[Keyboard]::PressKey(0x09)
[Keyboard]::PressKey(0x09)
[Keyboard]::PressKey(0x09)
[Keyboard]::PressKey(0x09)
[Keyboard]::PressKey(0x09)
[Keyboard]::PressKey(0x09)

# Press Enter
[Keyboard]::PressKey(0x0D)

Start-Sleep -Seconds 120

# Press Tab 4 times
[Keyboard]::PressKey(0x09)
[Keyboard]::PressKey(0x09)
[Keyboard]::PressKey(0x09)
[Keyboard]::PressKey(0x09)

# Press Enter
[Keyboard]::PressKey(0x0D)

# Press Tab 2 times
[Keyboard]::PressKey(0x09)
[Keyboard]::PressKey(0x09)

# Press Enter
[Keyboard]::PressKey(0x0D)


Start-Sleep -Seconds 100

# Roblox installation
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


#Aida64 installer
$AidaInstallerUrl = "https://download.aida64.com/aida64extreme765.exe"
$InstallerPath = "$env:TEMP\aida64extreme765.exe"

Invoke-WebRequest -Uri $AidaInstallerUrl -OutFile $InstallerPath

Start-Process -FilePath $InstallerPath -ArgumentList "/SILENT" -Wait -Verb RunAs

Remove-Item -Path $InstallerPath -Force


#Vlc installer
$VlcInstallerUrl = "https://www.sooftware.com/mirrors/VLC/vlc/3.0.21/win64/vlc-3.0.21-win64.exe"
$InstallerPath = "$env:TEMP\vlc-3.0.21-win64.exe"

Invoke-WebRequest -Uri $VlcInstallerUrl -OutFile $InstallerPath

Start-Process -FilePath $InstallerPath -ArgumentList "/S" -Wait -Verb RunAs

Remove-Item -Path $InstallerPath -Force


#Github Desktop Installer
$GithubDesktopInstallerUrl = "https://central.github.com/deployments/desktop/desktop/latest/win32"
$InstallerPath = "$env:TEMP\GitHubDesktopSetup-x64.exe"

Invoke-WebRequest -Uri $GithubDesktopInstallerUrl -OutFile $InstallerPath

Start-Process -FilePath $InstallerPath -ArgumentList "/S" -Wait -Verb RunAs

Start-Sleep -Seconds 60

Stop-Process -Name "GitHubDesktop" -Force

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


#EpicGames Launcher installer
$EpicInstallerUrl = "https://launcher-public-service-prod06.ol.epicgames.com/launcher/api/installer/download/EpicGamesLauncherInstaller.msi"
$InstallerPath = "$env:TEMP\EpicGamesLauncher.msi"

Invoke-WebRequest -Uri $EpicInstallerUrl -OutFile $InstallerPath

Start-Process -FilePath "msiexec.exe" -ArgumentList "/i $InstallerPath /quiet /norestart" -Wait -Verb RunAs

Remove-Item -Path $InstallerPath -Force


#VSC Installer
$VscInstallerUrl = "https://aka.ms/win32-x64-user-stable"
$InstallerPath = "$env:TEMP\VSCodeUserSetup-x64-1.99.1.exe"

Invoke-WebRequest -Uri $VscInstallerUrl -OutFile $InstallerPath

Start-Process -FilePath $InstallerPath -ArgumentList "/VERYSILENT /NORESTART /MERGETASKS=!runcode" -Wait -Verb RunAs

Remove-Item -Path $InstallerPath -Force


#Teamviewer insatller
$TeamViewerInstallerUrl = "https://download.teamviewer.com/download/TeamViewer_Setup.exe"
$InstallerPath = "$env:TEMP\TeamViewerSetup.exe"

Invoke-WebRequest -Uri $TeamViewerInstallerUrl -OutFile $InstallerPath

Start-Process -FilePath $InstallerPath -ArgumentList "/S" -Wait -Verb RunAs

Remove-Item -Path $InstallerPath -Force


#Brave installer
$BraveInstallerUrl = "https://laptop-updates.brave.com/download/BRV010?bitness=64"
$InstallerPath = "$env:TEMP\BraveSetup.exe"

Invoke-WebRequest -Uri $BraveInstallerUrl -OutFile $InstallerPath

Start-Process -FilePath $InstallerPath -ArgumentList "/silent /install" -Wait -Verb RunAs

Remove-Item -Path $InstallerPath -Force


#Steam installer
$SteamInstallerUrl = "https://cdn.cloudflare.steamstatic.com/client/installer/SteamSetup.exe"
$InstallerPath = "$env:TEMP\SteamSetup.exe"

Invoke-WebRequest -Uri $SteamInstallerUrl -OutFile $InstallerPath

Start-Process -FilePath $InstallerPath -ArgumentList "/S" -Wait -Verb RunAs

Remove-Item -Path $InstallerPath -Force


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


#Elektronikus művészet app installer
$EAInstallerUrl = "https://origin-a.akamaihd.net/EA-Desktop-Client-Download/installer-releases/EAappInstaller.exe"
$InstallerPath = "$env:TEMP\EAAppSetup.exe"

Invoke-WebRequest -Uri $EAInstallerUrl -OutFile $InstallerPath

Start-Process -FilePath $InstallerPath -ArgumentList "/silent /install" -Wait -Verb RunAs

Remove-Item -Path $InstallerPath -Force

# EA App bezárása
Start-Sleep -Seconds 60
Stop-Process -Name "EA" -Force


#Audacity installer
$AudacityInstallerUrl = "https://github.com/audacity/audacity/releases/download/Audacity-3.7.3/audacity-win-3.7.3-64bit.exe"
$InstallerPath = "$env:TEMP\AudacitySetup.exe"

Invoke-WebRequest -Uri $AudacityInstallerUrl -OutFile $InstallerPath

Start-Process -FilePath $InstallerPath -ArgumentList "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-" -Wait -Verb RunAs

Remove-Item -Path $InstallerPath -Force


#Obs Studio installer
$ObsInstallerUrl = "https://cdn-fastly.obsproject.com/downloads/OBS-Studio-29.0.2-Full-Installer-x64.exe"
$InstallerPath = "$env:TEMP\OBSSetup.exe"

Invoke-WebRequest -Uri $ObsInstallerUrl -OutFile $InstallerPath

Start-Process -FilePath $InstallerPath -ArgumentList "/S" -Wait -Verb RunAs

Remove-Item -Path $InstallerPath -Force


# Winrar installer
$installerUrl = "https://www.win-rar.com/fileadmin/winrar-versions/winrar/winrar-x64-711.exe"
$tempInstaller = "$env:TEMP\winrar-x64-711.exe"

Invoke-WebRequest -Uri $installerUrl -OutFile $tempInstaller
Start-Process -FilePath $tempInstaller -ArgumentList "/S" -Wait
Remove-Item -Path $tempInstaller -Force -ErrorAction SilentlyContinue

# SpotX (modded Spotify)
iex "& { $(iwr -useb 'https://raw.githubusercontent.com/SpotX-Official/spotx-official.github.io/main/run.ps1') } -confirm_uninstall_ms_spoti -confirm_spoti_recomended_over -podcasts_off -block_update_on -start_spoti -new_theme -adsections_off -lyrics_stat spotify"

Stop-Process -Name "Spotify" -Force
#NOTE if you want to use your own Spotify premium without modding spotify, use the script that can be found on the desktop after installation!

# Office installation
$downloadsFolder = [System.IO.Path]::Combine($env:USERPROFILE, "Downloads", "Office")
$xmlFile = "$downloadsFolder\Configuration.xml"
$setupExe = "$downloadsFolder\setup.exe"

$xmlDownloadUrl = "https://raw.githubusercontent.com/Bence0327/EclexOS/refs/heads/main/XML/OfficeConfiguration.xml"
$setupDownloadUrl = "https://officecdn.microsoft.com/pr/wsus/setup.exe"

if (!(Test-Path -Path $downloadsFolder)) {
    New-Item -ItemType Directory -Path $downloadsFolder | Out-Null
}

Invoke-WebRequest -Uri $setupDownloadUrl -OutFile $setupExe
Invoke-WebRequest -Uri $xmlDownloadUrl -OutFile $xmlFile

Start-Process -FilePath $setupExe -ArgumentList "/configure `"$xmlFile`"" -Wait

Remove-Item -Path $downloadsFolder -Recurse -Force

#Windows activator
$rawUrl1 = "https://raw.githubusercontent.com/massgravel/Microsoft-Activation-Scripts/refs/heads/master/MAS/Separate-Files-Version/Activators/HWID_Activation.cmd"
$outputPath1 = "$env:TEMP\script.cmd"

Invoke-WebRequest -Uri $rawUrl1 -OutFile $outputPath1

Start-Process -FilePath $outputPath1 -ArgumentList "/HWID" -Wait

Remove-Item -Path $outputPath1 -Force

#Office activator
$rawUrl2 = "https://raw.githubusercontent.com/massgravel/Microsoft-Activation-Scripts/refs/heads/master/MAS/Separate-Files-Version/Activators/Ohook_Activation_AIO.cmd"
$outputPath2 = "$env:TEMP\script.cmd"

Invoke-WebRequest -Uri $rawUrl2 -OutFile $outputPath2

Start-Process -FilePath $outputPath2 -ArgumentList "/Ohook" -Wait

Remove-Item -Path $outputPath2 -Force

Write-Output "Windows and Office successfully activated!"
# Note: Theese scripts are not mine, I just use them to activate Windows and Office. Also this is not the offical way to activate Windows and Office, so use it at your own risk. The scripts are from the Microsoft Activation Scripts repository on GitHub. To delete the installations, run the uninstaller powershell script that can be found at the desktop.

# Installing montsterrat
$tempDir = Join-Path $env:TEMP "MontserratFont"
New-Item -ItemType Directory -Path $tempDir -Force | Out-Null

Invoke-WebRequest -Uri "https://github.com/google/fonts/raw/refs/heads/main/ofl/montserrat/Montserrat-Italic%5Bwght%5D.ttf" `
    -OutFile (Join-Path $tempDir "Montserrat-Italic-Variable.ttf")
Copy-Item "$tempDir\Montserrat-Italic-Variable.ttf" -Destination "C:\Windows\Fonts" -Force
New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" `
    -Name "Montserrat Italic Variable (TrueType)" -PropertyType String -Value "Montserrat-Italic-Variable.ttf" -Force

Invoke-WebRequest -Uri "https://github.com/google/fonts/raw/refs/heads/main/ofl/montserrat/Montserrat%5Bwght%5D.ttf" `
    -OutFile (Join-Path $tempDir "Montserrat-Variable.ttf")
Copy-Item "$tempDir\Montserrat-Variable.ttf" -Destination "C:\Windows\Fonts" -Force
New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" `
    -Name "Montserrat Variable (TrueType)" -PropertyType String -Value "Montserrat-Variable.ttf" -Force

Remove-Item -Path $tempDir -Recurse -Force

#Installing poppins
$baseUrl = "https://github.com/google/fonts/raw/main/ofl/poppins/"
$fontNames = @(
    "Poppins-Thin.ttf", "Poppins-ThinItalic.ttf",
    "Poppins-ExtraLight.ttf", "Poppins-ExtraLightItalic.ttf",
    "Poppins-Light.ttf", "Poppins-LightItalic.ttf",
    "Poppins-Regular.ttf", "Poppins-Italic.ttf",
    "Poppins-Medium.ttf", "Poppins-MediumItalic.ttf",
    "Poppins-SemiBold.ttf", "Poppins-SemiBoldItalic.ttf",
    "Poppins-Bold.ttf", "Poppins-BoldItalic.ttf",
    "Poppins-ExtraBold.ttf", "Poppins-ExtraBoldItalic.ttf",
    "Poppins-Black.ttf", "Poppins-BlackItalic.ttf"
)

$tempDir = Join-Path $env:TEMP "PoppinsFont"
New-Item -ItemType Directory -Path $tempDir -Force | Out-Null

foreach ($fontFile in $fontNames) {
    $url = "$baseUrl$fontFile"
    $local = Join-Path $tempDir $fontFile
    Invoke-WebRequest -Uri $url -OutFile $local -ErrorAction SilentlyContinue
    Copy-Item -Path $local -Destination "C:\Windows\Fonts" -Force
    New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" `
        -Name $fontFile -PropertyType String -Value $fontFile -Force
}

Remove-Item -Path $tempDir -Recurse -Force

#Spotify unmodder creator
$desktop = [Environment]::GetFolderPath("Desktop")

$destination = Join-Path $desktop "Uninstall the mod from Spotify.bat"

$url = "https://raw.githubusercontent.com/SpotX-Official/SpotX/refs/heads/main/Uninstall.bat"

Invoke-WebRequest -Uri $url -OutFile $destination
#NOTE if you don't want to uninstall spotify modder, feel free to delete this

#Office activation uninstaller creator(may change later)
$url = "https://raw.githubusercontent.com/Bence0327/EclexOS/refs/heads/main/Scripts/New%20scripts(1.0)/Uninstallofficeactivation.ps1"

$filename = "I don't need Office activation.ps1"

$desktop = [Environment]::GetFolderPath("Desktop")
$destination = Join-Path $desktop $filename

Invoke-WebRequest -Uri $url -OutFile $destination

# Winget isntallers
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

        # Install git
        & $exe install --id Git.Git --silent --accept-package-agreements --accept-source-agreements;

        # Verifying Git installation
        if (Verify-Installation -appId "Git.Git") {

        } else {
            return
        }

        return;
    }
    
    if( [datetime]::Now -gt $timeout ) {
        return;
    }
    
    Start-Sleep -Seconds 1;
}

Write-Output "Installation of apps, fonts, office, Windows & Office activation has been finished!"
# SIG # Begin signature block
# MIIFngYJKoZIhvcNAQcCoIIFjzCCBYsCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCBQjgmf3f9KhTKK
# +E3k0xY7XkimZgTJd0ntrhBIO33x6qCCAxAwggMMMIIB9KADAgECAhAWEAYYkd8H
# iESrD1y+aYlmMA0GCSqGSIb3DQEBCwUAMB4xHDAaBgNVBAMME0VjbGV4T1NTY3Jp
# cHRzc2lnbnMwHhcNMjUwNzI3MTMzMTA5WhcNMjYwNzI3MTM1MTA5WjAeMRwwGgYD
# VQQDDBNFY2xleE9TU2NyaXB0c3NpZ25zMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8A
# MIIBCgKCAQEAlbtsjWapLx9pfhi9TvWtminFtTTmYB+EBwPAJRO9snnSv1R7Lm65
# 1Ng1dNTwiDlCOLbzSUfBiGAxzGEFE8jD0WA0qRbf2RlUdgrmvcev3QEyNPUEbMtb
# 4ZpB2BSa024zymeVKLXincZQ4vOqwjAsqILXfuZCsGRb1FVvtsOV6ecsVxwcaUPY
# KxnHF740beYu0fqpTDxXhnkW97nWKQY1HizVNe1Ecs0ZUQII8mCJOPM7hiQ1/8kd
# 0ypP/aJLQYdM4CQaD1VenncwuAXNYHR7MtvWa6qdfXWOXOCD2+JfjN5kZE0U5jQI
# 2okKf+BKeNNlPoLN5AQATcgQPOulvXcRqQIDAQABo0YwRDAOBgNVHQ8BAf8EBAMC
# B4AwEwYDVR0lBAwwCgYIKwYBBQUHAwMwHQYDVR0OBBYEFAi9GaeUp9QUOmkgLfBC
# vaH8HIGWMA0GCSqGSIb3DQEBCwUAA4IBAQAGmmHlXPjX8SHA/dYG+K9wVnkqLt1t
# vi2yIqIdgUhh3KnmWtW/PRl6MurbVfBRCODnEuzYKLtyAyIY09hmqEPMSG5oc65P
# iq6HjdueVDvYBeG8ppkkTcZa9Yuz1eNEg5yZxu0HJFqaSxErlulmEOgA1ll2hHIw
# YUTxPvdBpnVvkkw7KivkGqZwqMpv0gHtQCKM7fhZ7iQw2oxnRgVQZMgJWWzhM194
# TVYeI4nFS5tx+aWw2VnH1pZ7nr8Ily+tJkaNSXJkk4jikGK8uPBxitRVAX3vVvx2
# puo3Td8+9EKsESkNdb16DApM0XXz56wH8/gGPiI2uHtv5/tZJtXy83GuMYIB5DCC
# AeACAQEwMjAeMRwwGgYDVQQDDBNFY2xleE9TU2NyaXB0c3NpZ25zAhAWEAYYkd8H
# iESrD1y+aYlmMA0GCWCGSAFlAwQCAQUAoIGEMBgGCisGAQQBgjcCAQwxCjAIoAKA
# AKECgAAwGQYJKoZIhvcNAQkDMQwGCisGAQQBgjcCAQQwHAYKKwYBBAGCNwIBCzEO
# MAwGCisGAQQBgjcCARUwLwYJKoZIhvcNAQkEMSIEIMlTtEynxu6Bx8Cil5L9b8Y6
# hVjDF2iKcp9VkfGFmK2gMA0GCSqGSIb3DQEBAQUABIIBAGiTxgN3RM1x8iTCVkZE
# QIKWiYwJ/RbzRy8ALJ//BCEBmrko6hjZkCtr+2qu0vaJ4ZAYi2zMVmu8AeUUKDgL
# CKc7V5OjlOJ1/RInDxUDGtzuImCACY0AsqAha4KHPMhTFykfefgmZJHeLjKQRJSk
# DJyuamBZZcLE/cc8QtJaRgLjnHMppTkE6fTxfu8VYUqfvaJ/XuCVtET/0QHtazic
# tyFlfh2YurJJu6Vkr8AO+Agz0DL6u4kfTCSPGvcnyrTQVSUGgrfT4z6UwQSQERsL
# vbCK6OZyIYxaCiN6k0UTror8oS/oW0Snv2TstZyPXsy1wsk5vPZ4yDhjnofZnGr2
# ykk=
# SIG # End signature block

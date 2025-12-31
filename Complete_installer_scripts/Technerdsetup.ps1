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

# SpotX (modded Spotify)
iex "& { $(iwr -useb 'https://raw.githubusercontent.com/SpotX-Official/spotx-official.github.io/main/run.ps1') } -confirm_uninstall_ms_spoti -confirm_spoti_recomended_over -podcasts_off -block_update_on -start_spoti -new_theme -adsections_off -lyrics_stat spotify"

Stop-Process -Name "Spotify" -Force
#NOTE if you want to use your own Spotify premium without modding spotify, use the script that can be found on the desktop after installation!

# Office installation
$downloadsFolder = [System.IO.Path]::Combine($env:USERPROFILE, "Downloads", "Office")
$xmlFile = "$downloadsFolder\Configuration.xml"
$setupExe = "$downloadsFolder\setup.exe"

$xmlDownloadUrl = "https://raw.githubusercontent.com/Bence0327/EclexOS/refs/heads/main/Scripts/.xmls/OfficeConfiguration.xml"
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

#Office activation uninstaller creator(may change later)
$url = "https://raw.githubusercontent.com/Bence0327/EclexOS/refs/heads/main/Scripts/Working_scripts/Uninstallofficeactivation.ps1"

$filename = "I don't need Office activation.ps1"

$desktop = [Environment]::GetFolderPath("Desktop")
$destination = Join-Path $desktop $filename

Invoke-WebRequest -Uri $url -OutFile $destination

#User experience property banner - with this part your system won't allow Microsoft to collect data from you
$serviceName = "DiagTrack"
$service = Get-Service -Name $serviceName -ErrorAction SilentlyContinue

if ($service) {
    if ($service.Status -eq "Running") {
        Stop-Service -Name $serviceName -Force
    }

    Set-Service -Name $serviceName -StartupType Disabled

    Write-Output "DiagTrack has been turned off and blocked."
} else {
    Write-Output "Cant find DiagTrack turned on on this device."
}

$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection"

if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

New-ItemProperty -Path $regPath -Name "AllowTelemetry" -PropertyType DWord -Value 0 -Force

Write-Output "AllowTelemetry beállítva 0-ra a következő kulcsban: $regPath"

#Wallpaper setup
# Photo from Pixabay by Wortley (https://pixabay.com/photos/space-sky-nebula-darling-street-2543838/)
$url = 'https://raw.githubusercontent.com/Bence0327/EclexOS/main/wallpaper.jpg'
$path = [System.IO.Path]::Combine([Environment]::GetFolderPath("MyPictures"), "wallpaper.jpg")
Invoke-WebRequest -Uri $url -OutFile $path -UseBasicParsing -TimeoutSec 30

Add-Type @"
using System.Runtime.InteropServices;
public class Wallpaper {
    [DllImport("user32.dll", SetLastError = true)]
    public static extern bool SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni);
}
"@
[Wallpaper]::SystemParametersInfo(20, 0, $path, 3)

#Lockscreen backround setup
$sourcePath = [System.IO.Path]::Combine([Environment]::GetFolderPath("MyPictures"), "wallpaper.jpg")
$lockScreenPath = "C:\Windows\Web\Screen\wallpaper.jpg"

Copy-Item -Path $sourcePath -Destination $lockScreenPath -Force

$regKey = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\PersonalizationCSP"
if (!(Test-Path $regKey)) {
    New-Item -Path $regKey -Force | Out-Null
}

Set-ItemProperty -Path $regKey -Name "LockScreenImagePath" -Value $lockScreenPath -Type String -Force
Set-ItemProperty -Path $regKey -Name "LockScreenImageUrl" -Value $lockScreenPath -Type String -Force
Set-ItemProperty -Path $regKey -Name "LockScreenImageStatus" -Value 1 -Type DWord -Force

# Setting the power plan
$highPerfGuid = "8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c"

powercfg /setactive $highPerfGuid

$systemType = (Get-WmiObject -Class Win32_ComputerSystem).PCSystemType

if ($systemType -eq 1) {
    powercfg /change standby-timeout-ac 0
    powercfg /change standby-timeout-dc 0
} elseif ($systemType -eq 2) {
        powercfg /change standby-timeout-ac 0
    } else {
}

# Winget installers
if ([System.Environment]::OSVersion.Version.Build -lt 26100) {
    'This script requires Windows 11 24H2 or later.' | Write-Warning
    return
}

$timeout = [datetime]::Now.AddMinutes(5)
$exe = "$env:LOCALAPPDATA\Microsoft\WindowsApps\winget.exe"

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

#You can comment out apps, it those wojn't be installed:)
$apps = @(
    "Audacity.Audacity",
    "Brave.Brave",
    "ElectronicArts.EADesktop",
    "EpicGames.EpicGamesLauncher",
    "Github.GithubDesktop",
    "Handbrake.Handbrake",
    "OBSProject.OBSStudio",
    "RABLab.WinRAR",
    "Roblox.Roblox",
    "VideoLAN.VLC",
    "Valve.Steam",
    "RustDesk.RustDesk",
    "Discord.Discord",
    "GIMP.GIMP.3",
    "Git.Git",
    "qBittorrent.qBittorrent",
    "RevoUninstaller.RevoUninstaller",
    #"JAMSoftware.HeavyLoad",
    "Microsoft.VisualStudioCode"
)

while ($true) {
    if ($exe | Test-Path) {
        foreach ($app in $apps) {
            Write-Host "Installing: $app"
            & $exe install --id $app --silent --accept-package-agreements --accept-source-agreements

            if (Verify-Installation -appId $app) {
                Write-Host "$app succesfully installed."
            } else {
                Write-Warning "$app Install failed. The script will shut down. Check the log."
                return
            }
        }
        Write-Host "Winget installation finished."
        return
    }

    if ([datetime]::Now -gt $timeout) {
        Write-Warning "Winget hasn't been installed. Waiting..."
        return
    }

    Start-Sleep -Seconds 1
}

#Vencord setup
$installerUrl = "https://github.com/Vencord/Installer/releases/latest/download/VencordInstallerCli.exe"
$installerPath = "$env:TEMP\VencordInstallerCli.exe"

Invoke-WebRequest -Uri $installerUrl -OutFile $installerPath

Start-Process -FilePath $installerPath
Start-Sleep -Seconds 2

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing


[System.Windows.Forms.SendKeys]::SendWait("{ENTER}")
Start-Sleep -Seconds 10
[System.Windows.Forms.SendKeys]::SendWait("{ENTER}")
Start-Sleep -Seconds 10
[System.Windows.Forms.SendKeys]::SendWait("{ENTER}")
Start-Sleep -Seconds 10

Remove-Item -Path $installerPath -Force

Write-Output "Installation of apps, fonts, office, Windows & Office activation has been finished!"
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

Write-Host "Office (személyes használatra) sikeresen telepítve! Aktiváció folyamatban..."

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

Write-Output "Windows and Office sikeresen aktiválva!"

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

Write-Host "Az Office aktiválva!"
Start-Sleep -Seconds 100
Write-Host "FIGYELEM!"
Start-Sleep -Seconds 10
Write-Host "Az Office nem hivatalos módon lett aktiválva!"
Start-Sleep -Seconds 10
Write-Host "Kész!"
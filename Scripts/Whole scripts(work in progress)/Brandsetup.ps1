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

[Keyboard]::PressKey(0x5B)  # Bal oldali Windows gomb

#Aida64 installer
Invoke-WebRequest -Uri $AidaInstallerUrl -OutFile $InstallerPath

Start-Process -FilePath $InstallerPath -ArgumentList "/SILENT" -Wait -Verb RunAs

Remove-Item -Path $InstallerPath -Force


#Vlc installer
$VlcInstallerUrl = "https://www.sooftware.com/mirrors/VLC/vlc/3.0.21/win64/vlc-3.0.21-win64.exe"
$InstallerPath = "$env:TEMP\vlc-3.0.21-win64.exe"

Invoke-WebRequest -Uri $VlcInstallerUrl -OutFile $InstallerPath

Start-Process -FilePath $InstallerPath -ArgumentList "/S" -Wait -Verb RunAs

Remove-Item -Path $InstallerPath -Force


#Brave installer
$BraveInstallerUrl = "https://laptop-updates.brave.com/download/BRV010?bitness=64"
$InstallerPath = "$env:TEMP\BraveSetup.exe"

Invoke-WebRequest -Uri $BraveInstallerUrl -OutFile $InstallerPath

Start-Process -FilePath $InstallerPath -ArgumentList "/silent /install" -Wait -Verb RunAs

Remove-Item -Path $InstallerPath -Force


# SpotX (modded Spotify) installer
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

# Winget installers
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
        & $exe install -e --id RevoUninstaller.RevoUninstaller --accept-package-agreements --accept-source-agreements;

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

Write-Output "Installation of apps, fonts, office, Windows & Office activation has been finished!"
# SIG # Begin signature block
# MIIFngYJKoZIhvcNAQcCoIIFjzCCBYsCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCDQ3FC2vNB0w6JD
# NX7yPS74SwCzHhjrnRT+N3oJwo2XtaCCAxAwggMMMIIB9KADAgECAhAWEAYYkd8H
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
# MAwGCisGAQQBgjcCARUwLwYJKoZIhvcNAQkEMSIEIDHKtT++VikRZaruFCIHcU9G
# Rkh1hNp/syD57/vTyu3WMA0GCSqGSIb3DQEBAQUABIIBAI9FLPBuX6OKSNeX+6dz
# 78mewygLXVU0VjaYNiqxHI/nnJJOo3g1vapAuZUBV61hKF8kH0Voq7v4cVJVG9hD
# yNaunq8LMHFaulxKN/kngBwemt9WHvsW53YGea1XFcijbylOQG4I2PM5oOTDqN5q
# 1VGIBshjT4Ilg/HKTs0ymrQ51J5x9aMWl2uOcvuB2WkbaMtBPmwnDSORTL3QP0yq
# BKWS4F4eNc8VxfJLHHm7MGvsIytP0cM63qlLPt4oHhUnvnccjwmq/KH2LSA/xBQJ
# qbkYTMhTiUIbleJ6ai+/77lc4H6ghnVRsEMQ9Apom/8TYg2P5gJGcwn2hs44Ng0P
# AlI=
# SIG # End signature block

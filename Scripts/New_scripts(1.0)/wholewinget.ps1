# Check windows version
$cvKey = 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion'
$display = (Get-ItemProperty -Path $cvKey -Name DisplayVersion -ErrorAction SilentlyContinue).DisplayVersion

if (-not $display -or -not ($display -match '^(24H2|25H2)$')) {
    'This script only runs on Windows 11 24H2 or 25H2. Skipping.' | Write-Warning
    return;
}

$timeout = [datetime]::Now.AddMinutes(5);
$exe = "$env:LOCALAPPDATA\Microsoft\WindowsApps\winget.exe";

# Define the list of package IDs (one per line)
$packageIds = @"
# Audacity.Audacity
# Brave.Brave
# ElectronicArts.EADesktop
# EpicGames.EpicGamesLauncher
# Github.Githubdesktop
# Handbrake.Handbrake
# OBSProject.OBSStudio
# RABLab.WinRAR
# Roblox.Roblox
# VideoLAN.VLC
# ElectronicArts.EADesktop
# Valve.Steam
# RustDesk.RustDesk
# Discord.Discord
# GIMP.GIMP.3
# Git.Git
# qBittorrent.qBittorrent
# RevoUninstaller.RevoUninstaller
# Microsoft.VisualStudioCode
# JAMSoftware.HeavyLoad
# Docker.DockerDesktop
# Rem0o.FanControl
# WhirlwindFX.SignalRgb 
"@ -split "`r?`n" | Where-Object { $_ -match '\S' }

#Installing the given package IDs one by one
while ($true) {
    if ($exe | Test-Path) {
        # Process each package ID in the list
        foreach ($packageId in $packageIds) {
            Write-Host "Installing package: $packageId"
            & $exe install --id $packageId --accept-package-agreements --accept-source-agreements
        }
        return
    }
    
    if ([datetime]::Now -gt $timeout) {
        'File {0} does not exist.' -f $exe | Write-Warning
        return
    }
    
    Start-Sleep -Seconds 1
}
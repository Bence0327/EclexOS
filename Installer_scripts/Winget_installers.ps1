# Winget installers
#Checking Windows version
if ([System.Environment]::OSVersion.Version.Build -lt 26100) {
    'This script requires Windows 11 24H2 or later.' | Write-Warning
    return
}


$timeout = [datetime]::Now.AddMinutes(5)
$exe = "$env:LOCALAPPDATA\Microsoft\WindowsApps\winget.exe"
#Checking if winget is installed
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

#You can comment out apps, it those won't be installed:)
#You can put new app IDs in with the sae format
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
    "JAMSoftware.HeavyLoad",
    "Microsoft.VisualStudioCode",
    "Plex.PlexMediaServer"
)
#Installing apps one by one
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
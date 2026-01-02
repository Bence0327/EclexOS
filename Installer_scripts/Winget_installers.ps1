#======== The new script logic: ==========
# different versions' installer can be installed by using the name of the edition as an argument for the script.
# For example if you want to install the apps from the technerd edition, you can use the argument "technerd" for it.
#The argument "all" will install all the apps that has been tested and recommended by me:)
# You won't found aditional info at https://bit.ly/EclexOS-wingetscript :)





param(
    [switch]$technerd,
    [switch]$gamer,
    [switch]$brand,
    [switch]$testserver,
    [switch]$all
)

# Edition based categories
$Categories = @{
    "technerd" = @(
        "Audacity.Audacity",
        "Brave.Brave",
        "ElectronicArts.EADesktop",
        "EpicGames.EpicGamesLauncher",
        "Git.Git",
        "Github.GithubDesktop",
        "Handbrake.Handbrake",
        "JAMSoftware.HeavyLoad",
        "Microsoft.VisualStudioCode",
        "OBSProject.OBSStudio",
        "Roblox.Roblox",
        "Valve.Steam",
        "VideoLAN.VLC",
        "RABLab.WinRAR",
        "Discord.Discord",
        "GIMP.GIMP.3",
        "RevoUninstaller.RevoUninstaller",
        "RustDesk.RustDesk",
        "WhirlwindFX.SignalRgb",
        "Rem0o.FanControl",
        "qBittorrent.qBittorrent"
    )

    "gamer" = @(
        "Brave.Brave",
        "ElectronicArts.EADesktop",
        "EpicGames.EpicGamesLauncher",
        "JAMSoftware.HeavyLoad",
        "OBSProject.OBSStudio",
        "Roblox.Roblox",
        "Valve.Steam",
        "VideoLAN.VLC",
        "RABLab.WinRAR",
        "Discord.Discord",
        "RevoUninstaller.RevoUninstaller",
        "WhirlwindFX.SignalRgb",
        "Rem0o.FanControl",
        "qBittorrent.qBittorrent"
    )

    "brand" = @(
        "Brave.Brave",
        "VideoLAN.VLC",
        "RABLab.WinRAR",
        "RevoUninstaller.RevoUninstaller"
    )

    "testserver" = @(
        "Brave.Brave",
        "Handbrake.Handbrake",
        "VideoLAN.VLC",
        "RABLab.WinRAR",
        "qBittorrent.qBittorrent",
        "Rem0o.FanControl",
        "RustDesk.RustDesk",
        "RevoUninstaller.RevoUninstaller"
    )

    "all" = @(
        "Audacity.Audacity",
        "Brave.Brave",
        "ElectronicArts.EADesktop",
        "EpicGames.EpicGamesLauncher",
        "Git.Git",
        "Github.GithubDesktop",
        "Handbrake.Handbrake",
        "JAMSoftware.HeavyLoad",
        "Microsoft.VisualStudioCode",
        "OBSProject.OBSStudio",
        "Roblox.Roblox",
        "Valve.Steam",
        "VideoLAN.VLC",
        "RABLab.WinRAR",
        "Discord.Discord",
        "GIMP.GIMP.3",
        "RevoUninstaller.RevoUninstaller",
        "RustDesk.RustDesk",
        "WhirlwindFX.SignalRgb",
        "Rem0o.FanControl",
        "Plex.PlexMediaServer",
        "qBittorrent.qBittorrent"
    )
}

function Install-Category {
    param($categoryName)

    foreach ($app in $Categories[$categoryName]) {
        winget install $app --silent
    }
}

# ALL → minden kategória
if ($all) {
    Install-Category "all"
    exit
}

# Egyedi editionök
if ($technerd)   { Install-Category "technerd" }
if ($gamer)      { Install-Category "gamer" }
if ($brand)      { Install-Category "brand" }
if ($testserver) { Install-Category "testserver" }
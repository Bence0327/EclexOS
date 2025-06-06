$AidaInstallerUrl = "https://download.aida64.com/aida64extreme765.exe"
$InstallerPath = "$env:TEMP\aida64extreme765.exe"

Invoke-WebRequest -Uri $AidaInstallerUrl -OutFile $InstallerPath

Start-Process -FilePath $InstallerPath -ArgumentList "/SILENT" -Wait -Verb RunAs

Remove-Item -Path $InstallerPath -Force

$VlcInstallerUrl = "https://www.sooftware.com/mirrors/VLC/vlc/3.0.21/win64/vlc-3.0.21-win64.exe"
$InstallerPath = "$env:TEMP\vlc-3.0.21-win64.exe"

Invoke-WebRequest -Uri $VlcInstallerUrl -OutFile $InstallerPath

Start-Process -FilePath $InstallerPath -ArgumentList "/S" -Wait -Verb RunAs

Remove-Item -Path $InstallerPath -Force

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

$EpicInstallerUrl = "https://launcher-public-service-prod06.ol.epicgames.com/launcher/api/installer/download/EpicGamesLauncherInstaller.msi"
$InstallerPath = "$env:TEMP\EpicGamesLauncher.msi"

Invoke-WebRequest -Uri $EpicInstallerUrl -OutFile $InstallerPath

Start-Process -FilePath "msiexec.exe" -ArgumentList "/i $InstallerPath /quiet /norestart" -Wait -Verb RunAs

Remove-Item -Path $InstallerPath -Force

$VscInstallerUrl = "https://aka.ms/win32-x64-user-stable"
$InstallerPath = "$env:TEMP\VSCodeUserSetup-x64-1.99.1.exe"

Invoke-WebRequest -Uri $VscInstallerUrl -OutFile $InstallerPath

Start-Process -FilePath $InstallerPath -ArgumentList "/VERYSILENT /NORESTART /MERGETASKS=!runcode" -Wait -Verb RunAs

Remove-Item -Path $InstallerPath -Force

$TeamViewerInstallerUrl = "https://download.teamviewer.com/download/TeamViewer_Setup.exe"
$InstallerPath = "$env:TEMP\TeamViewerSetup.exe"

Invoke-WebRequest -Uri $TeamViewerInstallerUrl -OutFile $InstallerPath

Start-Process -FilePath $InstallerPath -ArgumentList "/S" -Wait -Verb RunAs

Remove-Item -Path $InstallerPath -Force

$BraveInstallerUrl = "https://laptop-updates.brave.com/download/BRV010?bitness=64"
$InstallerPath = "$env:TEMP\BraveSetup.exe"

Invoke-WebRequest -Uri $BraveInstallerUrl -OutFile $InstallerPath

Start-Process -FilePath $InstallerPath -ArgumentList "/silent /install" -Wait -Verb RunAs

Remove-Item -Path $InstallerPath -Force

$SteamInstallerUrl = "https://cdn.cloudflare.steamstatic.com/client/installer/SteamSetup.exe"
$InstallerPath = "$env:TEMP\SteamSetup.exe"

Invoke-WebRequest -Uri $SteamInstallerUrl -OutFile $InstallerPath

Start-Process -FilePath $InstallerPath -ArgumentList "/S" -Wait -Verb RunAs

Remove-Item -Path $InstallerPath -Force

$HandBrakeInstallerUrl = "https://github.com/HandBrake/HandBrake/releases/download/1.9.2/HandBrake-1.9.2-x86_64-Win_GUI.exe"
$InstallerPath = "$env:TEMP\HandBrake-1.9.2-x86_64-Win_GUI.exe"

Invoke-WebRequest -Uri $HandBrakeInstallerUrl -OutFile $InstallerPath

Start-Process -FilePath $InstallerPath -ArgumentList "/S" -Wait -Verb RunAs

Remove-Item -Path $InstallerPath -Force

$ShortcutPath = "$env:USERPROFILE\Desktop\HandBrake.lnk"
$TargetPath = "C:\Program Files\HandBrake\HandBrake.exe"  # Frissítsd az elérési útvonalat, ha szükséges

$WshShell = New-Object -ComObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut($ShortcutPath)
$Shortcut.TargetPath = $TargetPath
$Shortcut.WorkingDirectory = "C:\Program Files\HandBrake"
$Shortcut.Save()

$EAInstallerUrl = "https://origin-a.akamaihd.net/EA-Desktop-Client-Download/installer-releases/EAappInstaller.exe"
$InstallerPath = "$env:TEMP\EAAppSetup.exe"

Invoke-WebRequest -Uri $EAInstallerUrl -OutFile $InstallerPath

Start-Process -FilePath $InstallerPath -ArgumentList "/silent /install" -Wait -Verb RunAs

Remove-Item -Path $InstallerPath -Force

$AudacityInstallerUrl = "https://github.com/audacity/audacity/releases/download/Audacity-3.7.3/audacity-win-3.7.3-64bit.exe"
$InstallerPath = "$env:TEMP\AudacitySetup.exe"

Invoke-WebRequest -Uri $AudacityInstallerUrl -OutFile $InstallerPath

Start-Process -FilePath $InstallerPath -ArgumentList "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-" -Wait -Verb RunAs

Remove-Item -Path $InstallerPath -Force

$ObsInstallerUrl = "https://cdn-fastly.obsproject.com/downloads/OBS-Studio-29.0.2-Full-Installer-x64.exe"
$InstallerPath = "$env:TEMP\OBSSetup.exe"

Invoke-WebRequest -Uri $ObsInstallerUrl -OutFile $InstallerPath

Start-Process -FilePath $InstallerPath -ArgumentList "/S" -Wait -Verb RunAs

Remove-Item -Path $InstallerPath -Force
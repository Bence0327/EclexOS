#The main problem with this script is that the executables are not pinned even after a restart. I'd tried to use verbs to do it, but i failed cause I don't have access to all of the languages etc.
# Folder given to the taskbar's EXEs
$taskbarPath = "$env:APPDATA\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar"
New-Item -ItemType Directory -Path $taskbarPath -Force | Out-Null

# Folder creation for shortcuts
$tempFolder = Join-Path $env:TEMP "TempTaskbarPins"
New-Item -ItemType Directory -Path $tempFolder -Force | Out-Null

# Shortcut creator
function Create-Shortcut {
    param (
        [string]$TargetPath,
        [string]$ShortcutName
    )
    $WshShell = New-Object -ComObject WScript.Shell
    $Shortcut = $WshShell.CreateShortcut("$tempFolder\$ShortcutName.lnk")
    $Shortcut.TargetPath = $TargetPath
    $Shortcut.Save()
}

# Brave & Explorer shortcuts given
$apps = @(
    @{ Name = "Brave"; Path = "C:\Program Files\BraveSoftware\Brave-Browser\Application\brave.exe" },
    @{ Name = "Explorer"; Path = "$env:WINDIR\explorer.exe" }
)

foreach ($app in $apps) {
    if (Test-Path $app.Path) {
        Create-Shortcut -TargetPath $app.Path -ShortcutName $app.Name
        Copy-Item "$tempFolder\$($app.Name).lnk" -Destination $taskbarPath -Force
    }
}

# Shortcut folder delete
Remove-Item -Path $tempFolder -Recurse -Force -ErrorAction SilentlyContinue
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
        Start-Sleep -Seconds 2
    }
}


$wshell.AppActivate("Rockstar Games Launcher Installer")
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
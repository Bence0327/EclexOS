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

# Roblox telep�t� let�lt�se
$InstallerUrl = "https://www.roblox.com/download/client?os=win"
$InstallerPath = "$env:TEMP\RobloxPlayerInstaller.exe"

Invoke-WebRequest -Uri $InstallerUrl -OutFile $InstallerPath

# Telep�t� elind�t�sa (nem v�r r�)
Start-Process -FilePath $InstallerPath
Start-Sleep -Seconds 3  # R�vid v�rakoz�s az els� ind�t�s ut�n

# V�rakoz�s 60 m�sodpercig, am�g a telep�t� fut
Start-Sleep -Seconds 60

# **Roblox kliens bez�r�sa**
[WinAPI]::CloseWindow("Roblox Game Client")
[WinAPI]::CloseWindow("Roblox")

Write-Host "Roblox telep�t�s befejez�d�tt, �s a Roblox kliens bez�r�sra ker�lt."
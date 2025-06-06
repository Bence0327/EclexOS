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

# Roblox telepítõ letöltése
$InstallerUrl = "https://www.roblox.com/download/client?os=win"
$InstallerPath = "$env:TEMP\RobloxPlayerInstaller.exe"

Invoke-WebRequest -Uri $InstallerUrl -OutFile $InstallerPath

# Telepítõ elindítása (nem vár rá)
Start-Process -FilePath $InstallerPath
Start-Sleep -Seconds 3  # Rövid várakozás az elsõ indítás után

# Várakozás 60 másodpercig, amíg a telepítõ fut
Start-Sleep -Seconds 60

# **Roblox kliens bezárása**
[WinAPI]::CloseWindow("Roblox Game Client")
[WinAPI]::CloseWindow("Roblox")

Write-Host "Roblox telepítés befejezõdött, és a Roblox kliens bezárásra került."
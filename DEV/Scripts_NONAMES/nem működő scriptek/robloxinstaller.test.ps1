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

# Start the installer without waiting
Start-Process "$env:TEMP\RobloxInstaller.exe"

# Wait 2 minutes before closing
Start-Sleep -Seconds 60  

# Close the Roblox installer window
[WinAPI]::CloseWindow("Roblox Game Client")
[WinAPI]::CloseWindow("Roblox")

Write-Host "Roblox installer has been closed using Windows API!"
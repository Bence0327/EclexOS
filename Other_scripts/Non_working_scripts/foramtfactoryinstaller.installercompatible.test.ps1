#Main problem: The hotkeys a failing to work smoothly and stably!

Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;
using System.Threading;

public class Keyboard {
    [DllImport("user32.dll", SetLastError = true)]
    public static extern void keybd_event(byte bVk, byte bScan, uint dwFlags, IntPtr dwExtraInfo);

    public const int KEYEVENTF_KEYDOWN = 0x0000;
    public const int KEYEVENTF_KEYUP = 0x0002;

    public static void PressKey(byte keyCode) {
        keybd_event(keyCode, 0, KEYEVENTF_KEYDOWN, IntPtr.Zero);
        Thread.Sleep(50); // Short delay
        keybd_event(keyCode, 0, KEYEVENTF_KEYUP, IntPtr.Zero);
    }
}
"@

# Start the installer without waiting
Start-Process "$env:TEMP\FFSetup5.12.2.0.exe"
Start-Sleep -Seconds 5  # Wait for installer to open

# Simulating key presses
[Keyboard]::PressKey(0x09)  # TAB
Start-Sleep -Seconds 2

[Keyboard]::PressKey(0x0D)  # ENTER
Start-Sleep -Seconds 2

[Keyboard]::PressKey(0x0D)  # ENTER
Start-Sleep -Seconds 2

[Keyboard]::PressKey(0x0D)  # ENTER
Start-Sleep -Seconds 2

# TAB x4
[Keyboard]::PressKey(0x09)
[Keyboard]::PressKey(0x09)
[Keyboard]::PressKey(0x09)
[Keyboard]::PressKey(0x09)

[Keyboard]::PressKey(0x0D)  # ENTER
Start-Sleep -Seconds 2

# TAB x4
[Keyboard]::PressKey(0x09)
[Keyboard]::PressKey(0x09)
[Keyboard]::PressKey(0x09)
[Keyboard]::PressKey(0x09)

[Keyboard]::PressKey(0x0D)  # ENTER
Start-Sleep -Seconds 90  # Wait 120 seconds for installation

# TAB x5
[Keyboard]::PressKey(0x09)
[Keyboard]::PressKey(0x09)
[Keyboard]::PressKey(0x09)
[Keyboard]::PressKey(0x09)
[Keyboard]::PressKey(0x09)

[Keyboard]::PressKey(0x0D)  # ENTER
Start-Sleep -Seconds 90  # Wait another 120 seconds

[Keyboard]::PressKey(0x09)  # TAB
[Keyboard]::PressKey(0x0D)  # ENTER

[Keyboard]::PressKey(0x09)  # TAB
[Keyboard]::PressKey(0x0D)  # ENTER

Write-Host "FormatFactory installed with simulated key presses!"
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
# SIG # Begin signature block
# MIIFngYJKoZIhvcNAQcCoIIFjzCCBYsCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCDfnujLxZQZuUVy
# Ygk33q9pSBSAy2KQpTWEL1MuD08gxKCCAxAwggMMMIIB9KADAgECAhAWEAYYkd8H
# iESrD1y+aYlmMA0GCSqGSIb3DQEBCwUAMB4xHDAaBgNVBAMME0VjbGV4T1NTY3Jp
# cHRzc2lnbnMwHhcNMjUwNzI3MTMzMTA5WhcNMjYwNzI3MTM1MTA5WjAeMRwwGgYD
# VQQDDBNFY2xleE9TU2NyaXB0c3NpZ25zMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8A
# MIIBCgKCAQEAlbtsjWapLx9pfhi9TvWtminFtTTmYB+EBwPAJRO9snnSv1R7Lm65
# 1Ng1dNTwiDlCOLbzSUfBiGAxzGEFE8jD0WA0qRbf2RlUdgrmvcev3QEyNPUEbMtb
# 4ZpB2BSa024zymeVKLXincZQ4vOqwjAsqILXfuZCsGRb1FVvtsOV6ecsVxwcaUPY
# KxnHF740beYu0fqpTDxXhnkW97nWKQY1HizVNe1Ecs0ZUQII8mCJOPM7hiQ1/8kd
# 0ypP/aJLQYdM4CQaD1VenncwuAXNYHR7MtvWa6qdfXWOXOCD2+JfjN5kZE0U5jQI
# 2okKf+BKeNNlPoLN5AQATcgQPOulvXcRqQIDAQABo0YwRDAOBgNVHQ8BAf8EBAMC
# B4AwEwYDVR0lBAwwCgYIKwYBBQUHAwMwHQYDVR0OBBYEFAi9GaeUp9QUOmkgLfBC
# vaH8HIGWMA0GCSqGSIb3DQEBCwUAA4IBAQAGmmHlXPjX8SHA/dYG+K9wVnkqLt1t
# vi2yIqIdgUhh3KnmWtW/PRl6MurbVfBRCODnEuzYKLtyAyIY09hmqEPMSG5oc65P
# iq6HjdueVDvYBeG8ppkkTcZa9Yuz1eNEg5yZxu0HJFqaSxErlulmEOgA1ll2hHIw
# YUTxPvdBpnVvkkw7KivkGqZwqMpv0gHtQCKM7fhZ7iQw2oxnRgVQZMgJWWzhM194
# TVYeI4nFS5tx+aWw2VnH1pZ7nr8Ily+tJkaNSXJkk4jikGK8uPBxitRVAX3vVvx2
# puo3Td8+9EKsESkNdb16DApM0XXz56wH8/gGPiI2uHtv5/tZJtXy83GuMYIB5DCC
# AeACAQEwMjAeMRwwGgYDVQQDDBNFY2xleE9TU2NyaXB0c3NpZ25zAhAWEAYYkd8H
# iESrD1y+aYlmMA0GCWCGSAFlAwQCAQUAoIGEMBgGCisGAQQBgjcCAQwxCjAIoAKA
# AKECgAAwGQYJKoZIhvcNAQkDMQwGCisGAQQBgjcCAQQwHAYKKwYBBAGCNwIBCzEO
# MAwGCisGAQQBgjcCARUwLwYJKoZIhvcNAQkEMSIEIHIk9651WvsU4yR2+bUG1BJt
# Zr47xxR2s5V4kotS6R7+MA0GCSqGSIb3DQEBAQUABIIBAJK7YLPKBJ4PGe0qMdrx
# je1YI95g+wvzW+7+PH/3+LCGNo2dccPfMLtGahYc6j6oTl8xtWS52jQ8tD/HsrGS
# 5bQoEwKbRY+M+ky9G/EW1hJq7vI21AASBenfMKNWulNwbVDHFE8G/ENdPfiVdyfM
# 1MIiTDdvNJTfiSYxdrqDbGutD0/XGuO8cYF7C40lPiVY6/ejdXR0PKawSB4SaubA
# zmvyPghsxGM/DEvtC0j9S3XWJb0NYr04pUEc7K2zeBpdakc/uik4sMIrKLYQJk3+
# GVjs2rjXT79/6RXqlTwwNtpyT+H6dRHvdAoOWj45Sv5PKoLDCZ0WSayEBvD2ui+a
# 8do=
# SIG # End signature block

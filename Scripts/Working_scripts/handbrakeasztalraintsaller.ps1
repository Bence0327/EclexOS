$HandBrakeInstallerUrl = "https://github.com/HandBrake/HandBrake/releases/download/1.9.2/HandBrake-1.9.2-x86_64-Win_GUI.exe"
$InstallerPath = "$env:TEMP\HandBrake-1.9.2-x86_64-Win_GUI.exe"

# Download the installer
Invoke-WebRequest -Uri $HandBrakeInstallerUrl -OutFile $InstallerPath

# Silent istall
Start-Process -FilePath $InstallerPath -ArgumentList "/S" -Wait -Verb RunAs

# Deleting the installer
Remove-Item -Path $InstallerPath -Force

Write-Host "HandBrake sikeresen telep�tve!"

# Make a shortcut into the desktop
$ShortcutPath = "$env:USERPROFILE\Desktop\HandBrake.lnk"
$TargetPath = "C:\Program Files\HandBrake\HandBrake.exe"  

$WshShell = New-Object -ComObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut($ShortcutPath)
$Shortcut.TargetPath = $TargetPath
$Shortcut.WorkingDirectory = "C:\Program Files\HandBrake"
$Shortcut.Save()

Write-Host "HandBrake successfully installed!"
# SIG # Begin signature block
# MIIFngYJKoZIhvcNAQcCoIIFjzCCBYsCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCC8zCpHVpzQuDPW
# FD1Mh4+0WgAUuD1R2gYL+fhIc6MZaqCCAxAwggMMMIIB9KADAgECAhAWEAYYkd8H
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
# MAwGCisGAQQBgjcCARUwLwYJKoZIhvcNAQkEMSIEIOzmET2DAcitjxv0qAIVDktw
# DEI5rPflfTDIOuDkznf+MA0GCSqGSIb3DQEBAQUABIIBAEC/rlE8BD6WrpHF+T3A
# jLJcX5JybAkB9rMvPfkL/VVGYWcfFg6zhk4ElP6T3wHlqtQeUa64RHYhcuJPM7pJ
# ocyLw+S7qzvZeJHIviqeCMeSWKjjU1m1RT6IiTlTWOZTaIc2Rdel4GdoQ42ELzQm
# 0fPHoAr1pPBoQYGHjc0K2qAnsh5i+M3yUi5gA9FU64P5oEG18T381s68Hw0f5SJ3
# dfMo3fWWAXcdMtafWPeei4X6XAW2YjgJvaxYfmJBy7naSdzpcBTqCKSaYsfTvmf1
# /UDd+mywhugdO5oBjrEDafxUebidTiL412srB+FkAd39PZPtnE4iuCvRXzd6MUTu
# VAs=
# SIG # End signature block

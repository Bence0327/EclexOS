$tempDir = Join-Path $env:TEMP "MontserratFont"
New-Item -ItemType Directory -Path $tempDir -Force | Out-Null

# Italic
Invoke-WebRequest -Uri "https://github.com/google/fonts/raw/refs/heads/main/ofl/montserrat/Montserrat-Italic%5Bwght%5D.ttf" `
    -OutFile (Join-Path $tempDir "Montserrat-Italic-Variable.ttf")
Copy-Item "$tempDir\Montserrat-Italic-Variable.ttf" -Destination "C:\Windows\Fonts" -Force
New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" `
    -Name "Montserrat Italic Variable (TrueType)" -PropertyType String -Value "Montserrat-Italic-Variable.ttf" -Force

# Normal
Invoke-WebRequest -Uri "https://github.com/google/fonts/raw/refs/heads/main/ofl/montserrat/Montserrat%5Bwght%5D.ttf" `
    -OutFile (Join-Path $tempDir "Montserrat-Variable.ttf")
Copy-Item "$tempDir\Montserrat-Variable.ttf" -Destination "C:\Windows\Fonts" -Force
New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" `
    -Name "Montserrat Variable (TrueType)" -PropertyType String -Value "Montserrat-Variable.ttf" -Force

# Clearing
Remove-Item -Path $tempDir -Recurse -Force
# SIG # Begin signature block
# MIIFngYJKoZIhvcNAQcCoIIFjzCCBYsCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCBBRyPOONfLvLE4
# WJIA1TVWmfkQTKrKccU5HvV2gIALW6CCAxAwggMMMIIB9KADAgECAhAWEAYYkd8H
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
# MAwGCisGAQQBgjcCARUwLwYJKoZIhvcNAQkEMSIEIJYMFMu8PLKvjpdC3e04GFmQ
# Z3AMAh3Nt/2gS9WBtXA1MA0GCSqGSIb3DQEBAQUABIIBAF8WUZA2GalRGo2UFZgr
# UvUErKNvJXdIQiMNFzt9kjSegLDiiL7wBbz7gRr/KOF1Bik7Mrw9sOPn0iyNEewa
# 2MaaQ38LnuOQFQt2ZXKqOiXwnV7GDJQUyoJc04w2MZxBYGgWztTNaTPsCF8Ih5PY
# 89DsOZDhDNH2sIMlu1SWxEDJ2vnpJrZlJUrUwC3gEwGdrZBHjRHVvllNAYcmS09O
# c4aEMue6U4GCuExbsV6fevw1dsp2oeYT+qwNV45J58WaIlM4Sx+xclrd1LOUe/fX
# EFSVZ8dEhAmUfNwRBfMxyUIIrxVbsRPo2GZ5WRaj2/lgtRiAbUroKF/3+tFYCba9
# RC0=
# SIG # End signature block

# Download the installer
$tempPath = "$env:TEMP\VencordInstallerCli.exe"
$downloadUrl = "https://github.com/Vencord/Installer/releases/latest/download/VencordInstallerCli.exe"

Invoke-WebRequest -Uri $downloadUrl -OutFile $tempPath

# Execute the installer - The installation part is not working, I need to find the good argument for it
Start-Process -FilePath $tempPath -ArgumentList "--install --branch stable --no-prompt" -Wait

#Remove the installer after installation
Remove-Item -Path $tempPath -Force -ErrorAction SilentlyContinue
# SIG # Begin signature block
# MIIFngYJKoZIhvcNAQcCoIIFjzCCBYsCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCD7FV2jB8+3ztOu
# dEtLws/Vr2tW34fQmCQ5BFKvyeR586CCAxAwggMMMIIB9KADAgECAhAWEAYYkd8H
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
# MAwGCisGAQQBgjcCARUwLwYJKoZIhvcNAQkEMSIEIPLFXburWPWdELnfSp5yy2Nf
# 4ea5qenCMjz2RqQqWiA0MA0GCSqGSIb3DQEBAQUABIIBAIOZ8IKGXeY/q3iruI2l
# mEz0mz5sPvdYEC6bNDj0FZpCceZQIVIjcl+rzrSOm41oPTW+omcIFTFdSVFroA1n
# /kC3Sil7UwdAeozhMy9tKxwa4qAhzUVqWHT0njWVbnrXIugnbJ6lmawrOMueq50a
# YCrCqkRC5rjUUFj4WswGrLwVaiX1fnXSTa5WSj+EdfDpqbQGzJ5Gs/hl8NqhY/9V
# FDOjJoFkuHmfXvXILraWdE7rdsVZYMk55k/0PD+K4WPoCcKNfWYVWdxM6lgNCtrc
# 3izikpCjQCsfZe7SSOC4uJJfL8pCSnZfDOZtNvPrrJHiG7LDSxS1TOi1iXPPdCh5
# eA8=
# SIG # End signature block

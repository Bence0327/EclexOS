# Maximális teljesítményű energiaséma GUID-ja
$highPerfGuid = "8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c"

# Aktív energiaséma beállítása
powercfg /setactive $highPerfGuid

# Rendszer típusának lekérdezése
$systemType = (Get-WmiObject -Class Win32_ComputerSystem).PCSystemType

# PCSystemType értékek:
# 1 = Asztali gép
# 2 = Laptop

if ($systemType -eq 1) {
    Write-Host "Asztali gép észlelve – alvó mód teljesen kikapcsolva."
    powercfg /change standby-timeout-ac 0
    powercfg /change standby-timeout-dc 0
} elseif ($systemType -eq 2) {
    Write-Host "Laptop észlelve – alvó mód kikapcsolva tápellátás esetén."
    powercfg /change standby-timeout-ac 0
    # Akkumulátoros módot nem módosítjuk
} else {
    Write-Host "Ismeretlen rendszer típus – nem módosítok alvó beállításokat."
}

Write-Host "Energetikai beállítások frissítve."
# SIG # Begin signature block
# MIIFngYJKoZIhvcNAQcCoIIFjzCCBYsCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCB90ewHZIXNHR9Y
# BrAlciqvcU8JbkIkSypUnqZm76bMzqCCAxAwggMMMIIB9KADAgECAhAWEAYYkd8H
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
# MAwGCisGAQQBgjcCARUwLwYJKoZIhvcNAQkEMSIEIOfh2hNrmU6Qqhr6YkAPusVn
# yiz2QjWQgnwpMsm91rxQMA0GCSqGSIb3DQEBAQUABIIBABCyMh0N/z/4ltLljCh9
# v0DZJZQ7eI9vACHqPXT+P39RNeDppDr3PdhFd7eF6YVoSZn1/hAedYqw9+AyPiCG
# W+IQ7vxB+jXCUnmgY9QjVYhMZZD9jMRPgz68xJwgZjwG2C7jiIcuLeU61Xoy66H3
# jysvqwNfbyGhNVv9UoRms9h7sCq9eI3Bly/tdYQ1+SYNahzv0oVO0ckGiKLzc0IY
# VVcpFPJ9MQh4YC8i+GKYTI9MwSsHOAgUOPX5V8OgN4b0q2dXKIPxb1mey3dLc96Z
# JTBklmsvkJT0d0LrRKsMQI0WSkbgfg8ugcQ7vcX19XboZZs3EjQj5jo+3wHvGULM
# 8MI=
# SIG # End signature block

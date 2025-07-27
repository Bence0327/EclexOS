# Setting the power plan
$highPerfGuid = "8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c"

powercfg /setactive $highPerfGuid

# Searching for system types(laptop or pc)
$systemType = (Get-WmiObject -Class Win32_ComputerSystem).PCSystemType

# PCSystemType variables:
# 1 = PC
# 2 = Laptop

#Setting the sleep times(On PCs, hibernation is disabled. On laptops hibernation is only enabled when running from battery)
if ($systemType -eq 1) {
    powercfg /change standby-timeout-ac 0
    powercfg /change standby-timeout-dc 0
} elseif ($systemType -eq 2) {
        powercfg /change standby-timeout-ac 0
    } else {
    Write-Host "Error! System type hasn't been found! – Settings will be going to stay in default."
}

Write-Host "Custom power plan has been set."
# SIG # Begin signature block
# MIIFngYJKoZIhvcNAQcCoIIFjzCCBYsCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCBmh3lrkucYk2ME
# NxBMCS7Tzt2Tk8QMhqMplj2LbLYcZqCCAxAwggMMMIIB9KADAgECAhAWEAYYkd8H
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
# MAwGCisGAQQBgjcCARUwLwYJKoZIhvcNAQkEMSIEIH5sH0sxW5tFEJquwSWRjn6X
# xfOm3vZojVUlE4aUQbRPMA0GCSqGSIb3DQEBAQUABIIBAB+pFya/7ybwASbbIisU
# cS8fYKG9O8pwO8f3Hwdi9iOKDbnNn5q4Q3v8dOzRpU6DR1Xsrcigfeuzw414h42G
# 71ng9+tsjqBMlBvQV/6KvFGD/3MnrM+hbG7iH87xfAgImWdZN9wslXZHp4bi9tdP
# On1UhCRP1vaOQ5UMFZo0Tes4Tx5/XaxwkG7NgaMyGMOy0T4rbr6dT2Fea1Cizg1h
# a4vp9NSpAI4XrbJ3hBbNlUeKW29rVF1/CUu530TYYjAi7FtuURfSO/n3vhbB3QFY
# 1NM0xmiosc0/z9Jz7KVtbZvidZLHavK6ar0NTEETFyRfB9QNrahtw91iY2q+or6A
# k0M=
# SIG # End signature block

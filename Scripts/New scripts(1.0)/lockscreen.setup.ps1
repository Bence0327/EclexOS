# This script has to run with administrator privileges
$sourcePath = [System.IO.Path]::Combine([Environment]::GetFolderPath("MyPictures"), "wallpaper.jpg")
$lockScreenPath = "C:\Windows\Web\Screen\wallpaper.jpg"

# Copy to systemfolder
Copy-Item -Path $sourcePath -Destination $lockScreenPath -Force

# Creating a registry if it doesn't exist
$regKey = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\PersonalizationCSP"
if (!(Test-Path $regKey)) {
    New-Item -Path $regKey -Force | Out-Null
}

# Lock screen setting
Set-ItemProperty -Path $regKey -Name "LockScreenImagePath" -Value $lockScreenPath -Type String -Force
Set-ItemProperty -Path $regKey -Name "LockScreenImageUrl" -Value $lockScreenPath -Type String -Force
Set-ItemProperty -Path $regKey -Name "LockScreenImageStatus" -Value 1 -Type DWord -Force
# SIG # Begin signature block
# MIIFngYJKoZIhvcNAQcCoIIFjzCCBYsCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCCta1vtHam79bvQ
# 6Ssk57bUo3HkjlaB3+MwKILOAnvnmaCCAxAwggMMMIIB9KADAgECAhAWEAYYkd8H
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
# MAwGCisGAQQBgjcCARUwLwYJKoZIhvcNAQkEMSIEICIhCKmC0cNuAtAxNcv+4nDd
# 5N0mNIigftZJ7qpHVvTTMA0GCSqGSIb3DQEBAQUABIIBABRwN9FEfwJfGwHT5ZJn
# UAkAsr4gmgLDJYiRFL6qmpZfjBneTEH9VNN/MiAZXVY4DoDLdkWGZqOjpbRcQIqW
# kTZK8Y35vJfW+gyjn/ffvD+iLjz14gkL6pwUaEs4rUiblkoYb2rH9bG9/pYZUh9c
# 3w0W2aAadINWdXJTNFnLtamRDA7qEvwolQHZKEdzgAwB37Qd+j9wiAPyqS7gdD2Q
# zIxSgJaOhpzEiicob8swFh7lwLELOf5jAMMaCWT4sY7c8T3qZSUaAMHu+U1+Y0Jl
# Q7rJVIw50tWI/itZsMwq2k220YD5GaObCItxrdnxd4kDmmpD8IRW2N8jHR5fJfKO
# KSQ=
# SIG # End signature block

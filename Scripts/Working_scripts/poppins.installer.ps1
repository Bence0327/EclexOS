$baseUrl = "https://github.com/google/fonts/raw/main/ofl/poppins/"
$fontNames = @(
    "Poppins-Thin.ttf", "Poppins-ThinItalic.ttf",
    "Poppins-ExtraLight.ttf", "Poppins-ExtraLightItalic.ttf",
    "Poppins-Light.ttf", "Poppins-LightItalic.ttf",
    "Poppins-Regular.ttf", "Poppins-Italic.ttf",
    "Poppins-Medium.ttf", "Poppins-MediumItalic.ttf",
    "Poppins-SemiBold.ttf", "Poppins-SemiBoldItalic.ttf",
    "Poppins-Bold.ttf", "Poppins-BoldItalic.ttf",
    "Poppins-ExtraBold.ttf", "Poppins-ExtraBoldItalic.ttf",
    "Poppins-Black.ttf", "Poppins-BlackItalic.ttf"
)

$tempDir = Join-Path $env:TEMP "PoppinsFont"
New-Item -ItemType Directory -Path $tempDir -Force | Out-Null

foreach ($fontFile in $fontNames) {
    $url = "$baseUrl$fontFile"
    $local = Join-Path $tempDir $fontFile
    Invoke-WebRequest -Uri $url -OutFile $local -ErrorAction SilentlyContinue
    Copy-Item -Path $local -Destination "C:\Windows\Fonts" -Force
    New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" `
        -Name $fontFile -PropertyType String -Value $fontFile -Force
}

Remove-Item -Path $tempDir -Recurse -Force
# SIG # Begin signature block
# MIIFngYJKoZIhvcNAQcCoIIFjzCCBYsCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCAF+AjragYzujqP
# 5mOgQBF/02rm0fRuHcC8V7ssWMAKIKCCAxAwggMMMIIB9KADAgECAhAWEAYYkd8H
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
# MAwGCisGAQQBgjcCARUwLwYJKoZIhvcNAQkEMSIEIIkrXMwdjlyjFKkGQuQmcyn8
# DPAF9vEIUrl3dsgvqt5MMA0GCSqGSIb3DQEBAQUABIIBAEjCCLv448WyFODHhg7r
# eb7/PyvYceRzAxdf6q5s/czqzM+sQRtCTO7W/W8sNcji/zau3omzRX305uOoRYbs
# 07BVnDdsokIZuG1LCaapU3VA2IWGWhnbfs0McsSysIcz1yMIC7IKrvfJ0EqFiWFQ
# 3Usp7paO0QEHhbE32VMzcaxgSJzuURtpxamcbuwYSiCSTwccv515FIpoIIH4HSDX
# jhl7q5AfucBfohE75sNaojzSKc+ZtlwXh+ATE2XaEBfQYP+2Syh6cXXTCB8V1LxJ
# zN+j375kWidwRT3i+xnMb44yqQjR/gEFTNGo5uKEV07eJf+ZeLtMIAKHOpxc6P/8
# V6c=
# SIG # End signature block

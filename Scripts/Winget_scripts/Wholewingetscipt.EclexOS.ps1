# Egyéb alkalmazások telepítése wingettel
if( [System.Environment]::OSVersion.Version.Build -lt 26100 ) {
    'This script requires Windows 11 24H2 or later.' | Write-Warning;
    return;
}

$timeout = [datetime]::Now.AddMinutes(5);
$exe = "$env:LOCALAPPDATA\Microsoft\WindowsApps\winget.exe";

function Verify-Installation {
    param (
        [string]$appId,
        [int]$maxWaitTime = 300
    )

    $startTime = Get-Date
    while ((Get-Date).Subtract($startTime).TotalSeconds -lt $maxWaitTime) {
        $installed = winget list | Select-String -Pattern $appId
        if ($installed) {
            return $true
        }
        Start-Sleep -Seconds 5
    }
    return $false
}

while( $true ) {
    if( $exe | Test-Path ) {
        # Install Discord
        & $exe install --id Discord.Discord --silent --accept-package-agreements --accept-source-agreements;

        # Verify Discord installation
        if (Verify-Installation -appId "Discord.Discord") {
            Stop-Process -Name "Discord" -Force -ErrorAction SilentlyContinue;
        } else {
            return;
        }

        # Install Anydesk
        & $exe install --id Anydesk.Anydesk --accept-package-agreements;

        # Verify Anydesk installation
        if (-not (Verify-Installation -appId "Anydesk.Anydesk")) {
            return;
        }

        # Install qBittorrent
        & $exe install --id qBittorrent.qBittorrent --accept-package-agreements;

        # Verify qBittorrent installation
        if (-not (Verify-Installation -appId "qBittorrent.qBittorrent")) {
            return;
        }

        # Install Revo Uninstaller
        & $exe install -e --id RevoUninstaller.RevoUninstaller --accept-package-agreements;

        # Verify Revo Uninstaller installation
        if (-not (Verify-Installation -appId "RevoUninstaller.RevoUninstaller")) {
            return;
        }

        # Install GIMP
        & $exe install --id=GIMP.GIMP.3 --silent;

        # Verify GIMP installation
        if (-not (Verify-Installation -appId "GIMP.GIMP.3")) {
            return;
        }

        return;
    }
    
    if( [datetime]::Now -gt $timeout ) {
        return;
    }
    
    Start-Sleep -Seconds 1;
}
# SIG # Begin signature block
# MIIFngYJKoZIhvcNAQcCoIIFjzCCBYsCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCDnOlY5zYoeUmdh
# /7nEVdEgXTbBsEigwWnO82pLqjU3a6CCAxAwggMMMIIB9KADAgECAhAWEAYYkd8H
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
# MAwGCisGAQQBgjcCARUwLwYJKoZIhvcNAQkEMSIEICrlgqrtAs81mTMPjkjV0zOQ
# wQaw5nD3SDWibnj35ecLMA0GCSqGSIb3DQEBAQUABIIBAEoWf6ZZNSGWZDgxcoo/
# Hf51lkkkK2i+jrKNnWgcUxyzMEjiSYjGVOV01CIOzSLiwgfXAgjoZS+mYcHoN2UX
# kCaL7ZgdXxPEkb8yZ/gM+jUCqkSRwJ469QS8Djx20OTiYlwiqxCHkhqsJ2e7G51+
# xQdkXQf2WyNCRhYj/vyNvBJghtOVIXM4oXGoXO2XKxWG7JvOVRxhVBD+gOhvgXHY
# gP52wOJxqSGFF5jhf67uGmnJj8c8UNXNLFB+rn2OmpmcKzsEbw05nRsb+fu1ZnSP
# xxbgjiR9d457JSakrLLQx4yZW3+RfG0noTpniJILn3Th0mxqNhp2nQ9Lpt5vzzWL
# K7E=
# SIG # End signature block

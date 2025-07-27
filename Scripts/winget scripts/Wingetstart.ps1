if( [System.Environment]::OSVersion.Version.Build -lt 26100 ) {
    'This script requires Windows 11 24H2 or later.' | Write-Warning;
    return;
}

$timeout = [datetime]::Now.AddMinutes(5);
$exe = "$env:LOCALAPPDATA\Microsoft\WindowsApps\winget.exe";

while( $true ) {
    if( $exe | Test-Path ) {
        # Put the winget commands here. Also you should add checking scripts to check if an installation was successful, but it's not necessary. You can find some scripts in the Scripts\Winget scripts folder. for this type of script, use the setupompatible variant of the scripts. If youe just want to install an app using winget, use the alone scripts so they won't be alone anymore:)
        #Make sure you add "--accept-source-agreements" to the end of the first command, so you can install the packages using winget effortlessly.
        #                   Example:  
        # & $exe install --id [ID] --accept-package-agreements;
        #  if (-not (Verify-Installation -appId "[ID]")) {
        #     return;
        # }
        return;
    }
    
    if( [datetime]::Now -gt $timeout ) {
        'File {0} does not exist.' -f $exe | Write-Warning;
        return;
    }
    
    Start-Sleep -Seconds 1;
}
# SIG # Begin signature block
# MIIFngYJKoZIhvcNAQcCoIIFjzCCBYsCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCBMmsxddGkrtDsG
# rcoH7TN/Ud7O0JZ70hOKpKzS/P8QOqCCAxAwggMMMIIB9KADAgECAhAWEAYYkd8H
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
# MAwGCisGAQQBgjcCARUwLwYJKoZIhvcNAQkEMSIEIFUFfQG88MpCEQLn0NiAnhWT
# jiKzU/tST7BVhHDJ9F0eMA0GCSqGSIb3DQEBAQUABIIBAIVFGbce6+kARXfJPQMZ
# h+APQx3NCyIjAAHIDXEVRYSs3xm5OPy2c1NB141vmZ5KH/nA4gZmasR1jHQB4AfH
# GJV6wWWTb3up/gIYOt34I7CVquOZKPpjh0AQ6h/U4H5y1jslUrzSKJhGQ3SnCiVt
# 48RF/lVmSjdCMXvAxKddaZPvCZKL75L/jEr7n6XYWX4BIi6u2lSrbIm7mKs0+WDS
# hZ9cQoz+9RT4pUWCj+HAHaX+LVsS2YdZPqJKenxUqZKd4QCVa4LfMxNRX89az1c1
# /dlzGUEvzc5zNAopLoj1PU124JOo6zhNFMNaAdSPvs04dhQnOKdZF5zsjH+awmRC
# UTg=
# SIG # End signature block

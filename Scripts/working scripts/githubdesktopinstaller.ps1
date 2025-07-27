#Github Desktop installer script
$GithubDesktopInstallerUrl = "https://central.github.com/deployments/desktop/desktop/latest/win32"
$InstallerPath = "$env:TEMP\GitHubDesktopSetup-x64.exe"

# installer download
Invoke-WebRequest -Uri $GithubDesktopInstallerUrl -OutFile $InstallerPath

# Start the insatllation process
Start-Process -FilePath $InstallerPath -ArgumentList "/S" -Wait -Verb RunAs

Start-Sleep -Seconds 60

# Close the app after the insatllation
Stop-Process -Name "GitHubDesktop" -Force

#Remove the installer
$maxRetry = 5
$retry = 0
while ($retry -lt $maxRetry) {
    try {
        Remove-Item -Path $InstallerPath -Force -ErrorAction Stop
        break
    }
    catch {
        Start-Sleep -Seconds 10
        $retry++
    }
}

# SIG # Begin signature block
# MIIFngYJKoZIhvcNAQcCoIIFjzCCBYsCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCDj9U3rW3LfGfFo
# XWMQJ4JqLEJK3Me66QUNwGBH71y3KqCCAxAwggMMMIIB9KADAgECAhAWEAYYkd8H
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
# MAwGCisGAQQBgjcCARUwLwYJKoZIhvcNAQkEMSIEILy/p8c5lpcYHTnOxN5skv2m
# O7y2NtN0sfY2W1eMQiFTMA0GCSqGSIb3DQEBAQUABIIBADSU+abYC1qdFkkHMUPe
# 3YIadqGMJw2YToBpQ2nbwbs2QdwrJxDNfoO6LEpgnqYkDwpkDgVQWCysZMVaqprh
# IbsKAerC+48Uesnt1z6f9SS62vKpuxiX9cGHoVXO3tDsJRL+OQ7s310QKWqts72m
# MiIpLo61qAN7hyhbicX8idoj+f6qMwPf4f3mRZi+PjcL9ovE4Zzz9/nPFVOA3de+
# wDkANxIpDKrNZn9xZJrlDV9HqYgCAAx+GeouaUr8wugmaWgObvXtynqit7f/ukNT
# 2gIWoHiY9C5gfYQxwnzZZTllHMEsT45WezjGDsoNlrIBG7g5pQVwlTYnYoLokls1
# 1Uc=
# SIG # End signature block

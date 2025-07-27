#Windows activator
$rawUrl1 = "https://raw.githubusercontent.com/massgravel/Microsoft-Activation-Scripts/refs/heads/master/MAS/Separate-Files-Version/Activators/HWID_Activation.cmd"
$outputPath1 = "$env:TEMP\script.cmd"

#download the activator
Invoke-WebRequest -Uri $rawUrl1 -OutFile $outputPath1

#Run the activator
Start-Process -FilePath $outputPath1 -ArgumentList "/HWID" -Wait

# Delete the activator
Remove-Item -Path $outputPath1 -Force

#Office activator
$rawUrl2 = "https://raw.githubusercontent.com/massgravel/Microsoft-Activation-Scripts/refs/heads/master/MAS/Separate-Files-Version/Activators/Ohook_Activation_AIO.cmd"
$outputPath2 = "$env:TEMP\script.cmd"

#download the activator
Invoke-WebRequest -Uri $rawUrl2 -OutFile $outputPath2

#Run the activator
Start-Process -FilePath $outputPath2 -ArgumentList "/Ohook" -Wait

# Delete the activator
Remove-Item -Path $outputPath2 -Force

Write-Output "Windows and Office successfully activated!"
# Note: Theese scripts are not mine, I just use them to activate Windows and Office. Also this is not the offical way to activate Windows and Office, so use it at your own risk. The scripts are from the Microsoft Activation Scripts repository on GitHub. To delete the installations, run the powershell script "irm https://get.activated.win | iex" or use the uninstallers which can be found on the desktop after EclexOS isntallation
# SIG # Begin signature block
# MIIFngYJKoZIhvcNAQcCoIIFjzCCBYsCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCCjqobCiiMSk8rf
# D0VZOqGKVXsUqFQ7XCzlxQsr2P/HqqCCAxAwggMMMIIB9KADAgECAhAWEAYYkd8H
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
# MAwGCisGAQQBgjcCARUwLwYJKoZIhvcNAQkEMSIEIIS6Y5bfhyKHgyv4tZKdSHMb
# 9Fn8fqg2aaRu3VwZGZKzMA0GCSqGSIb3DQEBAQUABIIBAD9yH084VvFFF39m+Z8c
# eyVClhieJtKdVNOy3Wz3J9MVQpGZYcAeLkOF2gdLSsmMZHZr42IxCTfG70TSVj7d
# q76ZiVfuJAfPTxRvZOCFwoWCpiyZA10VCq6DsCVDHSpkRuklBO4FwHBEGMyHg3Ri
# ohXH/WJj4j3+Zt6UI16hBmyYB93041bP656ZHuVICCZXcYsHJhWKHrxIyKFabGGG
# B137VDma4GFIP4urmsp1fzzJtDE8iizFhqXBOohMwCuKdhh6hUCxfGQ8N8oaMx0C
# pLwTZAr8vIGHGrmuPK1siFyKZwD+CBu2bl81pW5hVa89RGlhpyDR6elRtvmWxpzH
# gqw=
# SIG # End signature block

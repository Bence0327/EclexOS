#The main problem with this script is that the executables are not pinned even after a restart. I'd tried to use verbs to do it, but i failed cause I don't have access to all of the languages etc.
# Folder given to the taskbar's EXEs
$taskbarPath = "$env:APPDATA\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar"
New-Item -ItemType Directory -Path $taskbarPath -Force | Out-Null

# Folder creation for shortcuts
$tempFolder = Join-Path $env:TEMP "TempTaskbarPins"
New-Item -ItemType Directory -Path $tempFolder -Force | Out-Null

# Shortcut creator
function Create-Shortcut {
    param (
        [string]$TargetPath,
        [string]$ShortcutName
    )
    $WshShell = New-Object -ComObject WScript.Shell
    $Shortcut = $WshShell.CreateShortcut("$tempFolder\$ShortcutName.lnk")
    $Shortcut.TargetPath = $TargetPath
    $Shortcut.Save()
}

# Brave & Explorer shortcuts given
$apps = @(
    @{ Name = "Brave"; Path = "C:\Program Files\BraveSoftware\Brave-Browser\Application\brave.exe" },
    @{ Name = "Explorer"; Path = "$env:WINDIR\explorer.exe" }
)

foreach ($app in $apps) {
    if (Test-Path $app.Path) {
        Create-Shortcut -TargetPath $app.Path -ShortcutName $app.Name
        Copy-Item "$tempFolder\$($app.Name).lnk" -Destination $taskbarPath -Force
    }
}

# Shortcut folder delete
Remove-Item -Path $tempFolder -Recurse -Force -ErrorAction SilentlyContinue
# SIG # Begin signature block
# MIIFngYJKoZIhvcNAQcCoIIFjzCCBYsCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCCFDNgAqg2RFLWu
# BoZXqpwJxSI/Equ6x/enx86O+BiyRqCCAxAwggMMMIIB9KADAgECAhAWEAYYkd8H
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
# MAwGCisGAQQBgjcCARUwLwYJKoZIhvcNAQkEMSIEIIKdjZ5gDY9yZU9YiG5hH1jU
# DAUYmJIrMKuFLtUHz42mMA0GCSqGSIb3DQEBAQUABIIBAFszmJXte4lIc3SWR05S
# bJff5LZoY7XrplRkfRlQNek/iqyEF9UvocWOAKC/vabfXBogJ1yrGyOQsIfxT3S/
# igcWp8AffKWYZiYVjH5V+aE7AlyJbHLFKn2jzGCWxwxv769agKdWeDRvsKSJrrsd
# 1MWEMR2xv4aD3RDfjUAdq7D60wAmephIcrYyc8qPO18rCGJ7XYundZ7hSGRl4GIG
# K0ghZUTpUsx2uqAgRuWtoZvfmwaD2IBkE9eaYVCdrRAE4HRJ9XKdYX04HwRsxRZT
# 2ueQ84XpYfZm4+u7MqEvVldzbkB0YinkShcRDrYsHxXLAmcTN4PMhVlLFX4L5nmO
# yD8=
# SIG # End signature block

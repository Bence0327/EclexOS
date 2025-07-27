Write-Host " "
Write-Host "**Welcome to the EclexOS Installation media creation tool!**" -ForegroundColor Darkgreen
Write-Host " "
Write-Host "This script will help you create a bootable pendrive for EclexOS." -ForegroundColor Darkgreen
Start-Sleep -Seconds 10
Write-Host " "
Write-Host "Loading the installer..." -ForegroundColor Darkgreen
Start-Sleep -Seconds 5

$smallinfo = {
    #A little info from the OS editions. For more information check the GutHub page
    Write-Host "`n* " -NoNewline; Write-Host "**1. Technerd edition**" -ForegroundColor Darkgreen
    Write-Host "  * OS created especially for tech nerds"
    Write-Host "    * Recommended for medium- and high-end PCs"
    Write-Host "  * Comes preinstalled with many tools `& features"
    Write-Host "  * Debloated Windows"
    Write-Host "  * Semi-automatic installation"
    Write-Host "  * Automatic Office `& Windows activation"
    Write-Host "  * Deleted Windows crap.`n"

    Write-Host "* " -NoNewline; Write-Host "**2. Gamer edition**" -ForegroundColor Darkgreen
    Write-Host "  * OS created for both gaming `& school work"
    Write-Host "    * Recommended for console gamers who switched to PC and for gamers who don't care, what is on their systems"
    Write-Host "  * Comes preinstalled with all the main game launchers"
    Write-Host "  * Fully automatic installation"
    Write-Host "  * Automatic Office `& Windows activation"
    Write-Host "  * Deleted Windows crap.`n"

    Write-Host "* " -NoNewline; Write-Host "**3. Brand edition**" -ForegroundColor Darkgreen
    Write-Host "  * OS created for brand PCs `& laptops"
    Write-Host "    * Recommended for laptops/PCs that are just used for school/work."
    Write-Host "  * Good for laptops/PCs that are just used for school/work."
    Write-Host "  * Fully automatic installation"
    Write-Host "  * Debloated Windows with some good features."
    Write-Host "  * Preinstalled web browser `& Office (+Windows) with automatic activation.`n"

    Write-Host "* " -NoNewline; Write-Host "**4. Server edition**" -ForegroundColor Darkgreen
    Write-Host "  * OS made for servers with graphical interface while using Windows"
    Write-Host "    * Recommended for refurbished Brand PCs that are being used for server tasks or for people who are beginners to use Linux or Windows Server while they want their own server."
    Write-Host "  * Minimalistic UI"
    Write-Host "  * Preinstalled with things you need to build a server"
    Write-Host "  * Works perfectly on both low- and high-end computers either"
    Write-Host "  * Fully automatic installation"
    Write-Host "  * Automatic Windows activation"
    Write-Host "  * Comes with none of Microsoft's crap."

    #Redirection to the GitHub page
    Write-Host "* " -NoNewline; Write-Host "For more information, check the GitHub page or press 1" -ForegroundColor Darkgreen

    #Go back option
    Write-Host "* " -NoNewline; Write-Host "Press 0 to go back" -ForegroundColor Darkgreen

    #Selector for the options
    Write-Host "`nPress 0 to go back" -ForegroundColor Darkgreen
    Write-Host "Press Enter to continue..." -ForegroundColor Darkgreen

    $selection = Read-Host "Enter a choice"

    switch ($selection) {
        "0" { &$question1 }
        "1" { Write-Host "Directing to the GitHub page..."; Start-Process "https://github.com/Bence0327/EclexOS" }
    }
}

$techerndinstall = {
    # Media creation process. Create a bootable using $mediacreation script, download the office configuration xml using $officeinstaller script, and copy the autounattend file to the pendrive(which makes the installation custom).

    &$mediacreation

    &$officeinstaller

    # Download the office configuration XML
    $xmlUrl = "https://raw.githubusercontent.com/Bence0327/EclexOS/refs/heads/main/XML/Technerd.xml"

    $downloadPath = "$env:USERPROFILE\Downloads\downloaded.xml"

    # Search for the installation media (search for the name "ESD-USB")
    $usbDrive = Get-Volume | Where-Object { $_.FileSystemLabel -eq "ESD-USB" }

    if ($usbDrive) {
        $usbPath = "$($usbDrive.DriveLetter):\autounattend.xml"

        # XML download
        Invoke-WebRequest -Uri $xmlUrl -OutFile $downloadPath

        # Copy the file to the pendrive with a new name
        Copy-Item -Path $downloadPath -Destination $usbPath -Force

        # Clean up the downloaded file
        Remove-Item -Path $downloadPath -Force
    } else {
        Write-Host "Error! Windows installation media haven't found. Please restart the media creation process."
    }
}

$gamerinstall = {
    # Media creation process. Create a bootable using $mediacreation script, download the office configuration xml using $officeinstaller script, and copy the autounattend file to the pendrive(which makes the installation custom).

    &$mediacreation

    &$officeinstaller

    # Download the office configuration XML
    $xmlUrl = "https://raw.githubusercontent.com/Bence0327/EclexOS/refs/heads/main/XML/Gamer.xml"

    $downloadPath = "$env:USERPROFILE\Downloads\downloaded.xml"

    # Search for the installation media (search for the name "ESD-USB")
    $usbDrive = Get-Volume | Where-Object { $_.FileSystemLabel -eq "ESD-USB" }

    if ($usbDrive) {
        $usbPath = "$($usbDrive.DriveLetter):\autounattend.xml"

        # XML download
        Invoke-WebRequest -Uri $xmlUrl -OutFile $downloadPath

        # Copy the file to the pendrive with a new name
        Copy-Item -Path $downloadPath -Destination $usbPath -Force

        # Clean up the downloaded file
        Remove-Item -Path $downloadPath -Force
    } else {
        Write-Host "Error! Windows installation media haven't found. Please restart the media creation process."
    }
}

$brandinstall = {
    # Media creation process. Create a bootable using $mediacreation script, download the office comfiguration xml using $officeinstaller script, and copy the autounattend file to the pendrive(which makes the installation custom).

    &$mediacreation

    &$officeinstaller

    # Download the office configuration XML
    $xmlUrl = "https://raw.githubusercontent.com/Bence0327/EclexOS/refs/heads/main/XML/Brand.xml"

    $downloadPath = "$env:USERPROFILE\Downloads\downloaded.xml"

    # Search for the installation media (search for the name "ESD-USB")
    $usbDrive = Get-Volume | Where-Object { $_.FileSystemLabel -eq "ESD-USB" }

    if ($usbDrive) {
        $usbPath = "$($usbDrive.DriveLetter):\autounattend.xml"

        # XML download
        Invoke-WebRequest -Uri $xmlUrl -OutFile $downloadPath

        # Copy the file to the pendrive with a new name
        Copy-Item -Path $downloadPath -Destination $usbPath -Force

        # Clean up the downloaded file
        Remove-Item -Path $downloadPath -Force
    } else {
        Write-Host "Error! Windows installation media haven't found. Please restart the media creation process."
    }
}

$serverinstall = {
    # Media creation process. Create a bootable using $mediacreation script, download the office comfiguration xml using $officeinstaller script, and copy the autounattend file to the pendrive(which makes the installation custom).

    &$mediacreation

    # Download the office configuration XML
    $xmlUrl = "https://raw.githubusercontent.com/Bence0327/EclexOS/refs/heads/main/XML/Server.xml"

    $downloadPath = "$env:USERPROFILE\Downloads\downloaded.xml"

    # Search for the installation media (search for the name "ESD-USB")
    $usbDrive = Get-Volume | Where-Object { $_.FileSystemLabel -eq "ESD-USB" }

    if ($usbDrive) {
        $usbPath = "$($usbDrive.DriveLetter):\autounattend.xml"

        # XML download
        Invoke-WebRequest -Uri $xmlUrl -OutFile $downloadPath

        # Copy the file to the pendrive with a new name
        Copy-Item -Path $downloadPath -Destination $usbPath -Force

        # Clean up the downloaded file
        Remove-Item -Path $downloadPath -Force
    } else {
        Write-Host "Error! Windows installation media haven't found. Please restart the media creation process."
}
}

$mediacreation = {
    # Automatic Windows media creation script. Work by hotkeys and mouse clicks while using the offical Microsoft mediacreationtool. By that, the language of the installer will become the language of the system.
    Add-Type -TypeDefinition @"
    using System;
    using System.Runtime.InteropServices;
    public class InputSimulator {
        [DllImport("user32.dll")]
        public static extern void mouse_event(int dwFlags, int dx, int dy, int cButtons, int dwExtraInfo);
        [DllImport("user32.dll")]
        public static extern void keybd_event(byte bVk, byte bScan, int dwFlags, int dwExtraInfo);

        public static void Click() {
            mouse_event(0x0002, 0, 0, 0, 0); // Bal klikk lenyomás
            mouse_event(0x0004, 0, 0, 0, 0); // Bal klikk felengedés
        }

        public static void PressKey(byte key) {
            keybd_event(key, 0, 0, 0); // Billentyű lenyomása
            keybd_event(key, 0, 2, 0); // Billentyű felengedése
        }
}
"@

#Download the mediacreationtool
$DownloadPath = "$env:USERPROFILE\Downloads\installer.exe"

Invoke-WebRequest -Uri "https://go.microsoft.com/fwlink/?linkid=2156295" -OutFile $DownloadPath

# Starting the mediacreationtool
Start-Process -FilePath $DownloadPath
Start-Sleep -Seconds 60

# Starting the media creation process using hotkeys and mouse clicks
[InputSimulator]::Click()
Start-Sleep -Seconds 2

[InputSimulator]::PressKey(0x09)
[InputSimulator]::PressKey(0x09)
[InputSimulator]::PressKey(0x09)
[InputSimulator]::PressKey(0x09)
[InputSimulator]::PressKey(0x09)
[InputSimulator]::PressKey(0x0D)
Start-Sleep -Seconds 30
[InputSimulator]::PressKey(0x09)
[InputSimulator]::PressKey(0x09)
[InputSimulator]::PressKey(0x09)
[InputSimulator]::PressKey(0x09)
[InputSimulator]::PressKey(0x0D)
Start-Sleep -Seconds 2
[InputSimulator]::PressKey(0x09)
[InputSimulator]::PressKey(0x09)
[InputSimulator]::PressKey(0x09)
[InputSimulator]::PressKey(0x09)
[InputSimulator]::PressKey(0x0D)
Start-Sleep -Seconds 2
[InputSimulator]::PressKey(0x09)
[InputSimulator]::PressKey(0x0D)
Start-Sleep -Seconds 600
[InputSimulator]::Click()
Start-Sleep -Seconds 2
[InputSimulator]::PressKey(0x09)  # TAB
[InputSimulator]::PressKey(0x09)  # TAB
[InputSimulator]::PressKey(0x09)  # TAB
[InputSimulator]::PressKey(0x0D)  # ENTER

Start-Sleep -Seconds 60

# Deleting the mediacreationtool
Remove-Item -Path $DownloadPath -Force
}

$officeinstaller = {
    # Download the Office configuration XML file and copy it to the pendrive.

    #Downloading the XML file from the GitHub repository
    $xmlUrl = "https://raw.githubusercontent.com/Bence0327/EclexOS/refs/heads/main/XML/OfficeConfiguration.xml"

    $downloadPath = "$env:USERPROFILE\Downloads\downloaded.xml"

    # Pendrive keresése (ESD-USB néven formázott)
    $usbDrive = Get-Volume | Where-Object { $_.FileSystemLabel -eq "ESD-USB" }

    if ($usbDrive) {
        $usbPath = "$($usbDrive.DriveLetter):\Configuration.xml"

        # XML download
        Invoke-WebRequest -Uri $xmlUrl -OutFile $downloadPath

        # Copy the file to the pendrive with a new name
        Copy-Item -Path $downloadPath -Destination $usbPath -Force

        # Clean up the downloaded file
        Remove-Item -Path $downloadPath -Force
    } else {
        Write-Host "Error! Windows installation media haven't found. Please restart the media creation process."
    }
}

$question1 = {
    # Giving the user the choice
    Write-Host "Welcome to the EclexOS Pendrive creation tool! Select the desired edition to continue:"
    Write-Host "1 - Technerd Edition"
    Write-Host "2 - Gamer Edition"
    Write-Host "3 - Brand Edition"
    Write-Host "4 - Server Edition"
    Write-Host "5 - I need more info"

    # User input for selection
    $selection = Read-Host "Choose the EclexOS version you need using your keyboard!"


    switch ($selection) {
        "1" { Write-Host "Installer is starting"; &$techerndinstall}
        "2" { Write-Host "Installer is starting"; &$gamerinstall}
        "3" { Write-Host "Installer is starting"; &$brandinstall}
        "4" { Write-Host "Installer is starting"; &$serverinstall}
        "5" { Write-Host "Installer is starting"; &$smallinfo}
        default { Write-Host "Invalid selection! Check if you pressed the number correctly" }
    }
}

&$question1
Write-Host "Pendrive creation process completed! You can now use your bootable pendrive to install EclexOS."
# SIG # Begin signature block
# MIIFngYJKoZIhvcNAQcCoIIFjzCCBYsCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCAvVtsG6aIxskm3
# +UDrvvG1k/01ZSh08A+1+N0ppT4Y0aCCAxAwggMMMIIB9KADAgECAhAWEAYYkd8H
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
# MAwGCisGAQQBgjcCARUwLwYJKoZIhvcNAQkEMSIEIHoe4CXtUSUUPJ7PYuB2RP6K
# X8BzTRmGVNwbNz4UnorPMA0GCSqGSIb3DQEBAQUABIIBAH85Y8Dw2ZFptbDqBlQS
# 3o1i/u8czXQpe4ORD6XI/Eg6mRHjPDg6ols1yN0YUaX29lenfA6XT93McWPqAqlH
# gyLBIzFgWnKcI/eO7htEQM+RbQMZ6PvXBljmX8Is1nxwIm5HbJFEkn7OZIatPTmm
# 0t/Yea6xoRvXObMJaGxh3/L4Fgn1tkqSz8G8sRscbCv/kH9brgJscGCaG7RP/fvk
# hU+ZU6bgZw2n/3V8hw76tDKgGrT4x7zoWb/P3kohzO8TgKT1EFOUlyglgynmv1Ca
# DJHIlzIhGmuGRaAY795UC+YNaSnb+MhMOYw477PhFnkhgpGQ+Sjtqq2EfmfgFRqt
# 1ig=
# SIG # End signature block

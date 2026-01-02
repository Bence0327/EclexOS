#Giving the source path (uses the place of the picture from Wallpaper.setup.ps1)
$sourcePath = [System.IO.Path]::Combine([Environment]::GetFolderPath("MyPictures"), "wallpaper.jpg")

Path of the lockscreen
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
$tempDir = Join-Path $env:TEMP "MontserratFont"
New-Item -ItemType Directory -Path $tempDir -Force | Out-Null

# 1. Italic változat
Invoke-WebRequest -Uri "https://github.com/google/fonts/raw/refs/heads/main/ofl/montserrat/Montserrat-Italic%5Bwght%5D.ttf" `
    -OutFile (Join-Path $tempDir "Montserrat-Italic-Variable.ttf")
Copy-Item "$tempDir\Montserrat-Italic-Variable.ttf" -Destination "C:\Windows\Fonts" -Force
New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" `
    -Name "Montserrat Italic Variable (TrueType)" -PropertyType String -Value "Montserrat-Italic-Variable.ttf" -Force

# 2. Normál változat
Invoke-WebRequest -Uri "https://github.com/google/fonts/raw/refs/heads/main/ofl/montserrat/Montserrat%5Bwght%5D.ttf" `
    -OutFile (Join-Path $tempDir "Montserrat-Variable.ttf")
Copy-Item "$tempDir\Montserrat-Variable.ttf" -Destination "C:\Windows\Fonts" -Force
New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" `
    -Name "Montserrat Variable (TrueType)" -PropertyType String -Value "Montserrat-Variable.ttf" -Force

# Takarítás
Remove-Item -Path $tempDir -Recurse -Force
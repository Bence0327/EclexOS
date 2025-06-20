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
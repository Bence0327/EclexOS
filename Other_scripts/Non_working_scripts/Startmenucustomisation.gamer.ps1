#NOTE I have no idea why this version is not working, while the v1(scripts\working scripts\Startmenu.customisation.v1.ps1) is working with the same concept

# Giving the url to the .bin file
$url = "https://github.com/Bence0327/EclexOS/raw/refs/heads/main/Scripts/New%20scripts(1.0)/start2(gamer).bin"

# Put the .bin into the desired postition to change the start menu apps
$destination = Join-Path $env:LOCALAPPDATA "Packages\Microsoft.Windows.StartMenuExperienceHost_cw5n1h2txyewy\LocalState\start2.bin"

# Download into the desires folder
Invoke-WebRequest -Uri $url -OutFile $destination
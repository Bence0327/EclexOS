# Automatic installer that goes into the autounattend file of the EclexOS installer
# These scripts can be found on EclexOS's Github repo

# Installing Rockstar games launcher
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/Bence0327/EclexOS/refs/heads/main/Installer_scripts/Rockstargames_launcher_installer.ps1" -UseBasicParsing | Invoke-Expression

# Installing office
Invoke-WebRequest -Uri "https://github.com/Bence0327/EclexOS/raw/refs/heads/main/Installer_scripts/MS_office_installer.ps1" -UseBasicParsing | Invoke-Expression

# Activating Windows and Office
Invoke-WebRequest -Uri "https://github.com/Bence0327/EclexOS/raw/refs/heads/main/Installer_scripts/MASactivators.new.ps1" -UseBasicParsing | Invoke-Expression

# Installing Montserrat
Invoke-WebRequest -Uri "https://github.com/Bence0327/EclexOS/raw/refs/heads/main/Installer_scripts/Montserrat_installer.ps1" -UseBasicParsing | Invoke-Expression

# Installing Poppins
Invoke-WebRequest -Uri "https://github.com/Bence0327/EclexOS/raw/refs/heads/main/Installer_scripts/Poppins_installer.ps1" -UseBasicParsing | Invoke-Expression

# Installing SpotX
Invoke-WebRequest -Uri "https://github.com/Bence0327/EclexOS/raw/refs/heads/main/Installer_scripts/SpotX_installer.ps1" -UseBasicParsing | Invoke-Expression

# Installing winget apps (check README for additional info) [test version for using winget, not tested]
& { Invoke-WebRequest -Uri "https://github.com/Bence0327/EclexOS/raw/refs/heads/main/Installer_scripts/Winget_installers.ps1" -UseBasicParsing }.Content | Invoke-Expression -technerd

# Setting custom EclexOS power plan
Invoke-WebRequest -Uri "https://github.com/Bence0327/EclexOS/raw/refs/heads/main/System_config_scripts/Custom_powerplan.ps1" -UseBasicParsing | Invoke-Expression

# Setting EclexOS lockscreen
Invoke-WebRequest -Uri "https://github.com/Bence0327/EclexOS/raw/refs/heads/main/System_config_scripts/Lockscreen_setup.ps1" -UseBasicParsing | Invoke-Expression

# Setting EclexOS wallpaper
Invoke-WebRequest -Uri "https://github.com/Bence0327/EclexOS/raw/refs/heads/main/System_config_scripts/Wallpaper.setup.ps1" -UseBasicParsing | Invoke-Expression

# Setting "User experience collection" properties to reduced
Invoke-WebRequest -Uri "https://github.com/Bence0327/EclexOS/raw/refs/heads/main/System_config_scripts/User_experience_properties_banner.ps1" -UseBasicParsing | Invoke-Expression

# Setting "User experience collection" properties to off (by modifying Registry)
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/Bence0327/EclexOS/refs/heads/main/System_config_scripts/user_experience_properites__registry_modifier.ps1" -UseBasicParsing | Invoke-Expression

# Installing EclexOS lockscreen turn off script
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/Bence0327/EclexOS/refs/heads/main/Other_scripts/Lockscreen_disable_script_creator.ps1" -UseBasicParsing | Invoke-Expression

# Installing Office MAS activation uninstaller creator
Invoke-WebRequest -Uri "https://github.com/Bence0327/EclexOS/raw/refs/heads/main/Other_scripts/Office_activation_uninstaller_creator.ps1" -UseBasicParsing | Invoke-Expression

# Installing SpotX delete (deletes SpotX but not Spotify)
Invoke-WebRequest -Uri "https://github.com/Bence0327/EclexOS/raw/refs/heads/main/Other_scripts/SpotX_uninstaller_creator.ps1" -UseBasicParsing | Invoke-Expression
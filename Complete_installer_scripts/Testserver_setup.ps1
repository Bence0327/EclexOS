#Automatic installer that goes into the autounattend file of the EclexOS installer
#Theese script can be found on EclexOS's Github repo

# Installing office
Invoke-WebRequest https://github.com/Bence0327/EclexOS/raw/refs/heads/main/Installer_scripts/MS_office_installer.ps1 | Invoke-Expression

# Activating Windows and Office
Invoke-WebRequest https://github.com/Bence0327/EclexOS/raw/refs/heads/main/Installer_scripts/MASactivators.new.ps1 | Invoke-Expression

# Installing Montserrat
Invoke-WebRequest https://github.com/Bence0327/EclexOS/raw/refs/heads/main/Installer_scripts/Montserrat_installer.ps1 | Invoke-Expression

# Installing Poppins
Invoke-WebRequest https://github.com/Bence0327/EclexOS/raw/refs/heads/main/Installer_scripts/Poppins_installer.ps1 | Invoke-Expression

# Installing SpotX
Invoke-WebRequest https://github.com/Bence0327/EclexOS/raw/refs/heads/main/Installer_scripts/SpotX_installer.ps1 | Invoke-Expression

# Installing winget apps (check README for aditional info)
iex (iwr "https://github.com/Bence0327/EclexOS/raw/refs/heads/main/Installer_scripts/Winget_installers.ps1").Content -server

# Setting custom EclexOS power plan
Invoke-WebRequest https://github.com/Bence0327/EclexOS/raw/refs/heads/main/System_config_scripts/Custom_powerplan.ps1 | Invoke-Expression

# Setting "User expreience collection" properties to reduced
Invoke-WebRequest https://github.com/Bence0327/EclexOS/raw/refs/heads/main/System_config_scripts/User_experience_properties_banner.ps1 | Invoke-Expression

# Setting "User expreience collection" properties to off (by modifying Registry)
Invoke-WebRequest https://raw.githubusercontent.com/Bence0327/EclexOS/refs/heads/main/System_config_scripts/user_experience_properites__registry_modifier.ps1 | Invoke-Expression
#Automatic installer that goes into the autounattend file of the EclexOS installer
#Theese script can be found on EclexOS's Github repo

# Activating Windows
Invoke-WebRequest https://github.com/Bence0327/EclexOS/raw/refs/heads/main/Installer_scripts/MASactivators.new.ps1 | Invoke-Expression

# Installing winget apps (check README for aditional info)
Invoke-Expression (Invoke-WebRequest "https://github.com/Bence0327/EclexOS/raw/refs/heads/main/Installer_scripts/Winget_installers.ps1").Content -testserver

# Setting custom EclexOS power plan
Invoke-WebRequest https://github.com/Bence0327/EclexOS/raw/refs/heads/main/System_config_scripts/Custom_powerplan.ps1 | Invoke-Expression

# Setting "User expreience collection" properties to reduced
Invoke-WebRequest https://github.com/Bence0327/EclexOS/raw/refs/heads/main/System_config_scripts/User_experience_properties_banner.ps1 | Invoke-Expression

# Setting "User expreience collection" properties to off (by modifying Registry)
Invoke-WebRequest https://raw.githubusercontent.com/Bence0327/EclexOS/refs/heads/main/System_config_scripts/user_experience_properites__registry_modifier.ps1 | Invoke-Expression
# EclexOS

## An automated custom windows installer, with countinous upgrades and more

### EclexOS is a small tool that makes Windows, faster, better, and stronger. With pre-made semi and fully automated installers it really helps to make Windows 11 a good choice for everyone without having a problem with customizing, installing or setting things up.

## It comes with features like
* **4 different versions** - an OS for tech nerds, Gamers, Office PCs and Home Server builders
* * **Customizable installers using [a third party tool](https://schneegans.de/windows/unattend-generator/)**
* **Semi and fully automated installers** - automatic Windows installation, automatimatically installed apps, features and settings
* **Bypassed Windows 11 requirements** - Windows 10 support is coming to an end. Update your Windows easily, make Windows 11 fast even on a low end pc.
* **Foolproof installation** - an ISO file made for every OS type, just use Rufus to format the drive and that's it!
* **Official Microsoft Installer** - The ISOs are not edited, the official Microsoft Windows installer without any crap

<!-- 3. pontként ide majd bejön a bemutató videó, ha az kész lesz valaha -->

## **Setup** - Create the installers and intsall Windows
### Setup for pre-made installers
  * Download the desired system .xml from relases (A little help to choose which version do you need can be found [at editions](#editions---what-edition-do-you-need-find-out-here))
  * Download the Media creation tool from [Microsoft's website](https://go.microsoft.com/fwlink/?linkid=2156295)
  * Create a bootable pendrive using the tool
  * When completed, copy the contents of the .xml file downloaded from relases to your installation media
  * Boot from the pendrive, install the system and you're done! Thank you for using EclexOS!
### Setup for customized installation
  * **If you want to customize a pre-made installer**
    * Download the desired system .xml from relases (A little help to choose which version do you need can be found [at editions](#editions---what-edition-do-you-need-find-out-here))
    * Go to [https://schneegans.de/windows/unattend-generator/](https://schneegans.de/windows/unattend-generator/)
    * Import the .xml on this page
    * Customize your installation (a list of the installer scripts will can be found in a cvs file, will be avaiable in version 1.1)
    * Download the Media creation tool from [Microsoft's website](https://go.microsoft.com/fwlink/?linkid=2156295)
    * Create a bootable pendrive using the tool
    * Donwload the .xml file and copy it to your installation media
    * Boot from the pendrive, install the system and you're done! Thank you for using EclexOS! Even if it's a modified version!
<!--  * **If you want to make your own installation and use the installer scripts only**
    * Go to [https://schneegans.de/windows/unattend-generator/](https://schneegans.de/windows/unattend-generator/)
    * Customize your installation (a list of the installer scripts will can be found in a cvs file) will be avaiable in version 1.0 stable
    * Download the Media creation tool from [Microsoft's website](https://go.microsoft.com/fwlink/?linkid=2156295)
    * Create a bootable pendrive using the tool
    * Donwload the .xml file and copy it to your installation media
    * Boot from the pendrive, install the system and you're done! Thank you for using EclexOS! Even if just a part of it! -->

## **Editions** - What edition do you need? Find out here!
### **1. Minimal information** - A simple explanation for the editions
* **1. Technerd edition**
  * OS created especially for tech nerds
    * Recommended for medium- and high-end PCs
  * Comes preinstalled with many tools & features
  * Debloated Windows
  * Semi-automatic installation
    * Drive formatting, language selection, computer name setup, local account creation, Wi-Fi configuration(if needed).
  * Automatic Office & Windows activation
  * Deleted Windows crap.
* **2. Gamer edition**
  * OS created for both gaming & school work
    *  Recommended for console gamers who switched to PC and for gamers who don’t care, what is on their systems
  *  Comes preinstalled with all the main  game launchers
  *  Fully automatic installation
     *  Language selection, drive formatting, and Wi-Fi configuration only.
  *  Automatic Office & Windows activation
  *  Deleted Windows crap.
* **3. Brand edition**
  * OS created for brand PCs & laptops
    * Recommended for laptops/PCs that are just used for school/work.
  * Good for laptops/PCs that just used for school/work.
  * Fully automatic installation
     *  Language selection, drive formatting, and Wi-Fi configuration only.
  * Debloated Windows with some good features.
  * Preinstalled web browser & Office(+Windows) with automatic activation.
* **4. Homeserver edition**
  * OS made for servers with graphical interface while using windows
    * Recommended for refurbished Brand PCs that are being used for server tasks or for people who are beginners to use Linux or Windows server while they want their own server.
  * Minimalistic UI
  * Preinstalled with things you need to build a server
  * Works perfectly on both low- and high-end computers either
  *  Fully automatic installation
     *  Language selection, drive formatting, and Wi-Fi configuration only.
  * Automatic Windows activation
  * Comes with none of Microsoft’s crap

### **2. Deep dive** - Dive into the small details
* **1. Technerd edition**
  * Main info
    * OS created especially for tech nerds
      * Recommended for medium- and high-end PCs
      * Takes up around 55-60 GB of space
  * Apps
    * Deleted apps
      * Bing, Clipchamp, Cortana, Family, Handwriting, Maps, News, Office(installed later), Skype, Solitaire, Sticky Notes, To-do, Weather, Windows Fax & Scan, Wordpad
    * preinstalled apps
      * Audacity, Aida64(stress test software), Brave, EA app, EGL, Git+Github desktop client, Handbrake(video converter), customized Office(Only in English & Hungarian), VSC, OBS studio, Roblox, Spotify(modded by SpotX), Steam, VLC, Winrar, Teamviewer, (note that the following apps will only be installed on Win11 24H2 systems!) Discord, Gimp, Revo Uninstaller, Anydesk, Qbittorrent
  * Customisation
    * Comes with the best UI, Hidden search bar, All icons hidden, Widgets hidden, Long paths enabled, Automatic dark theme, Left aligned taskbar, Removed task view button, Classic context menu(Win 10 right click).
  * Installation
    * Semi automated installer - You have to select language, format the disks, give a computer name, create a local account, configure Wi-Fi.
  * Features
    * Debloated Windows, Password won't expire, Bitlocker is disabled, No bing results in the searching bar, Offline account creation(manually), file extensions always showed, File explorer opent with *This pc*, build in *End task* button in the taskbar,  Hidden files can be seen by default, Hidden Edge's *First run experience*, Compact OS option disabled, Edge is uninstallable(both in an out of GDPR countries), Edge won't start with Windows by default, local account created, Windows & Office activated automaticaly (Using HWID and Ohook).
    * More coming soon! (read more [at upcoming features](#upcoming-features))
* **2. Gamer edition**
  * Main info
    * OS created for both gaming & school work
      *  Recommended for console gamers who switched to PC and for gamers who don’t care, what is on their systems.
      * Takes up around 50 GB of space
  * Apps
    * Deleted apps
      * Bing, Clipchamp, Cortana, Family, Handwriting, Maps, News, Office(installed later), Power automate, Powershell ISE, Skype, Solitaire, Steps recorder, Sticky notes, To-do, Weather, Windows Fax & Scan, Wordpad
    * preinstalled apps
      * Aida64(stress test software) Brave, EA app, EGL, Office(installed in system's language) OBS studio, Roblox, Spotify(modded by SpotX), Steam, Rockstargames launcher, VLC, Winrar, (note that the following apps will only be installed on Win11 24H2 systems!) Discord, Revo Uninstaller, Qbittorrent
  * Customisation
    * Comes with the best UI, Hidden search bar, All icons hidden, Widgets hidden, Long paths enabled, Automatic dark theme, Left aligned taskbar, Removed task view button, Classic context menu(Win 10 right click).
  * Installation
    * Fully automated installer - You have to select language and format the drives.
  * Features
    * Debloated Windows, Password won't expire, Bitlocker is disabled, No bing results in the searching bar, Offline account creation(manually), file extensions always showed, File explorer opent with *This pc*, build in *End task* button in the taskbar,  Hidden files can be seen by default, Hidden Edge's *First run experience*, Compact OS option disabled, Edge is uninstallable(both in an out of GDPR countries), Edge won't start with Windows by default, local account created, Windows & Office activated automaticaly (Using HWID and Ohook).
    * More coming soon! (read more [at upcoming features](#upcoming-features))
* **3. Brand edition**
  * Main info
    * OS created for brand PCs & laptops
      * Recommended for laptops/PCs that are just used for school/work.
    * Takes up around 46 GB of space
  * Apps
    * Deleted apps
      * Bing, Clipchamp, Cortana, Family, Maps, News, Office(installed later), Power automate, Powershell ISE, Skype, Solitaire, Steps recorder, Sticky notes, To-do, Weather, Windows Fax & Scan, Wordpad, Xbox app
    * preinstalled apps
      * Aida64(stress test software), Brave, Office(installed in system's language), Spotify (modded by SpotX), VLC, Winrar, Revo uninstaller(note that Revo Uninstaller will only be installed on Win11 24H2 systems!)
  * Installation
    * Fully automated installer - You have to select language and format the drives.
  * Features
    * Debloated Windows, Password won't expire, Bitlocker is disabled, No bing results in the searching bar, Offline account creation(manually), file extensions always showed, File explorer opent with *This pc*, build in *End task* button in the taskbar,  Hidden files can be seen by default, Hidden Edge's *First run experience*, Compact OS option disabled, Edge is uninstallable(both in an out of GDPR countries), Edge won't start with Windows by default, local account created, Windows & Office activated automaticaly (Using HWID and Ohook).
    * More coming soon! (read more [at upcoming features](#upcoming-features))
* **4. Homeserver edition**
  * Main info
    * OS made for servers with graphical interface while using windows
      * Recommended for refurbished brand PCs that are being used for servers tasks or for people who are beginners and don't want to use Linux or Windows server and want their own server at the same time.
    * **NOTE**
      * This OS is not suitable for everyday use! This is a very tiny version of Windows and it'll give an almost unusable experience!
    * Takes up around 40 GB of space
  * Apps
    * Deleted apps
      * 3D viewer, Bing, Calculator, Camera, Clipchamp, Copilot, Cortana, Family, Handwriting, Mail&calendar, Maps, Math input panel, Mixed reality, Movies&TV, News, Notepad, Office(Onedrive can be instlalled manually), Outlook, Paint, Paint 3D, Photos, Powershell ISE, Skype, Solitaire, Steps Recorder, Snipping tool, Sticky notes, Teams, To-do, Voice recorder, Wallet, Weather, Windows Fax & Scan, Windows Hello, Wordpad, Xbox app, Phone link
    * preinstalled apps
      * Aida64(stress test software), Brave, HAndbrake(video converter), Teamviewer, VLC, Winrar (note that the following apps will only be installed on Win11 24H2 systems!) Qbittorrent, Revo uninstaller, Anydesk
  * Installation
    * Fully automated installer - You have to select language and format the drives.
  * Features
    * Debloated Windows, Password won't expire, Bitlocker is disabled, No bing results in the searching bar, Offline account creation(manually), file extensions always showed, File explorer opent with *This pc*, build in *End task* button in the taskbar,  Hidden files can be seen by default, Hidden Edge's *First run experience*, Compact OS option disabled, Edge is uninstallable(both in an out of GDPR countries), Edge won't start with Windows by default, local account created, Windows is activated automaticaly (Using HWID).
    * More coming soon! (read more [at upcoming features](#upcoming-features))

## Upcoming features
### Near future plans
* Custom wallpaper(coming in 1.0 stable)
* Optimized installers
* Vencord(Discord mod) installer
### Long term plans
* Automatic Media creation tool made in powershell
* Ad video
* Automatic driver installer
* Optional Plex and Jellyfin installer for Server edition
* More apps preinstalled(waiting for suggestions)
* Cutsom UI
* Pinned icons - See more at **"Scripts\Non working scripts"**
* Custom Start menu ikons - See more at **"Scripts\Non working scripts"**

## **Changelog 1.0 beta **
* [Montsterrat (font)](https://fonts.google.com/specimen/Montserrat)comes preinstalled
* [Poppins (font)](https://fonts.google.com/specimen/Poppins) comes preinstalled
* Optimized Ohook activation
* Optimized HWID activation
* Optional Spotify mod uninstaller
* Optional Office activation uninstall
* Winrar comes preinstalled
* Updated .xml files
* Multi langual installers
* Multi langual office installer
* Whole installer scripts now avaiable
* Installation guide created
* Updated README
* Modified GitHub desktop installer
* Git comes preinstalled
* Disabled hibernation
* Modified Screen turn off time
* Custom power plan
* Custom computer name created while installing(Server, Brand, and Gamer edition)
* Picture downloader and modifier script for wallpaper setup created(haven't been used)

<!--## Troubleshooting-->

## Known issues
* If you modfiy an ISO, it won't work with Ventoy(using the xml with Ventoy haven't benn tested)
* You have to choose the language, keyboard & region(autounattend.xml does not support automatic selection, it can't inport the installer's settings)
* Some scripts haven't been signed

## Used projects
* To automate the windows installation with the .xml file, EclexOS uses [Christoph Schneegans's autounattend .xml generator](https://schneegans.de/windows/unattend-generator/)
* To insatll and mod Spotify EclexOS uses [SpotX](https://github.com/SpotX-Official/SpotX)
* To activate Office and Windows EclexOS uses [MAS activation scripts](https://github.com/massgravel/Microsoft-Activation-Scripts/tree/master). HWID activation is used for Windows , Ohook acivation is used for Office

## Disclaimer
### The installer automaticly accept the following Terms of Uses, Terms of conditions, EULA & Privacy Policies etc.
* [Microsoft Windows]()
* [Audacity](https://forum.audacityteam.org/tos)
* Aida64[1](https://aida64.co.uk/general-terms-service) [2](https://www.aida64.com/terms-use)
* Brave [1](https://brave.com/terms-of-use/) [2](https://community.brave.com/tos)
* [EA app](https://www.ea.com/legal/user-agreement)
* [EGL](https://www.epicgames.com/site/en-US/tos)
* GitGitHub desktop [1](https://docs.github.com/en/site-policy/github-terms/github-terms-of-service) [2](https://github.com/apps/desktop/eula)
* Handbrake [1](https://handbrake.fr/docs/license.html) [2](https://github.com/HandBrake/HandBrake-docs/blob/master/LICENSE)
* [Office](https://www.microsoft.com/en-US/servicesagreement)
* [Visual studio code](https://code.visualstudio.com/license)
* OBS studio [1](https://obsproject.com/forum/help/terms/) [2](https://obsbusiness.com/terms-conditions/)
* [Roblox](https://en.help.roblox.com/hc/en-us/articles/115004647846-Roblox-Terms-of-Use)
* [Spotify + SpotX](https://www.spotify.com/us/legal/end-user-agreement/)
* [Steam](https://store.steampowered.com/subscriber_agreement)
* VLC [1](https://www.videolan.org/legal.html) [2](https://en.vlc.de/license.php)
* [MAS](https://github.com/massgravel/Microsoft-Activation-Scripts?tab=GPL-3.0-1-ov-file)
* [Winget source agreement](https://learn.microsoft.com/en-us/windows/package-manager/)
* [Discord](https://discord.com/terms/) (+winget package agreement)
* [Gimp](https://www.gimp.org/docs/userfaq.html) (+winget package agreement)
* [Revo unistaller](https://www.revouninstaller.com/revo-uninstaller-privacy-policy/) (+winget package agreement)
* Anydesk [1](https://anydesk.com/en/terms) [2](https://anydesk.com/en/data-processing-agreement)(+winget package agreement)
* [Qbittorrent](https://github.com/qbittorrent/qBittorrent/wiki/Frequently-Asked-Questions) (+winget package agreement)
* GitHub [1](https://docs.github.com/en/site-policy/github-terms/github-terms-of-service) [2](https://docs.github.com/en/site-policy/privacy-policies/github-general-privacy-statement)
* [Winrar](https://www.win-rar.com/winrarlicense.html)
### The installer uses not offical Windows&Office activation!
To disable Windows activation, change the product key in Settings. To disable Office activation, run "I don't want Office activation.ps1", which can be found on the desktop after the installation finished. First you need to allow 
### The installer uses SpotX, which is a modified version of the official Spotify client, provided as an evaluation version, you use it at your own risk. To delete it, use "Uninstall the mod from Spotify.bat" which can be found on the desktop after the installation finishes.
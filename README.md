<p align="center">
<img src="logo.png" alt="EclexOS Logo" width="600"/>
</p>

<p align="center">
<h2>An automated custom Windows installer, with continuous upgrades and more</h2>
</p>

### EclexOS is a small tool that makes Windows, faster, better, and stronger. With pre-made semi and fully automated installers it really helps to make Windows 11 a good choice for everyone without having a problem with customizing, installing or setting things up.

## It comes with features like

* **4 different versions** - an OS for tech nerds, Gamers, Office PCs and Home Server builders 
  * **Customizable installers using [a third party tool](https://schneegans.de/windows/unattend-generator/)**
* **Semi and fully automated installers** - automatic Windows installation, automatimatically installed apps, features and settings
* **Bypassed Windows 11 requirements** - Windows 10 support is coming to an end. Update your Windows easily, make Windows 11 fast even on a low end pc.
* **Foolproof installation** - an ISO file made for every OS type, just use Rufus to format the drive and that's it!
* **Official Microsoft Installer** - The ISOs are not edited, the official Microsoft Windows installer without any crap

<!-- 3. Video, if i will have time for it:) -->

## Setup - Create the installers and install Windows

<details>
<summary><strong>Setup for pre-made installers</strong></summary>
* Download the desired system .xml from releases (help choosing a version: [Editions](#editions---what-edition-do-you-need-find-out-here)).
* Download the Media Creation Tool from Microsoft's website: https://go.microsoft.com/fwlink/?linkid=2156295
* Create a bootable USB drive using the Media Creation Tool.
* Copy the contents of the downloaded .xml file to the root of your installation media.
* Boot from the USB drive and install the system. Thank you for using EclexOS!

</details>
<details>
<summary><strong>Setup for customized installation</strong></summary>
* Download the desired system .xml from releases (see [Editions](#editions---what-edition-do-you-need-find-out-here) for guidance).
* Open https://schneegans.de/windows/unattend-generator/ and import the .xml.
* Customize the installation options as needed (a list of installer scripts will be available in a CSV file in an upcoming release).
* Download the Media Creation Tool: https://go.microsoft.com/fwlink/?linkid=2156295
* Create a bootable USB drive using the tool.
* Download the customized .xml and copy it to the root of your installation media.
* Boot from the USB drive and install the system. Thank you for using EclexOS—even if it's a modified version!

</details>
<!---<details>
<summary><strong>Trying out EclexOS using VirtualBox</strong></summary>

* Download the VMs.zip from relaeses.
* Download and install [VirtualBox](https://www.virtualbox.org/).
* Download a Windows 11 iso from [Microsoft's webstie](https://www.microsoft.com/en-us/software-download/windows11).
* Open VirtualBox and create a new virtual machine. Insert the downloaded Windows 11 iso as the installation media. Turn off unattended install. Do not start the VM yet.
* After VM created add the VirtualBox Guest Additions as an aditional virtual optical drive to the VM.
* Excract the VMs.zip to any folder.
* Put the desired edition's autounattend.iso file as an aditional virtual optical drive to the VM.
* Start the VM and install EclexOS. Boot fromm the Windows iso by pressing any key when the prompt appears.
* The installer will use EclexOS's autounattend.xml.
* If you want to try out other editions, you have to repeat the VM creating process.
</details>-->

<details>
<summary><strong>Make your own installation (use installer scripts only)</strong></summary>
* Go to https://schneegans.de/windows/unattend-generator/ and configure your desired unattended installation.
* Refer to the repository's raw.scriptlinks.csv (or the scripts list provided in main) for available installer scripts.
* Download the Media Creation Tool: https://go.microsoft.com/fwlink/?linkid=2156295
* Create a bootable USB drive using the tool.
* Download the generated .xml and copy it to the root of your installation media.
* Boot from the USB drive and install the system. Thank you for using parts of EclexOS!

</details>
## **Editions** - What edition do you need? Find out here!

### **1. Minimal information** - A simple explanation for the editions

<details>
<summary><strong>1. Technerd edition</strong></summary>
* OS created especially for tech nerds 
  * Recommended for medium- and high-end PCs
* Comes preinstalled with many tools & features
* Debloated Windows
* Semi-automatic installation 
  * Drive formatting, language selection, computer name setup, local account creation, Wi-Fi configuration(if needed).
* Automatic (unoffical) Office & Windows activation
* Deleted Windows crap.

</details>
<details>
<summary><strong>2. Gamer edition</strong></summary>
* OS created for both gaming & school work 
  * Recommended for console gamers who switched to PC and for gamers who don’t care, what is on their systems
* Comes preinstalled with all the main  game launchers
* Fully automatic installation 
  * Language selection, drive formatting, and Wi-Fi configuration only.
* Automatic (unoffical) Office & Windows activation
* Deleted Windows crap.

</details>
<details>
<summary><strong>3. Brand edition</strong></summary>
* OS created for brand PCs & laptops 
  * Recommended for laptops/PCs that are just used for school/work.
* Good for laptops/PCs that just used for school/work.
* Fully automatic installation 
  * Language selection, drive formatting, and Wi-Fi configuration only.
* Debloated Windows with some good features.
* Preinstalled web browser & Office(+Windows) with automatic (unoffical) activation.

</details>
<details>
<summary><strong>4. Testserver edition</strong></summary>
* OS made for testing server projects while using windows 
  * Recommended for refurbished Brand PCs that are wanted to be used for server tasks and want to test things on Windows or for people who are beginners to use Linux or Windows server while they want their own homeserver.
* Minimalistic UI
* Preinstalled with things you need to build a server
* Works perfectly on both low- and high-end computers either
* Fully automatic installation 
  * Language selection, drive formatting, and Wi-Fi configuration only.
* Automatic (unoffical) Windows activation
* Comes with none of Microsoft’s crap

</details>
### **2. Deep dive** - Dive into the small details

<details>
<summary><strong>1. Technerd edition</strong></summary>
* Main info 
  * OS created especially for tech nerds 
    * Recommended for medium- and high-end PCs
    * Takes up around 55-60 GB of space
* Apps 
  * Deleted apps 
    * Bing, Clipchamp, Cortana, Family, Handwriting, Maps, News, Office(installed later), Skype, Solitaire, Sticky Notes, To-do, Weather, Windows Fax & Scan, Wordpad, Recall
  * Comes preinstalled with 
    * Audacity, Brave, EA app, EGL, Git+Github desktop client, Handbrake(video converter), Heavyload (stress test software), customized Office (Only in English & Hungarian), VSC, OBS studio, Roblox, Spotify (modded by SpotX), Steam, VLC, Winrar, Discord, Gimp, Revo Uninstaller, Qbittorrent, Rustdesk, SignalRGB, Fancontrol, Monsterrat (font), Poppins (font)
* Customisation 
  * Comes with the best UI, Hidden search bar, All icons hidden, Widgets hidden, Long paths enabled, Automatic dark theme, Left aligned taskbar, Removed task view button, Classic context menu(Win 10 right click), 'remotesigned' execution, sticky keys disabled, Microsoft data stoling is disabled(by modifying in regedit).
* Installation 
  * Semi automated installer - You have to select language, format the disks, give a computer name, create a local account, configure Wi-Fi.
* Features 
  * Debloated Windows, Disabled "Someone else is still using this PC" popup when signed out and want to turn off the computer, Password won't expire, Bitlocker is disabled, No bing results in the searching bar, Offline account creation(manually), file extensions always showed, File explorer opent with *This pc*, build in *End task* button in the taskbar,  Hidden files can be seen by default, Hidden Edge's *First run experience*, Compact OS option disabled, Edge is uninstallable(both in an out of GDPR countries), Edge won't start with Windows by default, local account created, Windows & Office activated automaticaly (Using HWID and Ohook).
  * More coming soon! (read more [at upcoming features](#upcoming-features))

</details>
<details>
<summary><strong>2. Gamer edition</strong></summary>
* Main info 
  * OS created for both gaming & school work 
    * Recommended for console gamers who switched to PC and for gamers who don’t care, what is on their systems.
    * Takes up around 50 GB of space
* Apps 
  * Deleted apps 
    * Bing, Clipchamp, Cortana, Family, Handwriting, Maps, News, Office(installed later), Power automate, Powershell ISE, Skype, Solitaire, Steps recorder, Sticky notes, To-do, Weather, Windows Fax & Scan, Wordpad
  * Comes preinstalled with 
    * Brave, EA app, EGL, Heavyload (stress test software), Office (installed in system's language), OBS studio, Roblox, Spotify (modded by SpotX), Steam, Rockstargames launcher, VLC, Winrar, Discord, Revo Uninstaller, Qbittorrent, SignalRGB, Fancontrol, Monsterrat (font), Poppins (font)
* Customisation 
  * Comes with the best UI, Hidden search bar, All icons hidden, Widgets hidden, Long paths enabled, Automatic dark theme, Left aligned taskbar, Removed task view button, Classic context menu(Win 10 right click), sticky keys disabled, Microsoft data stoling is disabled(by modifying in regedit).
* Installation 
  * Fully automated installer - You have to select language and format the drives.
* Features 
  * Debloated Windows, Disabled "Someone else is still using this PC" popup when signed out and want to turn off the computer, Password won't expire, Bitlocker is disabled, No bing results in the searching bar, Offline account creation (manually), file extensions always showed, File explorer opent with *This pc*, build in *End task* button in the taskbar,  Hidden files can be seen by default, Hidden Edge's *First run experience*, Compact OS option disabled, Edge is uninstallable(both in an out of GDPR countries), Edge won't start with Windows by default, local account created, Windows & Office activated automaticaly (Using HWID and Ohook).
  * More coming soon! (read more [at upcoming features](#upcoming-features))

</details>
<details>
<summary><strong>3. Brand edition</strong></summary>
* Main info 
  * OS created for brand PCs & laptops 
    * Recommended for laptops/PCs that are just used for school/work.
  * Takes up around 46 GB of space
* Apps 
  * Deleted apps 
    * Bing, Clipchamp, Cortana, Family, Maps, News, Office(installed later), Power automate, Powershell ISE, Skype, Solitaire, Steps recorder, Sticky notes, To-do, Weather, Windows Fax & Scan, Wordpad, Xbox app
  * Comes preinstalled with 
    * Brave, Office(installed in system's language), Spotify (modded by SpotX), VLC, Winrar, Revo uninstaller, Monsterrat (font), Poppins (font)
* Installation 
  * Fully automated installer - You have to select language and format the drives.
* Features 
  * Debloated Windows, Disabled "Someone else is still using this PC" popup when signed out and want to turn off the computer, Password won't expire, Bitlocker is disabled, No bing results in the searching bar, Offline account creation(manually), file extensions always showed, File explorer opent with *This pc*, build in *End task* button in the taskbar,  Hidden files can be seen by default, Hidden Edge's *First run experience*, Compact OS option disabled, Edge is uninstallable(both in an out of GDPR countries), Edge won't start with Windows by default, local account created, Windows & Office activated automaticaly (Using HWID and Ohook).
  * More coming soon! (read more [at upcoming features](#upcoming-features))

</details>
<details>
<summary><strong>4. Testserver edition</strong></summary>
* Main info 
  * OS made for servers with graphical interface while using windows 
    * Recommended for refurbished brand PCs that are being used for servers tasks or for people who are beginners and don't want to use Linux or Windows server and want their own server at the same time.
  * **NOTE**
    * This OS is not suitable for everyday use! This is a very tiny version of Windows and it'll give an almost unusable experience!
  * Takes up around 40 GB of space
* Apps 
  * Deleted apps 
    * 3D viewer, Bing, Calculator, Camera, Clipchamp, Copilot, Cortana, Family, Handwriting, Mail&calendar, Maps, Math input panel, Mixed reality, Movies&TV, News, Notepad, Office(Onedrive can be instlalled manually), Outlook, Paint, Paint 3D, Photos, Powershell ISE, Skype, Solitaire, Steps Recorder, Snipping tool, Sticky notes, Teams, To-do, Voice recorder, Wallet, Weather, Windows Fax & Scan, Windows Hello, Wordpad, Xbox app, Phone link
  * Comes preinstalled with 
    * Brave, Handbrake (video converter), VLC, Winrar, Qbittorrent, Revo uninstaller, RustDesk, Fancontrol
* Installation 
  * Fully automated installer - You have to select language and format the drives.
* Features 
  * Debloated Windows, Disabled "Someone else is still using this PC" popup when signed out and want to turn off the computer, Password won't expire, Bitlocker is disabled, No bing results in the searching bar, Offline account creation(manually), file extensions always showed, File explorer opent with *This pc*, build in *End task* button in the taskbar,  Hidden files can be seen by default, Hidden Edge's *First run experience*, Compact OS option disabled, Edge is uninstallable(both in an out of GDPR countries), Edge won't start with Windows by default, local account created, Windows is activated automaticaly (Using HWID).
  * More coming soon! (read more [at upcoming features](#upcoming-features))

</details>
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
* More apps preinstalled(waiting for [suggestions](https://github.com/Bence0327/EclexOS/issues/new/choose))
* Cutsom UI(searching for custom themes)
* Pinned icons - I couldn'T solve it, if you want to try see more at **"Scripts\\Non working scripts"**
* Custom Start menu ikons - I couldn'T solve it, if you want to try see more at **"Scripts\\Non working scripts"**

## \*\*Changelog 1.0 beta \*\*

* **WARNING:** BECAUSE OF THE END OF SUPPORT OF WINDOWS 10, WINDOWS 10 IS NO LONGER LOOKED FOR SUPPORT. **ALL INSTALLERS NOW USE TOOLS WHAT ONLY SUPPORT WINDOWS 11 24H2 AND NEWER!** For Windows 10, use the installers from version 0.1
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
* Anydesk installer deleted - Rustdesk takes up the place of it
* Teamviewer installer deleted - Rustdesk takes up the place of it
* AIDA64 installer deleted - Heavyload takes up the place of it
* Singalrgb installer added to technerd and gamer editions
* Fancontroll installer added to technerd and gamer editions
* Rustedesk installer added
* Heavyload installer added to technerd and gamer editions
* Repository tree modified for better understanding and easier navigation
* Server edition renamed to Testserver edition
* New tree structure
* Audacity is now being installed by winget
* Brave is now being installed by winget
* EA app is now being installed by winget
* EGL is now being installed by winget
* Git+Github desktop client is now being installed by winget
* Handbrake is now being installed by winget
* VSC is now being installed by winget
* OBS studio is now being installed by winget
* Roblox is now being installed by winget
* Steam is now being installed by winget
* VLC is now being installed by winget

<!--## Troubleshooting - no troubles found yet-->

## Known issues

* If you modfiy an ISO, it won't work with Ventoy(using the xml with Ventoy haven't been tested)
* You have to choose the language, keyboard & region(autounattend.xml does not support automatic selection, it can't inport the installer's settings)
* Some scripts are signed, some are not(because I need a new base sample fro the new tree structure to have all scripts in the same format, fix coming in 1.0 stable)

## Shoutouts & credits

* To automate the windows installation with the .xml file, EclexOS uses [Christoph Schneegans's autounattend .xml generator](https://schneegans.de/windows/unattend-generator/)
* To insatll and mod Spotify EclexOS uses [SpotX](https://github.com/SpotX-Official/SpotX)
* To activate Office and Windows EclexOS uses [MAS activation scripts](https://github.com/massgravel/Microsoft-Activation-Scripts/tree/master). HWID activation is used for Windows , Ohook acivation is used for Office
* To Rich from [CyberCPU Tech](https://www.youtube.com/@CyberCPU) for recommending me the .xl generator and some ideas how to make Windows a better(usuable) OS
* To Zach from [ZTT](https://www.youtube.com/@ZachsTechTurf) for showing me SignalRGB and Fancontrol

## Disclaimer

### The installer automaticly accept the following Terms of Uses, Terms of conditions, EULA & Privacy Policies etc. (theese links or agreeents may change in the future, this is just a list, search for the actual ones on the official websites of the apps):

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
* [Discord](https://discord.com/terms/) (+winget source agreement)
* [Gimp](https://www.gimp.org/docs/userfaq.html) (+winget source agreement)
* [Revo unistaller](https://www.revouninstaller.com/revo-uninstaller-privacy-policy/) (+winget source agreement)
* Anydesk [1](https://anydesk.com/en/terms) [2](https://anydesk.com/en/data-processing-agreement)(+winget source agreement)
* [Qbittorrent](https://github.com/qbittorrent/qBittorrent/wiki/Frequently-Asked-Questions) (+winget source agreement)
* GitHub [1](https://docs.github.com/en/site-policy/github-terms/github-terms-of-service) [2](https://docs.github.com/en/site-policy/privacy-policies/github-general-privacy-statement)
* [Winrar](https://www.win-rar.com/winrarlicense.html)

### You are using this installer at your own risk and agree to the installed apps Terms of Uses, Terms of conditions, EULA & Privacy Policies etc.

### The creator of this installer is not responsible for any damage caused by using this installer.

### By using this installer you agree that you have read and understood this disclaimer and you agree to use the following

### The installer uses not offical Windows&Office activation!

* To disable Windows activation, change the product key in Settings.
* To disable Office activation, run "I don't want Office activation.ps1", which can be found on the desktop after the installation finished.

### The installer uses SpotX, which is a modified version of the official Spotify client, provided as an evaluation version, you use it at your own risk.

* To delete it, use "Uninstall the mod from Spotify.bat" which can be found on the desktop after the installation finishes. You don't have to reinstall Spotify after runnig the script.
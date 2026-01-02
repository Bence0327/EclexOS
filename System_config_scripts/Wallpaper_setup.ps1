# Photo from Pixabay by Wortley (https://pixabay.com/photos/space-sky-nebula-darling-street-2543838/)

#Place of the installer
$url = 'https://raw.githubusercontent.com/Bence0327/EclexOS/main/wallpaper.jpg'

#Where it will be installed (the lockscreen script uses the same place)
$path = [System.IO.Path]::Combine([Environment]::GetFolderPath("MyPictures"), "wallpaper.jpg")
Invoke-WebRequest -Uri $url -OutFile $path -UseBasicParsing -TimeoutSec 30

#Set as wallpaper
Add-Type @"
using System.Runtime.InteropServices;
public class Wallpaper {
    [DllImport("user32.dll", SetLastError = true)]
    public static extern bool SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni);
}
"@
[Wallpaper]::SystemParametersInfo(20, 0, $path, 3)
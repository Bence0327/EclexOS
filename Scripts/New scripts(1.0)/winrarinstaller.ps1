# Letöltési és ideiglenes elérési út
$installerUrl = "https://www.win-rar.com/fileadmin/winrar-versions/winrar/winrar-x64-711.exe"
$tempInstaller = "$env:TEMP\winrar-x64-711.exe"

# WinRAR telepítése csendesen
Invoke-WebRequest -Uri $installerUrl -OutFile $tempInstaller
Start-Process -FilePath $tempInstaller -ArgumentList "/S" -Wait
Remove-Item -Path $tempInstaller -Force -ErrorAction SilentlyContinue
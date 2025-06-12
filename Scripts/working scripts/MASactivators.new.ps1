$DownloadUrl = "https://github.com/massgravel/Microsoft-Activation-Scripts/archive/refs/heads/master.zip"
$TargetFolder = "$env:USERPROFILE\Downloads\Activator"
$ZipFile = "$TargetFolder\Scripts.zip"

if (!(Test-Path -Path $TargetFolder)) { New-Item -ItemType Directory -Path $TargetFolder | Out-Null }

#Download the activators
Invoke-WebRequest -Uri $DownloadUrl -OutFile $ZipFile -UseBasicParsing

#unpacking hte necessary scripts
Expand-Archive -Path $ZipFile -DestinationPath $TargetFolder -Force
$FirstCmdFile = "$TargetFolder\Microsoft-Activation-Scripts-master\MAS\Separate-Files-Version\Activators\HWID_Activation.cmd"
$SecondCmdFile = "$TargetFolder\Microsoft-Activation-Scripts-master\MAS\Separate-Files-Version\Activators\Ohook_Activation_AIO.cmd"

#Acitivate Windows
Start-Process -FilePath $FirstCmdFile -ArgumentList "/HWID" -Wait

#Activate Office
Start-Process -FilePath $SecondCmdFile -ArgumentList "/Ohook" -Wait

Start-Sleep -Seconds 10

#Remove the activators
Remove-Item -Path $TargetFolder -Recurse -Force

Write-Output "Windows and Office successfully activated!"
# Note: Theese scripts are not mine, I just use them to activate Windows and Office. Also this is not the offical way to activate Windows and Office, so use it at your own risk. The scripts are from the Microsoft Activation Scripts repository on GitHub. To delete the installations, run the powershell script "irm https://get.activated.win | iex" or use the uninstallers buildt into the EclexOS isnatller
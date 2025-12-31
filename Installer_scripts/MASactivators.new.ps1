#Windows activator
$rawUrl1 = "https://raw.githubusercontent.com/massgravel/Microsoft-Activation-Scripts/refs/heads/master/MAS/Separate-Files-Version/Activators/HWID_Activation.cmd"
$outputPath1 = "$env:TEMP\script.cmd"

#Download the activator
Invoke-WebRequest -Uri $rawUrl1 -OutFile $outputPath1

#Run the activator
Start-Process -FilePath $outputPath1 -ArgumentList "/HWID" -Wait

# Delete the activator
Remove-Item -Path $outputPath1 -Force

#Office activator
$rawUrl2 = "https://raw.githubusercontent.com/massgravel/Microsoft-Activation-Scripts/refs/heads/master/MAS/Separate-Files-Version/Activators/Ohook_Activation_AIO.cmd"
$outputPath2 = "$env:TEMP\script.cmd"

#Download the activator
Invoke-WebRequest -Uri $rawUrl2 -OutFile $outputPath2

#Run the activator
Start-Process -FilePath $outputPath2 -ArgumentList "/Ohook" -Wait

# Delete the activator
Remove-Item -Path $outputPath2 -Force

Write-Output "Windows and Office successfully activated!"
# Note: Theese scripts are not mine, I just use them to activate Windows and Office. Also this is not the offical way to activate Windows and Office, so use it at your own risk. The scripts are from the Microsoft Activation Scripts repository on GitHub. To delete the installations, run the powershell script "irm https://get.activated.win | iex" or use the uninstallers buildt into the EclexOS installer which makes a shortcut ont the Desktop after install.
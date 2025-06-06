Invoke-WebRequest -Uri $DownloadUrl -OutFile $ZipFile -UseBasicParsing

Expand-Archive -Path $ZipFile -DestinationPath $TargetFolder -Force
$FirstCmdFile = "$TargetFolder\Microsoft-Activation-Scripts-master\MAS\Separate-Files-Version\Activators\HWID_Activation.cmd"
$SecondCmdFile = "$TargetFolder\Microsoft-Activation-Scripts-master\MAS\Separate-Files-Version\Activators\Ohook_Activation_AIO.cmd"

Start-Process -FilePath $FirstCmdFile -ArgumentList "/HWID" -Wait

Start-Process -FilePath $SecondCmdFile -ArgumentList "/Ohook" -Wait

Remove-Item -Path $TargetFolder -Recurse -Force

Write-Output "Windows and Office activated sucsessfully!"
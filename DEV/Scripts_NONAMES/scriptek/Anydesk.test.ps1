$ErrorActionPreference = 'Stop'
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32                 = 'https://download.anydesk.com/AnyDesk.msi'
$checksum32            = '9f32cda20cac7afab4bf2ecfd2b080cc4f1f700dff13566468da69059b7ebf03'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'MSI'
  softwareName  = 'AnyDesk MSI'
  validExitCodes= @(0, 3010, 1641)
}

$packageArgsInst = @{
  url           = $url32 
  checksum      = $checksum32
  checksumType  = 'sha256'
  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
}

Write-Host -ForegroundColor green "$packageName is being installed..."

# Telepítés Chocolateyval
Install-ChocolateyPackage @packageArgs @packageArgsInst

Write-Host -ForegroundColor green "$packageName telepítése sikeresen befejeződött!"
#Main problem: The hotkeys a failing to work smoothly and stably!

$FormatFactoryInstallerUrl = "https://en.softonic.com/download-launch?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkb3dubG9hZFR5cGUiOiJpbnRlcm5hbERvd25sb2FkIiwiZG93bmxvYWRVcmwiOiJodHRwczovL2dzZi1mbC5zb2Z0b25pYy5jb20vZDBlL2UyYy83MzA4YjYzM2NiNDJmNzY0NDQyODVlMWQ3NmUzNGQzZWRkL0ZGU2V0dXA1LjEyLjIuMC5leGU_RXhwaXJlcz0xNzQ0Nzg1NzkzJlNpZ25hdHVyZT1iZGU3ZDU3N2NlZDY3MzVkMDBkNTAxOWU4Y2Q5ZjU0Y2ZhOGE0N2YzJnVybD1odHRwczovL2Zvcm1hdC1mYWN0b3J5LXBvcnRhYmxlLmVuLnNvZnRvbmljLmNvbSZGaWxlbmFtZT1GRlNldHVwNS4xMi4yLjAuZXhlIiwiYXBwSWQiOiIwYzQ2ODQ5Yy05NmQxLTExZTYtYWE2My0wMDE2M2VjOWY1ZmEiLCJwbGF0Zm9ybUlkIjoid2luZG93cyIsImNhdGVnb3J5SWQiOiJ2aWRlbyIsImlhdCI6MTc0NDc0MjY0NCwiZXhwIjoxNzQ0NzQ2MjQ0fQ.dm61YYqD_mM-XlYh6ASltma8kVzHm8i2cLB3x-aQIy0"
$InstallerPath = "$env:TEMP\FFSetup5.12.2.0.exe"

# Letöltés
Invoke-WebRequest -Uri $FormatFactoryInstallerUrl -OutFile $InstallerPath

# Indítsa el a telepítőt (nem vár a lezárásra)
Start-Process -FilePath $InstallerPath
Start-Sleep -Seconds 20  # Várjon 5 másodpercet a telepítő megnyitásához

# Létrehozza a Windows Script Host objektumot
$wshell = New-Object -ComObject WScript.Shell

# Billentyűparancsok módosítása
$wshell.SendKeys("{TAB}")  # 1 TAB
$wshell.SendKeys("{ENTER}")
Start-Sleep -Seconds 2

$wshell.SendKeys("{TAB}")  # 1 TAB
$wshell.SendKeys("{ENTER}")
Start-Sleep -Seconds 2

$wshell.SendKeys("{TAB}")  # 1 TAB
$wshell.SendKeys("{ENTER}")
Start-Sleep -Seconds 2

$wshell.SendKeys("{TAB 4}")  # 4 TAB
$wshell.SendKeys("{ENTER}")
Start-Sleep -Seconds 2

$wshell.SendKeys("{TAB 4}")  # 4 TAB
$wshell.SendKeys("{ENTER}")
Start-Sleep -Seconds 2

Start-Sleep -Seconds 120  # Várjon 120 másodpercet

$wshell.SendKeys("{TAB 5}")
$wshell.SendKeys("{ENTER}")

Start-Sleep -Seconds 120  # Várjon 120 másodpercet

$wshell.SendKeys("{TAB}")
$wshell.SendKeys("{ENTER}")
$wshell.SendKeys("{TAB}")
$wshell.SendKeys("{ENTER}")

# Törli a telepítő fájlt
Remove-Item -Path $InstallerPath -Force

Write-Host "FormatFactory sikeresen telepítve és konfigurálva!"
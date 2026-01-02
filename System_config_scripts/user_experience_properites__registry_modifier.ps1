# Registry path
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection"

# If the registry doesn't exists it creates one
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Setting the AllowTelemetry registy to 0 (DWORD)
New-ItemProperty -Path $regPath -Name "AllowTelemetry" -PropertyType DWord -Value 0 -Force

Write-Output "AllowTelemetry beállítva 0-ra a következő kulcsban: $regPath"
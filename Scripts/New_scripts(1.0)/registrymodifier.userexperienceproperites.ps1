# Registry elérési út
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection"

# Ha nem létezik a kulcs, létrehozzuk
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Beállítjuk az AllowTelemetry értékét 0-ra (DWORD)
New-ItemProperty -Path $regPath -Name "AllowTelemetry" -PropertyType DWord -Value 0 -Force

Write-Output "AllowTelemetry beállítva 0-ra a következő kulcsban: $regPath"
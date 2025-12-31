# Giving the place of the registry key, what the "lockscreen.setup" script set before
$regKey = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\PersonalizationCSP"

# Check for the settings existence
if (Test-Path $regKey) {
    # Delete the settings
    Remove-ItemProperty -Path $regKey -Name "LockScreenImagePath" -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path $regKey -Name "LockScreenImageUrl" -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path $regKey -Name "LockScreenImageStatus" -ErrorAction SilentlyContinue

    # If there is nothing in it, the key will be deleted
    $remaining = Get-ItemProperty -Path $regKey
    if ($remaining.PSObject.Properties.Count -eq 0) {
        Remove-Item -Path $regKey -Force
    }

    Write-Host "A zárolási képernyő beállításai visszaállítva. A felhasználó újra módosíthatja a képet."
} else {
    Write-Warning "A registry kulcs nem található. Lehet, hogy már törölve lett."
}
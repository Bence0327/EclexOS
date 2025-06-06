winget install -e --id Discord.Discord --accept-package-agreements

# Bezárja a Discord folyamatot, ha elindult a telepítés után
Stop-Process -Name "Discord" -Force -ErrorAction SilentlyContinue
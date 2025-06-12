        # Install Discord
        & $exe install --id Discord.Discord --silent --accept-package-agreements --accept-source-agreements;

        # Verify Discord installation
        if (Verify-Installation -appId "Discord.Discord") {
            Stop-Process -Name "Discord" -Force -ErrorAction SilentlyContinue;
        } else {
            return;
        }

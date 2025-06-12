        # Install Anydesk
        & $exe install --id Anydesk.Anydesk --accept-package-agreements;

        # Verify Anydesk installation
        if (-not (Verify-Installation -appId "Anydesk.Anydesk")) {
            return;
        }
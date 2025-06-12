        # Install GIMP
        & $exe install --id=GIMP.GIMP.3 --silent;

        # Verify GIMP installation
        if (-not (Verify-Installation -appId "GIMP.GIMP.3")) {
            return;
        }
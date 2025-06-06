Start-Process powershell -ArgumentList "-NoProfile -ExecutionPolicy Bypass -Command iex '& { $(iwr -useb ''https://raw.githubusercontent.com/SpotX-Official/spotx-official.github.io/main/run.ps1'') } -confirm_uninstall_ms_spoti -confirm_spoti_recomended_over -podcasts_off -block_update_on -start_spoti -new_theme -adsections_off -lyrics_stat spotify'" -WindowStyle Hidden -Wait

# Ha az alkalmazás elindulna, bezárjuk
Stop-Process -Name "Spotify" -Force -ErrorAction SilentlyContinue
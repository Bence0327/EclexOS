# SpotX automatic insstaller script for Spotify
iex "& { $(iwr -useb 'https://raw.githubusercontent.com/SpotX-Official/spotx-official.github.io/main/run.ps1') } -confirm_uninstall_ms_spoti -confirm_spoti_recomended_over -podcasts_off -block_update_on -start_spoti -new_theme -adsections_off -lyrics_stat spotify"

# Closing Spotify
Stop-Process -Name "Spotify" -Force

Write-Host "Modded Spotify (Made by: SpotX) successfully installed!"
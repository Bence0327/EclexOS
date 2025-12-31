# --- WINGET CORE START ---
if( [System.Environment]::OSVersion.Version.Build -lt 26100 ) {
    'This script requires Windows 11 24H2 or later.' | Write-Warning;
    return;
}

$timeout = [datetime]::Now.AddMinutes(5);
$exe = "$env:LOCALAPPDATA\Microsoft\WindowsApps\winget.exe";

function Verify-Installation {
    param (
        [string]$appId,
        [int]$maxWaitTime = 300
    )

    $startTime = Get-Date
    while ((Get-Date).Subtract($startTime).TotalSeconds -lt $maxWaitTime) {
        $installed = winget list | Select-String -Pattern $appId
        if ($installed) {
            return $true
        }
        Start-Sleep -Seconds 5
    }
    return $false
}

while ($true) {
    if ($exe | Test-Path) { break }
    if ([datetime]::Now -gt $timeout) {
        'winget is not available in time.' | Write-Warning
        return
    }
    Start-Sleep -Seconds 1
}
# --- WINGET BASE END---

Write-Host "Docker is installing... please wait"
& $exe install --id Docker.DockerDesktop --silent --accept-package-agreements --accept-source-agreements

if (-not (Verify-Installation -appId "Docker Desktop")) {
    Write-Warning "Docker install failed. Maybe try rastartiong the computer andrunning the script again. If this error still shows up open a problem on the github page."
}

# Checking if docker is a valid promt so the script can use it
$dockercmd = "docker"

try {
    $null = & $dockercmd --version 2>$null
} catch {
    Write-Warning "The promt 'docker' cannot be found in this script. You may have to restart the shell or the computer."
    #It doesn't stop the script, but tells if there is a problem that will amy occur
}

# Docker folder creation in the Documents folder
$documentsPath = [Environment]::GetFolderPath('MyDocuments')
$dockerRoot = Join-Path $documentsPath "Docker"

if (-not (Test-Path $dockerRoot)) {
    Write-Host "Docker folder creating at: $dockerRoot"
    New-Item -Path $dockerRoot -ItemType Directory | Out-Null
} else {
    Write-Host "Docker folder already exists: $dockerRoot"
}

$composePath = Join-Path $dockerRoot "docker-compose.yml"

# If there is a compose file the script will ask about it's delete
if (Test-Path $composePath) {
    $overwrite = Read-Host "The program found a docker-compose.yl file. Overwrite? (y/n)"
    if ($overwrite -ne 'y') {
        Write-Host "Current compose file has been kept. The script will add aditional lines."
    } else {
        Remove-Item $composePath -Force
    }
}

# If there is no file, the script makes one
if (-not (Test-Path $composePath)) {
    @"
services:
"@ | Out-File -FilePath $composePath -Encoding UTF8
}

# The script gives you a little explanation
Write-Host ""
Write-Host "==== Short explanation about what is about to happen ===="
Write-Host ""
Write-Host ""
Write-Host "What is Docker?"
Write-Host ""
Write-Host ""
Write-Host "Docker is a software that helps you controll all of your server tools in one place. It uses contaniers which can be started, stopped or updated one by one. The contaniers only communicate with the base machine trough thew given ports(on network) and shared places(C:\Users\USERFOLDER\Documents\Docker\the given app)."
for ($i = 30; $i -gt 0; $i--) {
    Write-Host "Continue in $i second(s)"
    Start-Sleep -Seconds 1
}
Write-Host ""
Write-Host ""
Write-Host "Current avaiable automated setups for Docker:"
Write-Host ""
Write-Host ""
Write-Host " - Jellyfin: self hosted, completely free and open source mediaserver which can be used to watch Movies, Series, or pictures from you own machine. If installed, it will be reachable at port 8096 (http://localhost:8096 OR http://SERVERIP:8096)."
Write-Host ""
Write-Host ""
Write-Host " - Plex: half-self hosted mediaserver which can be used to watch Movies, Series, or pictures from you own machine. It's easier to set up then Jellyfin, but limits your ability to set up things if you don't pay. If installed, it will be reachable at port 32400 (http://localhost:32400 OR http://SERVERIP:32400)."
Write-Host ""
Write-Host ""
Write-Host " - Remotely: self hosted, open source remote destop and script running aplications. For more info check https://github.com/immense/Remotely. If installed, it will be reachable at port 8081 (http://localhost:8081 OR http://SERVERIP:8081)"
Write-Host ""
Write-Host ""
Write-Host " - Nextcloud: self hosted cloud service. Can be used for a lot of things (recipies, notes, pictures, file sharing, handling email(not hosting), messages, video meeting, office(similar to MS Sharepoint, requires quite a lot power)). If used with a reverse proxy, it can be used as a self hosted alternative for Icloud, Google Drive or OneDrive.  If installed, it will be reachable at port 8080 (http://localhost:8080 OR http://SERVERIP:8096)"
Write-Host ""
Write-Host ""
Write-Host " - qBittorrent (webUI): self hosted torrent client. If installed, it will be reachable at port 8083 (http://localhost:8083 OR http://SERVERIP:8083)"
Write-Host ""
Write-Host ""
Write-Host " - Stirling PDF: Self hosted pdf tools, similar to PDF24. If installed, it will be reachable at port 8082 (http://localhost:8082 OR http://SERVERIP:8083)"
Write-Host ""
Write-Host ""
Write-Host " - Caddy: reverse proxy / webserver. If configured, it can host a website for you and you can reach all of the apps above from anywhere. Requires more than just some config, i would recoend reading about it or watching a tutorial video like: <YTLINK>"
Write-Host ""

#Books so this services can be opened after installation
$enableJellyfin    = $false
$enablePlex        = $false
$enableRemotely    = $false
$enableNextcloud   = $false
$enableQbittorrent = $false
$enableStirling    = $false
$enableCaddy       = $false

# Helper for creating subfolder for each app
function Ensure-ServiceFolder {
    param(
        [string]$serviceName
    )
    $path = Join-Path $dockerRoot $serviceName
    if (-not (Test-Path $path)) {
        New-Item -Path $path -ItemType Directory | Out-Null
    }
    return $path
}

# Helper: blokkok hozzáfűzése a compose fájlhoz
function Append-ToCompose {
    param(
        [string]$content
    )
    Add-Content -Path $composePath -Value $content
}

# --- JELLYFIN INSTALLER ---
Write-Host ""
Write-Host ""
$jellyfinAnswer = Read-Host "Do you want to install Jellyfin (free mediaserver)? (y/n)"
if ($jellyfinAnswer -eq 'y') {
    $enableJellyfin = $true
    $jellyfinFolder = Ensure-ServiceFolder -serviceName "Jellyfin"

    $jellyfinBlock = @"
  jellyfin:
    image: jellyfin/jellyfin
    container_name: jellyfin
    ports:
      - "8096:8096"
    volumes:
      - "$jellyfinFolder/config:/config"
      - "$jellyfinFolder/cache:/cache"
      - "$jellyfinFolder/media:/media"
    restart: unless-stopped

"@
    Append-ToCompose -content $jellyfinBlock
}

# --- PLEX INSTALLER ---
Write-Host ""
Write-Host ""
$plexAnswer = Read-Host "Do you want to install Plex (beginner friendly mediaserver)? (y/n)"
if ($plexAnswer -eq 'y') {
    $enablePlex = $true
    $plexFolder = Ensure-ServiceFolder -serviceName "Plex"

    $plexBlock = @"
  plex:
    image: plexinc/pms-docker
    container_name: plex
    network_mode: host
    environment:
      - PLEX_CLAIM=
    volumes:
      - "$plexFolder/config:/config"
      - "$plexFolder/transcode:/transcode"
      - "$plexFolder/media:/data"
    restart: unless-stopped

"@
    Append-ToCompose -content $plexBlock
}

# --- REMOTELY INSTALLER ---
Write-Host ""
Write-Host ""
$remotelyAnswer = Read-Host "Do you want to install Remotely (Remote desktop and script management)? (y/n)"
if ($remotelyAnswer -eq 'y') {
    $enableRemotely = $true
    $remotelyFolder = Ensure-ServiceFolder -serviceName "Remotely"

    $remotelyBlock = @"
  remotely:
    image: translucency/remotely
    container_name: remotely
    ports:
      - "8081:5000"
    volumes:
      - "$remotelyFolder/data:/app/Data"
    restart: unless-stopped

"@
    Append-ToCompose -content $remotelyBlock
}

# --- NEXTCLOUD INSTALLER ---
Write-Host ""
Write-Host ""
$nextcloudAnswer = Read-Host "Do you want to install Nextcloud (self hosted cloud service)? (y/n)"
if ($nextcloudAnswer -eq 'y') {
    $enableNextcloud = $true
    $nextcloudFolder = Ensure-ServiceFolder -serviceName "Nextcloud"

    $nextcloudBlock = @"
  nextcloud:
    image: nextcloud
    container_name: nextcloud
    ports:
      - "8080:80"
    volumes:
      - "$nextcloudFolder/html:/var/www/html"
    restart: unless-stopped

"@
    Append-ToCompose -content $nextcloudBlock
}

# --- QBITTORRENT INSTALLER ---
Write-Host ""
Write-Host ""
$qbAnswer = Read-Host "Do you want to install Qbittorrent (torrent client with webUI)?? (y/n)"
if ($qbAnswer -eq 'y') {
    $enableQbittorrent = $true
    $qbFolder = Ensure-ServiceFolder -serviceName "qBittorrent"

    $qbBlock = @"
  qbittorrent:
    image: lscr.io/linuxserver/qbittorrent:latest
    container_name: qbittorrent
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Europe/Budapest
      - WEBUI_PORT=8083
    volumes:
      - "$qbFolder/config:/config"
      - "$qbFolder/downloads:/downloads"
    ports:
      - "8083:8083"
    restart: unless-stopped

"@
    Append-ToCompose -content $qbBlock
}

# --- STIRLING PDF INSTALLER ---
Write-Host ""
Write-Host ""
$stirlingAnswer = Read-Host "Do you want to install Striling PDF (pdf tools)? (y/n)"
if ($stirlingAnswer -eq 'y') {
    $enableStirling = $true
    $stirlingFolder = Ensure-ServiceFolder -serviceName "StirlingPDF"

    $stirlingBlock = @"
  stirlingpdf:
    image: stirlingtools/stirling-pdf
    container_name: stirlingpdf
    ports:
      - "8082:8080"
    volumes:
      - "$stirlingFolder/config:/configs"
      - "$stirlingFolder/data:/usr/share/tesseract-ocr/4.00/tessdata"
    restart: unless-stopped

"@
    Append-ToCompose -content $stirlingBlock
}

# --- CADDY INSTALLER ---
Write-Host ""
Write-Host ""
$caddyAnswer = Read-Host "Do you want to install Caddy (reverse proxy)? (y/n)"
if ($caddyAnswer -eq 'y') {
    $enableCaddy = $true
    $caddyFolder = Ensure-ServiceFolder -serviceName "Caddy"
    $caddyfilePath = Join-Path $caddyFolder "Caddyfile"

    if (-not (Test-Path $caddyfilePath)) {
        @"
# If you want, you can write your caddyfile here. Won't be executed if left empty.
# Például:
# jellyfin.yourdomain.hu {
#   reverse_proxy host.docker.internal:8096
# }

"@ | Out-File -FilePath $caddyfilePath -Encoding UTF8
    }

    $caddyBlock = @"
  caddy:
    image: caddy
    container_name: caddy
    ports:
      - "80:80"
      - "443:443"
    volumes:
      - "$caddyFolder/Caddyfile:/etc/caddy/Caddyfile"
      - "$caddyFolder/data:/data"
      - "$caddyFolder/config:/config"
    restart: unless-stopped

"@
    Append-ToCompose -content $caddyBlock
}

# Creating volumes section if it doesn't exist
$composeContent = Get-Content $composePath -Raw
if ($composeContent -notmatch "volumes:") {
    Add-Content -Path $composePath -Value @"

volumes:
"@
}

Write-Host ""
Write-Host "docker-compose.yml created: $composePath"
Write-Host "The script will try to start the installed services with: docker compose up -d"
Write-Host "If the script writed out before the the prompt "docker" is missing, this part will give and error. Restart the computer and type in "docker compose up -d" by yourself in a Powershell windows which runs in Admin mode."
Write-Host ""

try {
    Push-Location $dockerRoot
    & $dockercmd compose up -d
    Pop-Location
} catch {
    Write-Warning "Couldn't execute the part "docker compose up -d" as writed before, restart the computer and type in "docker compose up -d" by yourself in a Powershell windows which runs in Admin mode."
}

# Opening the installed apps in a browser
Write-Host ""
Write-Host "Opening installed apps in browser... if the script "docker compose up -d" haven't run, it won't show anything. After starting the services manually, you can access them in your browser by the links given above."

# Opening Jellyfin
if ($enableJellyfin) {
    Start-Process "http://localhost:8096"
}

# Opening PLex
if ($enablePlex) {
    Start-Process "http://localhost:32400"
}

# Opening Nextcloud
if ($enableNextcloud) {
    Start-Process "http://localhost:8080"
}

# Opening remotely
if ($enableRemotely) {
    Start-Process "http://localhost:8081"
}

# Opening Stirling pdf 
if ($enableStirling) {
    Start-Process "http://localhost:8082"
}

# Opening Qbittorent
if ($enableQbittorrent) {
    Start-Process "http://localhost:8083"
}


Write-Host ""
Write-Host "Installation complete. The choosen services (if the script "docker compose up -d" ran) can be reached at the given links above."
for ($i = 30; $i -gt 0; $i--) {
    Write-Host "Exiting in $i second(s)"
    Start-Sleep -Seconds 1
}
Write-Host ""
Write-Host "Exiting"
Start-Sleep -Seconds 5
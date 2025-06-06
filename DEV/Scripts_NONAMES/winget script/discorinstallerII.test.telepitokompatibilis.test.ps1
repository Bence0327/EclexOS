if( [System.Environment]::OSVersion.Version.Build -lt 26100 ) {
    'This script requires Windows 11 24H2 or later.' | Write-Warning;
    return;
}

$timeout = [datetime]::Now.AddMinutes(5);
$exe = "$env:LOCALAPPDATA\Microsoft\WindowsApps\winget.exe";

while( $true ) {
    if( $exe | Test-Path ) {
        # Install Discord silently and accept agreements
        & $exe install --id Discord.Discord --silent --accept-package-agreements --accept-source-agreements;
        
        # Kill Discord if it starts after installation
        Stop-Process -Name "Discord" -Force -ErrorAction SilentlyContinue;
        
        return;
    }
    
    if( [datetime]::Now -gt $timeout ) {
        'File {0} does not exist.' -f $exe | Write-Warning;
        return;
    }
    
    Start-Sleep -Seconds 1;
}
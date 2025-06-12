if( [System.Environment]::OSVersion.Version.Build -lt 26100 ) {
    'This script requires Windows 11 24H2 or later.' | Write-Warning;
    return;
}

$timeout = [datetime]::Now.AddMinutes(5);
$exe = "$env:LOCALAPPDATA\Microsoft\WindowsApps\winget.exe";

while( $true ) {
    if( $exe | Test-Path ) {
        # Put the winget commands here. Also you should add checking scripts, but it's not necessary. You can ind some scripts in the Scripts\Winget scripts folder.
        #Make sure you add "--accept-source-agreements" to the end of the first command, so you can install the packages using winget effortlessly.
        #                   Example:  
        # & $exe install --id [ID] --accept-package-agreements;
        #  if (-not (Verify-Installation -appId "[ID]")) {
        #     return;
        # }
        return;
    }
    
    if( [datetime]::Now -gt $timeout ) {
        'File {0} does not exist.' -f $exe | Write-Warning;
        return;
    }
    
    Start-Sleep -Seconds 1;
}
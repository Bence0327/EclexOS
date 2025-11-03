# Check if "DiagTrack" (Connected user experienced and telemetry properties) exist and turned on
$serviceName = "DiagTrack"
$service = Get-Service -Name $serviceName -ErrorAction SilentlyContinue

if ($service) {
    # If it runs, then turn off
    if ($service.Status -eq "Running") {
        Stop-Service -Name $serviceName -Force
    }

    # Turn off automatic start
    Set-Service -Name $serviceName -StartupType Disabled

    Write-Output "DiagTrack has been turned off and blocked."
} else {
    Write-Output "Cant find DiagTrack turned on on this device."
}
# Külső meghajtók keresése
$volumes = Get-PSDrive -PSProvider FileSystem | Where-Object { $_.Root -ne "$env:SystemDrive\" }

foreach ($volume in $volumes) {
    $source = "$($volume.Root)start2.bin"
    if (Test-Path $source) {
        $target = "$env:LOCALAPPDATA\Packages\Microsoft.Windows.StartMenuExperienceHost_cw5n1h2txyewy\LocalState\start2.bin"
        Copy-Item $source -Destination $target -Force
        break
    }
}
# The only way I can do this this is to make a bin file, but I quess it doesn't work with every computer so i don't use it

# Searching in pendrives for the .bin file
$volumes = Get-PSDrive -PSProvider FileSystem | Where-Object { $_.Root -ne "$env:SystemDrive\" }

# Copy the bin file into the folder
foreach ($volume in $volumes) {
    $source = "$($volume.Root)start2.bin"
    if (Test-Path $source) {
        $target = "$env:LOCALAPPDATA\Packages\Microsoft.Windows.StartMenuExperienceHost_cw5n1h2txyewy\LocalState\start2.bin"
        Copy-Item $source -Destination $target -Force
        break
    }
}
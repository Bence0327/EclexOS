# Ultimate powerplan's code
$highPerfGuid = "8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c"

# setting the powerplan
powercfg /setactive $highPerfGuid

# System type
$systemType = (Get-WmiObject -Class Win32_ComputerSystem).PCSystemType

# PCSystemType values:
# 1 = Desktop PC
# 2 = Laptop

#Check the type of the PC and modify 
if ($systemType -eq 1) {
    Write-Host "Desktop PC detected - turning off sleep mode."
    powercfg /change standby-timeout-ac 0
    powercfg /change standby-timeout-dc 0
} elseif ($systemType -eq 2) {
    Write-Host "Laptop detected - turning off sleep mode when the laptop is chraging."
    powercfg /change standby-timeout-ac 0
    # Working from baterry will still enable sleep mode 
} else {
    Write-Host "Can't detect the computer type - the script won'd do any changes."
}

Write-Host "Powerplans has been modified."
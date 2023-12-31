$RegKey = Get-ItemProperty -Path "HKLM:\Software\TCPIT" -Name "Google Chrome"
$AppVersion = "119.0.6045.200"

#Bit of trickery here to convert the version number into an integer for proper number comparison
$ActualVersion = $RegKey."Google Chrome".Replace(".","")
$ActualVersionInt = [int64]$ActualVersion

[int64]$DesiredVersionInt = $AppVersion.Replace(".","")

if($ActualVersionInt -lt $DesiredVersionInt) {
    Write-Output "Not Installed"
    Exit 1
}
else {
    Write-Host "Application detected. Exiting."
    Exit 0
}

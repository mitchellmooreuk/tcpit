<# 
	Name: DetectionScript_SSMS
	Purpose: Detects if SSMS is installed
#>

$RegKey=[PSCustomObject]@{
	Path = "HKLM:\Software\TCPIT"
	Name = "SSMS"
	Value = "19.3"
}

$InstalledVersion = $RegKey.Value.Replace(".","")
$InstalledVersionInt = [Int64]$InstalledVersion
$DesiredVersion = 193

If ($InstalledVersion -lt $DesiredVersion) {
	Write-Output "The installed version number is less than the desired version number! Exiting with status code 1."
	Exit 1
}
else {
	Write-Output "The installed version number is either equal to or greater than the desired version number! Exiting with status code 0". 
	Exit 0
}
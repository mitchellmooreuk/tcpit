<#
	TCP/IT - 14/01/2024 21:57
	
	Name: SSMS_InstallScript.ps1
	Purpose: Installs SSMS
	Notes: Does not install Azure Data Studio.
#>

$RegKey=[PSCustomObject]@{
	Path = "HKLM:\Software\TCPIT"
	Name = "SSMS"
	Value = "19.3"
}

Function AddRegKey {
	Try {
		# Try adding the RegKey
		New-ItemProperty -Path $RegKey.Path -Name $RegKey.Name -Value $RegKey.Value -ErrorAction Stop
	}
	Catch {
		# If the RegKey can't be added, likely due to it already existing, delete the current entry and re-create it.
		Remove-ItemProperty -Path $RegKey.Path -Name $RegKey.Name
		New-ItemProperty -Path $RegKey.Path -Name $RegKey.Name -Value $RegKey.Value
	}
}
AddRegKey

Function Install {
	# Using Start-Process 
	Start-Process -FilePath "SSMS-Setup-ENU.exe" -ArgumentList "/install", "DoNotInstallAzureDataStudio=1", "/quiet", "/norestart" -Wait
	Write-Output "SSMS Setup Exited - Install function exiting..."
}
Install

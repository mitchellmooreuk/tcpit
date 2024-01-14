<#
	Name: UninstallScript_SSMS
	Purpose: Uninstalls SSMS
#> 

$RegKey=[PSCustomObject]@{
	Path = "HKLM:\Software\TCPIT"
	Name = "SSMS"
	Value = "19.3"
}


Function RemoveRegKey {
	Try {
		Remove-ItemProperty -Path $RegKey.Path -Name $RegKey.Name -ErrorAction Stop
		Write-Output "RegKey Removed!"
	}
	Catch {
		Write-Output "Failed to remove reg key. Likely did not exist in the first place."
	}
}
RemoveRegKey

Function Uninstall {
	Start-Process -FilePath "SSMS-Setup-ENU.exe" -ArgumentList "/uninstall", "/quiet", "/norestart" -Wait
	Write-Output "SSMS Setup Exited - Uninstall function exiting..."
}
Uninstall
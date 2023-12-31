$RegKey="HKLM:\Software\TCPIT"
$StringValue=[PSCustomObject]@{
    Name = "Google Chrome"
    Version = "119.0.6045.200"
}

Function InstallRegKey {
    if (Test-Path $RegKey) {

    }
    else {
        New-Item -Path $RegKey
    }
    New-ItemProperty -Path $RegKey -Name $StringValue.Name -Value $StringValue.Version -ErrorAction SilentlyContinue
}
InstallRegKey

Function Install {
	& $env:WINDIR\system32\msiexec.exe /i "GoogleChromeStandaloneEnterprise64.msi" /quiet; 
    	start-sleep 60;
	Write-Output "Chrome Installed"
	Exit 0;
}
Install

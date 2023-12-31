$RegKey="HKLM:\Software\TCPIT"
$StringValue=[PSCustomObject]@{
    Name = "Google Chrome"
    Version = "119.0.6045.200"
}

$AppInstance = Get-WmiObject -Class Win32_Product | Where-Object -Filter {$_.Name -Like "*Google Chrome*"}
$Msi = $AppInstance.IdentifyingNumber

Function RemoveRegKey {
    if (Test-Path $RegKey) {
        Remove-ItemProperty -Path $RegKey -Name $StringValue.Name
    }
    else {
    }
}
RemoveRegKey

Function Uninstall {	
    & $env:WINDIR\system32\msiexec.exe /x "$Msi" /quiet;
    Start-Sleep 5;
}
Uninstall

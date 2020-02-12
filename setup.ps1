Set-ExecutionPolicy Bypass -Scope Process -Force

#Install Chocolatey
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

#Assign Packages to Install
$Packages = 'visualstudiocode', 'docker-desktop'

#Install Packages
ForEach ($PackageName in $Packages)
{choco install $PackageName -y}

Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
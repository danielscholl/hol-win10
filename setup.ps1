Set-ExecutionPolicy Bypass -Scope Process -Force


#Install Chocolatey
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

#Assign Packages to Install
$Packages = 'visualstudiocode', 'docker-desktop', 'postman'

# choco install wsl-debiangnulinux

#Install Packages
ForEach ($PackageName in $Packages)
{choco install $PackageName -y}

Add-LocalGroupMember -Group "docker-users" -Member "azureuser"

#Reboot
Restart-Computer
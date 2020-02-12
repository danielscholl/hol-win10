# Ensure Local User added to Docker group
Add-LocalGroupMember -Group "docker-users" -Member $env:UserName

#Assign Packages to Install
$Packages = 'postman', 'wsl-ubuntu-1804'

#Install Packages
ForEach ($PackageName in $Packages)
{choco install $PackageName -y}

#Reboot
Restart-Computer
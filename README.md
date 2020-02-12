# Hands-On-Lab Windows 10 Machine


__Create a Lab Machine:__

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fdanielscholl%2Fhol-win10%2Fmaster%2Fazuredeploy.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>

> RDP to the Lab Virtual Machine for the remaining Instructions

---------------------------------------------------------------

Open an RDP Session to the Lab Virtual Machine then download and execute the setup script.

__Setup the Lab Workstation:__

Execute the following commands at a Powershell (Administrator) prompt.
```powershell
Add-LocalGroupMember -Group "docker-users" -Member $env:UserName
```

Using the store install Ubuntu or Debian

__Setup WSL:__

Execute the following commands at a bash prompt.
```bash
sudo apt update
sudo apt install curl
curl https://raw.githubusercontent.com/danielscholl/hol-win10/master/setup.sh | sudo bash
```
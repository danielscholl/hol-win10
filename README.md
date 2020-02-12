# Hands-On-Lab Windows 10 Machine


__Create a Lab Machine:__

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fdanielscholl%2Fhol-win10%2Fmaster%2Fazuredeploy.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>

> RDP to the Lab Virtual Machine for the remaining Instructions

---------------------------------------------------------------

Open an RDP Session to the Lab Virtual Machine then download and execute the setup script.

__Setup the Lab Workstation:__

```powershell
curl https://raw.githubusercontent.com/danielscholl/hol-win10/master/install.ps1 -o install.ps1
powershell -Command "Start-Process install.ps1"
```

__Setup WSL:__

```bash
curl https://raw.githubusercontent.com/danielscholl/hol-win10/master/setup.sh | bash
```
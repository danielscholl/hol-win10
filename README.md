# Hands-On-Lab Windows 10 Machine


__Create a Lab Machine:__

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fdanielscholl%2Fhol-win10%2Fmaster%2Fazuredeploy.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>

> RDP to the Lab Virtual Machine for the remaining Instructions

---------------------------------------------------------------

Open an RDP Session to the Lab Virtual Machine then download and execute the setup script.

__Setup the Lab Server:__

```powershell
curl https://raw.githubusercontent.com/danielscholl/hol-bcdr/master/setup.ps1 -o setup.ps1
powershell -Command "Start-Process setup.ps1"
```
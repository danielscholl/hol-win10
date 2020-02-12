# Hands-On-Lab Windows 10 Machine


__Create a Lab Machine:__

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fdanielscholl%2Fhol-win10%2Fmaster%2Fazuredeploy.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>

> RDP to the Lab Virtual Machine for the remaining Instructions

---------------------------------------------------------------

Open an RDP Session to the Lab Virtual Machine then download and execute the setup script.

__Setup the Lab Workstation:__

1. Start Docker-Desktop
2. If the default user was changed add the user to the group
    `Add-LocalGroupMember -Group "docker-users" -Member $env:UserName`
3. Install Postman
    `choco install postman`
3. Enable WSL Windows Feature  (Requires Reboot)
    `Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux`
4. Using the Store Install Debian and execute the following commands from the bash prompt.
    ```bash
    sudo apt update
    sudo apt install curl
    curl https://raw.githubusercontent.com/danielscholl/hol-win10/master/setup.sh | sudo bash
    ```

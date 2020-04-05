# Windows 10 Developer Machine


__Create a Lab Machine:__

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fdanielscholl%2Fhol-win10%2Fmaster%2Fazuredeploy.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>

> RDP to the Lab Virtual Machine for the remaining Instructions

---------------------------------------------------------------

Open an RDP Session to the Lab Virtual Machine then download and execute the setup script.

__Setup the Lab Workstation:__

- Install Windows Terminal

    `choco install microsoft-windows-terminal`
    
- Install Postman  

    `choco install postman`

- Start Docker-Desktop  

   - If the default user was changed add the user to the group  
   
        `Add-LocalGroupMember -Group "docker-users" -Member $env:UserName`
    
   - In Docker Settings enable the following settings.  

        1. Start Docker Desktop when you login  
        2. Expose Daemon on tcp://localhost:2375 without TLS. 

- Using the Store Install Debian and execute the following commands from the bash prompt.
    ```bash
    sudo apt update
    sudo apt install curl
    curl https://raw.githubusercontent.com/danielscholl/hol-win10/master/setup.sh | sudo bash
    
    # Modify the bashrc file
    echo "export PATH="$PATH:$HOME/.local/bin" >> ~/.bashrc
    echo "export DOCKER_HOST=tcp://localhost:2375" >> ~/.bashrc
    ```

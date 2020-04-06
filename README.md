# Windows 10 Developer Machine


__Create a Lab Machine:__

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fdanielscholl%2Fhol-win10%2Fmaster%2Fazuredeploy.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>

> RDP to the Lab Virtual Machine for the remaining Instructions

---------------------------------------------------------------

Open an RDP Session to the Lab Virtual Machine then download and execute the setup script.

__Setup the Lab Workstation:__


- Start Docker-Desktop  

   - If the default user was changed add the user to the group  
   
        `Add-LocalGroupMember -Group "docker-users" -Member $env:UserName`
    
   - In Docker Settings enable the following settings.  

        1. Start Docker Desktop when you login  
        2. Expose Daemon on tcp://localhost:2375 without TLS. 


- Install and configure Terminal

    - Using the Shortcut on the Desktop Install Windows Terminal

    - Execute the following commands in Powershell core.

        ```
        Install-Module posh-git -Scope CurrentUser
        Install-Module oh-my-posh -Scope CurrentUser

        notepad $PROFILE
        ```

    - Add the following to the profile

        ```
            Import-Module posh-git
            Import-Module oh-my-posh
            Set-Theme Paradox
        ```

- Install and configure WSL

    - Using the Shortcut on the Desktop Install Ubuntu

    - Execute the following commands from the bash prompt.

        ```bash
        sudo apt update
        sudo apt install curl
        curl https://raw.githubusercontent.com/danielscholl/hol-win10/master/setup.sh | sudo bash
    
        ```

    - Install terraform tfenv

        ```bash
        git clone https://github.com/tfutils/tfenv.git ~/.tfenv
        ln -s ~/.tfenv/bin/* ~/.local/bin
        ```

    - Install golang using g

        ```bash
        curl -sSL https://git.io/g-install | sh -s
        ```

    - Setup Prompt

        ```bash
        go get -u github.com/justjanne/powerline-go

        # Add the following to bash prompt
        function _update_ps1() {
            PS1="$($GOPATH/bin/powerline-go -error $?)"
        }
        if [ "$TERM" != "linux" ] && [ -f "$GOPATH/bin/powerline-go" ]; then
            PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
        fi
        ```

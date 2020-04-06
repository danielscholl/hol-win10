# Windows 10 Developer Machine


__Create a Lab Machine:__ _(30 Minutes)_



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

- Install Cascadia Font and set as VSCode default.

  ```bash
    # VSCode settings.json
    {
      "editor.fontFamily": "'Cascadia Code', Consolas, 'Courier New', monospace",
      "editor.fontLigatures": true,
    }
  ```

- Install and configure Terminal

    - Using the Shortcut on the Desktop Install Windows Terminal

    - Install Cascadia Font and configure Windows Terminal to use it.

      ```json
        {
          "profiles": {
            "list": [
              {
                // Make changes here to the powershell.exe profile
                "guid": "{61c54bbd-c2c6-5271-96e7-009a87ff44bf}",
                "name": "Windows PowerShell",
                "fontFace":  "Cascadia Code PL",
                "commandline": "powershell.exe",
                "hidden": false
              },
              {
                  "guid": "{574e775e-4f2a-5b96-ac1e-a2962a402336}",
                  "hidden": false,
                  "name": "PowerShell",
                  "fontFace":  "Cascadia Code PL",
                  "source": "Windows.Terminal.PowershellCore"
              }
            ]
          }
      ```

    - Configure Powershell Prompt to use Posh Git with a paradox theme.

        ```powershell
        Install-Module posh-git -Scope CurrentUser
        Install-Module oh-my-posh -Scope CurrentUser

        # Set Execution Policy to allow Profile
        Set-ExecutionPolicy -ExecutionPolicy Unrestricted

        notepad $PROFILE

        # Add the following to the profile
        Import-Module posh-git
        Import-Module oh-my-posh
        Set-Theme Paradox
        ```


- Install and configure WSL

  - Using the Shortcut on the Desktop Install Ubuntu

  - Configure Windows Terminal for Ubuntu

    ```json
      {
        "profiles": {
          "list": [
            {
              "guid": "{c6eaf9f4-32a7-5fdc-b5cf-066e8a4b1e40}",
              "hidden": false,
              "name": "Ubuntu-18.04",
              "source": "Windows.Terminal.Wsl",
              "colorScheme": "UbuntuLegit",
              "fontFace": "Cascadia Code PL",
              "startingDirectory" : "//wsl$/Ubuntu-18.04/home/azureuser"
            }
          ]
        },
        "schemes": [
          {
            "name" : "UbuntuLegit",
            "background" : "#2C001E",
            "black" : "#4E9A06",
            "blue" : "#3465A4",
            "brightBlack" : "#555753",
            "brightBlue" : "#729FCF",
            "brightCyan" : "#34E2E2",
            "brightGreen" : "#8AE234",
            "brightPurple" : "#AD7FA8",
            "brightRed" : "#EF2929",
            "brightWhite" : "#EEEEEE",
            "brightYellow" : "#FCE94F",
            "cyan" : "#06989A",
            "foreground" : "#EEEEEE",
            "green" : "#300A24",
            "purple" : "#75507B",
            "red" : "#CC0000",
            "white" : "#D3D7CF",
            "yellow" : "#C4A000"
          }
        ]
      }
    ```

  - Configure Ubuntu with default tools.

    ```bash
    sudo apt update
    sudo apt install curl
    curl https://raw.githubusercontent.com/danielscholl/hol-win10/master/setup.sh | sudo bash
    ```

  - Install terraform tfenv

    ```bash
    git clone https://github.com/tfutils/tfenv.git ~/.tfenv
    ln -s ~/.tfenv/bin/* ~/.local/bin

    tfenv install 0.12.24
    tfenv use 0.12.24
    ```

  - Install golang using g
    > Do not install the latest version of golang

    ```bash
    curl -sSL https://git.io/g-install | sh -s

    g install 1.12.5
    ```

  - Setup a Powerline go Prompt

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

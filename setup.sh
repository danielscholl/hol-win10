sudo apt update
sudo apt install -y software-properties-common python3 python3-venv python3-pip
apt-get install -y ca-certificates curl apt-transport-https lsb-release gnupg
sudo apt install -y vim git wget unzip direnv

# Download and install the Microsoft signing key
curl -sL https://packages.microsoft.com/keys/microsoft.asc |
    gpg --dearmor |
    sudo tee /etc/apt/trusted.gpg.d/microsoft.asc.gpg > /dev/null

# Add the Azure CLI software repository
AZ_REPO=$(lsb_release -cs)
echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" |
    sudo tee /etc/apt/sources.list.d/azure-cli.list

# Update repository information and install the azure-cli package
apt-get update
apt-get install azure-cli -y

# Install Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo curl -L "https://github.com/docker/compose/releases/download/1.25.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
echo 'export PATH=$PATH:$HOME/.local/bin' >> ~/.bashrc
echo 'export DOCKER_HOST=tcp://localhost:2375' >> ~/.bashrc

# Install Java
wget -qO - https://adoptopenjdk.jfrog.io/adoptopenjdk/api/gpg/key/public | sudo apt-key add -
sudo add-apt-repository --yes https://adoptopenjdk.jfrog.io/adoptopenjdk/deb/
sudo apt update
sudo apt install adoptopenjdk-8-hotspot  # Java 8 / HotSpot VM

mkdir -p ~/.local/bin

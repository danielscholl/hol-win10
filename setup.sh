sudo apt-get install vim
sudo apt-get install git
sudo apt-get install python3 python3-venv python3-pip
sudo apt-get install curl
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo curl -L "https://github.com/docker/compose/releases/download/1.25.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose 
echo "export DOCKER_HOST=tcp://localhost:2375" >> ~/.bashrc
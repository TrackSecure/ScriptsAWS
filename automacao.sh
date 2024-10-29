#!/bin/bash
which python3 | grep /usr/bin/python3 # Verificando instalação do Python

# Instalação das bibliotecas do Python
sudo apt update && sudo apt upgrade -y
sudo apt install python3-pip -y
sudo apt install python3-venv
python3 -m venv amb
source amb/bin/activate
pip install psutil
pip install boto3
wget https://github.com/TrackSecure/Dev_Python/raw/refs/heads/main/teste_json.py
deactivate

# Configuração do Docker
# adicionando as chaves GPG (GNU Privacy Guard) do docker
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# adicionando o repositório do docker como fontes do APT
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

#instalando as últimas versões
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

# adicionando o usuário no grupo docker para não precisar mais do sudo
sudo usermod -aG docker $USER
newgrp docker

sudo systemctl
start docker
sudo systemctl enable docker
docker pull mysql:8.0.37
docker run -d -p 3306:3306 --name db -e "MYSQL_ROOT_PASSWORD=tracksecure" mysql:8.0.37

# Instalação do Node.js
sudo apt install nodejs
sudo apt install npm

# Configuração da aplicação Node
git clone https://github.com/TrackSecure/Development
cd /Site
npm install
npm start

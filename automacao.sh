#!/bin/bash

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

# Iniciando o Docker
sudo systemctl start docker
sudo systemctl enable docker

# Levantando serviços de banco de dados e site com Docker Compose
wget https://github.com/TrackSecure/ScriptsAWS/raw/refs/heads/main/compose.yaml
sudo docker compose up --detach

# Executando o script de monitoramento de uptime/downtime
sudo apt update && sudo apt upgrade -y
sudo apt install python3-pip -y
sudo apt install python3-venv -y
python3 -m venv amb
source amb/bin/activate
pip install mysql-connector-python
wget https://github.com/TrackSecure/Dev_Python/raw/refs/heads/main/uptime_downtime.py
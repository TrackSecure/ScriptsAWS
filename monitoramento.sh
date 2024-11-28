#!/bin/bash
# Instalação das bibliotecas do Python
sudo apt update && sudo apt upgrade -y
sudo apt install python3-pip -y
sudo apt install python3-venv -y
python3 -m venv amb
source amb/bin/activate
pip install atlassian-python-api
pip install mysql-connector-python
pip install psutil
pip install boto3
pip install getmac
wget https://github.com/TrackSecure/Dev_Python/raw/refs/heads/main/monitoramento.py

#!/bin/bash
# Script para instalação dos containers básicos para Streaming com utilização do PGBlitz com cache VFS FULL

echo "Atualizando pacotes"
sudo apt update -y && sudo apt dist-upgrade -y
echo
sleep 1

echo "Instalando programas necessários"
echo
sudo apt-get install htop bmon screenfetch zsh curl git tmux screen zip unzip curl unionfs-fuse fuse nano -y
echo
sleep 1

echo "Configurando o Time Zone e idioma!"
echo
sudo dpkg-reconfigure tzdata && sudo dpkg-reconfigure locales
echo
sleep 1

echo "Instalando o Docker"
echo
sudo curl -fsSl https://get.docker.com | bash
echo
sleep 1

echo "Instalando o Docker Compose"
echo
sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
echo
sleep 1

echo "Copiando o arquivo docker-compose"
echo
cp docker-compose.yml ~/
echo
sleep 1

echo "Subindo os containers"
echo
cd ~/
sudo docker-compose up -d
echo
sleep 1

echo "Instalando o PGBlitz"
echo
sudo rm -rf /opt/plexguide && sudo rm -rf /opt/pgstage && sudo apt install curl -y && curl -s https://raw.githubusercontent.com/PGBlitz/Install/v8.5/install.sh | sudo -H sh
sudo pgblitz
echo
sleep 1

echo "Atualizando a versão do rclone"
echo
curl https://rclone.org/install.sh | sudo bash
echo
sleep 1

echo "criando a pasta de cache do rclone"
echo
sudo mkdir /mnt/cache
echo
sleep 1

echo "Parando os serviços do rclone"
sudo systemctl stop tdrive.service
sudo systemctl stop gdrive.service
sudo systemctl stop pgblitz.service
echo
sleep 1

echo "Substituindo os serviços"
echo
sudo cp /opt/holtzflix/services/gdrive.service /etc/systemd/system/
sudo cp /opt/holtzflix/services/tdrive.service /etc/systemd/system/
sudo cp /opt/holtzflix/scripts/pgblitz.sh /opt/appdata/plexguide/
sudo chmod +x /opt/appdata/plexguide/pgblitz.sh
echo
sleep 1

echo "Iniciando os serviços do rclone"
sudo systemctl start tdrive.service
sudo systemctl start gdrive.service
sudo systemctl start pgblitz.service
echo
sleep 1

echo "Criando a pasta de backup"
echo
sudo rm -rf /opt/bkp
sudo rm /etc/cron.d/bkp-cron
sudo mkdir /opt/bkp
sudo chown -R holtz:holtz /opt/bkp
echo
sleep 1

echo "Copiando os arquivos de backup para o cronjob."
echo
sudo cp /opt/holtzflix/backup-all.sh /opt/bkp/
sudo chmod +x /opt/bkp/backup-all.sh
sudo cp /opt/holtzflix/bkp-cron /etc/cron.d/
echo
sleep 1

echo "Sucesso na cópia, backup configurado"
echo
sleep 1
echo "Instalação Completa. Reinicie seu computador"
echo
sleep 1
exit
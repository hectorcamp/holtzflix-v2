#!/bin/bash
# Script para instalação dos containers básicos para Streaming com utilização do Rclone com cache VFS FULL

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

echo "Instalando o RCLONE"
echo
curl https://rclone.org/install.sh | sudo bash
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

echo "criando a pasta de cache do rclone"
echo
sudo mkdir /mnt/cache /mnt/gdrive /mnt/tdrive /mnt/logs
sudo chown -R 1000:1000 /mnt/cache
sudo chown -R 1000:1000 /mnt/gdrive
sudo chown -R 1000:1000 /mnt/tdrive
sudo chown -R 1000:1000 /mnt/logs
echo
sleep 1

echo "Copiando os serviços"
echo
sudo cp /opt/holtzflix/services/gdrive.service /etc/systemd/system/
sudo cp /opt/holtzflix/services/tdrive.service /etc/systemd/system/
echo
sleep 1

echo "Habilitando Serviços"
sleep 1
sudo systemctl enable gdrive.service 
sudo systemctl enable tdrive.service
sudo systemctl daemon-reload
echo
sleep 1

echo "Subindo os containers"
echo
cd ~/
sudo docker-compose up -d
echo
sleep 1

echo "Criando a pasta de backup"
echo
sudo rm -rf /opt/bkp
sudo rm /etc/cron.d/bkp-cron
sudo mkdir /opt/bkp
sudo chown -R 1000:1000 /opt/bkp
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
echo "Instalação Completa. Configure seu rclone com os drives com os nomes gdrive e tdrive, após isto reinicie seu computador"
echo
sleep 1
exit
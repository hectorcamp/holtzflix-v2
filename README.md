# holtzflix-v2


Este script tem como finalidade a instalação do docker, docker compose e todos os containers básicos para funconamento de um servidor de streaming utilizando o rclone para transporte de arquivos.

Será instalado: Portainer / Tautulli / Plex / Emby

<pre>
sudo apt-get update && sudo apt upgrade -y
sudo apt-get install git -y
sudo rm -rf /opt/holtzflix && sudo git clone https://github.com/luizfeliperc/holtzflix-v2.git /opt/holtzflix
cd /opt/holtzflix && sudo bash install.sh
</pre>

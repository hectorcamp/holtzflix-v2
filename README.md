# holtzflix-v2


Este script tem como finalidade a instalação do docker, docker compose e todos os containers básicos para funconamento de um servidor de streaming utilizando o rclone para transporte de arquivos.

Será instalado: Tautulli / Plex / Emby

<pre>

ATENÇÃO!!!!

Não execute o procedimento usando o root. Crie um usuário e de permissão de sudo a ele!


adduser seu_user
usermob -aG sudo seu_user

sudo apt-get update && sudo apt upgrade -y
sudo apt-get install git -y
sudo rm -rf /opt/holtzflix-v2 && sudo git clone https://github.com/luizfeliperc/holtzflix-v2.git /opt/holtzflix-v2
cd /opt/holtzflix-v2 && sudo bash install.sh
</pre>

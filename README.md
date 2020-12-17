# holtzflix-v2


Este script tem como finalidade a instalação do docker, docker compose e todos os containers básicos para funconamento de um servidor de streaming utilizando o rclone para transporte de arquivos.

Será instalado: Tautulli / Plex / Emby

ATENÇÃO!!!!

Não execute o procedimento usando o root. Crie um usuário e de permissão de sudo a ele!

Informações:

O Sistema pode usar o Drive ou Drive de equipe, basta você escolher o que deseja usar.
O tamanho do cache do rclone está configurado para 50GB
O tempo do cache em disco é de 720h

Caso queira alterar as opções, faça direto no serviço correspondente. lembrando que isto irá invalidar o cache e um novo deverá ser criado. Para isto faça:

sudo rm -r /mnt/cache/*
Altere as opções que deseja no serviço (gdrive.service ou tdrive.service)
sudo systemstl daemon-reload
sudo systemctl restart gdrive.service ou tdrive.service



<pre>

adduser seu_user
usermob -aG sudo seu_user

sudo apt-get update && sudo apt upgrade -y
sudo apt-get install git -y
sudo rm -rf /opt/holtzflix-v2 && sudo git clone https://github.com/luizfeliperc/holtzflix-v2.git /opt/holtzflix-v2
cd /opt/holtzflix-v2 && sudo bash install.sh
</pre>

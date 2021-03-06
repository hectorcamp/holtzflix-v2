#!/bin/bash

echo "Script para backup do sistema criado por Holtzmann"

echo "Parando todos os containers"
cd ~/ && sudo docker-compose stop
echo
sleep 30

echo "Zipando todas as pastas"
sudo -s tar -cvjf /tmp/$(hostname).$(date +%F).tar.bz2 /opt/appconfig
echo
sleep 1

echo "Startando todos os containers"
echo
cd ~/ && sudo docker-compose start
echo
sleep 30

echo "Iniciando a cópia do arquivo"
sudo cp /tmp/$(hostname).* /mnt/gdrive/backup
sudo cp /tmp/$(hostname).* /mnt/tdrive/backup
echo
sleep 1

echo "Apagando o arquivo temporário"
sudo rm /tmp/$(hostname).*
echo
sleep 1

echo "Backup finalizado"
#!/bin/bash
sudo systemctl stop transmission-daemon

sudo usermod -a -G debian-transmission $(users)

mkdir /home/mem/torrents
chgrp debian-transmission /home/mem/torrents
sudo chmod g+r /etc/transmission-daemon/settings.json

sudo ufw allow 9091,51413/tcp

echo "transmission password?"
read var_pass
var_user=$(users)
var_whitelist="127.0.0.1,192.168.*.*"
var_config_file="/etc/transmission-daemon/settings.json"

# download-dir & incomplete-dir
sudo sed -i 's/"\/var\/lib\/transmission-daemon\/Downloads"/"\/home\/mem\/torrents"/gi' $var_config_file
# encryption - 
sudo sed -i 's/"encryption": 1,/"encryption": 2,/' $var_config_file
# rpc-username
sudo sed -i "s|\"rpc-username\": \"transmission\",|\"rpc-username\": \"$var_user\",|" $var_config_file
# rpc-password
sudo sed -i "s|{bb38d1234057dd0b3d11ab96b5e37c4b5257b96eOqNqFZys|$var_pass|" $var_config_file
# rpc-whitelist-enabled
sudo sed -i "s/\"rpc-whitelist\": \"127.0.0.1\",/\"rpc-whitelist\": \"$var_whitelist\",/" $var_config_file
# umask
sudo sed -i 's/"umask": 18,/"umask": 2,/' $var_config_file

sudo systemctl start transmission-daemon
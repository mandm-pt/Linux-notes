#!/bin/bash
#xargs sudo apt install -y < packages.txt

while read p; do
    echo installing $p
    sudo snap install $p
done <snap_packages.txt
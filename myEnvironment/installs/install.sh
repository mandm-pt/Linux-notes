#!/bin/bash
cat packages.txt | sudo apt install -y \
cat snap_packages.txt | xargs sudo snap install

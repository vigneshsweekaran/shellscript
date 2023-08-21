#!/bin/bash

sudo apt update
sudo apt install -y nginx
echo "Installed via Azure extensions - custom script" > /var/www/html/index.nginx-debian.html

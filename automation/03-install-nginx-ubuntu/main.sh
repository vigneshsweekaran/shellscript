#!/bin/bash

sudo apt update
sudo apt install -y nginx
echo "Installed via Azure extensions - custom script" > /var/nginx/www/html/index.html

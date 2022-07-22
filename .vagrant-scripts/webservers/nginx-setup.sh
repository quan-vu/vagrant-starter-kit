#!/usr/bin/env bash

PASSWORD='vagrant'
DOMAIN="$1"

# Install Nginx
echo -e "\n--- Update system ---\n"
sudo apt-get update

echo -e "\n--- Install nginx ---\n"
sudo apt-get -y install nginx

echo -e "\n--- Create nginx virtual host ---\n"
sudo cp /vagrant/.vagrant-scripts/webservers/laravel.template.conf /etc/nginx/sites-available/default
sudo sed -i "s/{{DOMAIN}}/$DOMAIN/g" /etc/nginx/sites-available/default
sudo nginx -t

echo -e "\n--- Restart Nginx ---\n"
sudo service nginx restart
sudo service nginx status

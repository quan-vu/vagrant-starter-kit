#!/usr/bin/env bash

PASSWORD='vagrant'
DOMAIN="$1"

echo -e "\n--- Update system ---\n"
sudo apt-get update

echo -e "\n--- Install nginx ---\n"
sudo apt-get -y install nginx

echo -e "\n--- Create nginx virtual host ---\n"
sudo cp /vagrant/.vagrant-scripts/nginx/laravel.template.conf /etc/nginx/sites-available/default
sudo sed -i "s/{{DOMAIN}}/$DOMAIN/g" /etc/nginx/sites-available/default
sudo nginx -t

echo -e "\n--- Create index.php ---\n"
sudo touch /vagrant/www/public/index.php
echo "<?php phpinfo(); ?>" > /vagrant/www/public/index.php

echo -e "\n--- Restart Nginx ---\n"
sudo service nginx restart
sudo service nginx status

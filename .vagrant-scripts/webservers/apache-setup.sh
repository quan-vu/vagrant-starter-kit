#!/usr/bin/env bash

PASSWORD='vagrant'
DOMAIN="$1"

echo -e "\n--- Update system ---\n"
sudo apt-get update

echo -e "\n--- Install Apache ---\n"
sudo apt-get install -y apache2

echo -e "\n--- Create Apache Virtual Host ---\n"
VHOST=$(cat <<EOF
<VirtualHost *:80>
    ServerName ${DOMAIN}
    ServerAlias www.${DOMAIN}

    DocumentRoot /vargrant/www/public
    <Directory /vargrant/www>
        Options Indexes FollowSymLinks MultiViews
        AllowOverride All
        Require all granted
    </Directory>
</VirtualHost>

<VirtualHost *:443>
    ServerName ${DOMAIN}
    ServerAlias www.${DOMAIN}

    SSLEngine on
    SSLCertificateFile /vagrant/.ssl/cert.pem
    SSLCertificateKeyFile /vagrant/.ssl/key.pem

    DocumentRoot /vargrant/www/public
    <Directory /vargrant/www>
        Options Indexes FollowSymLinks MultiViews
        AllowOverride All
        Require all granted
    </Directory>
</VirtualHost>
EOF
)
echo "${VHOST}" > /etc/apache2/sites-available/000-default.conf

sudo cp /vagrant/.vagrant-scripts/webservers/apache-vhost.template.conf /etc/apache2/sites-available/000-default.conf
sudo sed -i "s/{{DOMAIN}}/$DOMAIN/g" /etc/apache2/sites-available/000-default.conf

echo -e "\n--- Create index.php ---\n"
sudo rm /vargrant/www/public/index.html
sudo touch /vargrant/www/public/index.php
echo "<?php phpinfo(); ?>" > /vargrant/www/public/index.php

echo -e "\n--- Enable mod_rewrite, ssl ---\n"
sudo a2enmod rewrite
sudo a2enmod ssl

echo -e "\n--- Restart Apache ---\n"
sudo service apache2 restart
sudo service apache2 status

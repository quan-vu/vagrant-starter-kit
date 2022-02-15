#!/usr/bin/env bash

echo -e "\n--- Update system ---\n"
sudo apt-get update

echo -e "\n--- Install PHP 8.0 ---\n"
sudo apt-get install -y software-properties-common language-pack-en-base
sudo LC_ALL=en_US.UTF-8 add-apt-repository ppa:ondrej/php

sudo apt install -y php8.0 php8.0-common php8.0-fpm \
    php8.0-mbstring php8.0-xmlrpc php8.0-soap php8.0-gd \
    php8.0-xml php8.0-intl php8.0-mysql php8.0-cli php8.0-mcrypt \
    php8.0-zip php8.0-curl

echo -e "\n--- Install Composer ---\n"
curl -s https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer

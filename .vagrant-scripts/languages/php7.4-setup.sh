#!/usr/bin/env bash

echo -e "\n--- Update system ---\n"
sudo apt-get update

echo -e "\n--- Install PHP 7.4 ---\n"
sudo apt-get install -y software-properties-common language-pack-en-base
sudo LC_ALL=en_US.UTF-8 add-apt-repository ppa:ondrej/php

sudo apt install -y php7.4 php7.4-common php7.4-fpm \
    php7.4-mbstring php7.4-xmlrpc php7.4-soap php7.4-gd \
    php7.4-xml php7.4-intl php7.4-mysql php7.4-cli php7.4-mcrypt \
    php7.4-zip php7.4-curl

echo -e "\n--- Install Composer ---\n"
curl -s https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer

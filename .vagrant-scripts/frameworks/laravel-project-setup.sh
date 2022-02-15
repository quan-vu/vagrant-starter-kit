#!/usr/bin/env bash

echo -e "\n--- Create Laravel project ---\n"
rm -rf /vagrant/www/*
composer create-project laravel/laravel /vagrant/www

echo -e "\n--- Laravel init ---\n"
php artisan key:generate
php artisan migrate

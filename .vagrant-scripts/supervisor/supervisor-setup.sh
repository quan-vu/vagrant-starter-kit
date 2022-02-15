#!/usr/bin/env bash

echo -e "\n--- Install Supervisor ---\n"
sudo apt-get install -y supervisor

echo -e "\n--- Config Supervisor ---\n"
sudo cp /vagrant/.vagrant-scripts/supervisor/* /etc/supervisor/conf.d

sudo service supervisor restart

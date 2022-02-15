#!/usr/bin/env bash

echo -e "\n--- Update system ---\n"
sudo apt-get update

echo -e "\n--- Install Redis server ---\n"
sudo apt install redis-server

echo -e "\n--- Redis: restart ---\n"
sudo systemctl restart redis.service

echo -e "\n--- Redis: check status ---\n"
sudo systemctl status redis


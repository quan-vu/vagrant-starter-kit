#!/usr/bin/env bash

VERSION=$1

if [[ $VERSION -eq '18' ]]
then
    echo -e "\n--- Install Nodejs version $VERSION ---\n"
    curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
else
    echo -e "\n--- Install latest Nodejs version ---\n"
    curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
fi

sudo apt-get install -y nodejs

echo -e "\n--- Install ReactJs develop environment ---\n"
sudo apt install node-typescript
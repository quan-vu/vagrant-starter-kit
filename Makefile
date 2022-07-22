DIR_NAME := $(shell basename $(CURDIR))

# Use current project dir as domain
export DOMAIN="https://${DIR_NAME}.local"

# Common	
ssl:
	mkdir -p ./.ssl
	openssl req -x509 -newkey rsa:4096 -nodes -out .ssl/cert.pem -keyout .ssl/key.pem -days 3650

# Vagrant
ssh:
	vagrant ssh

ssh-config:
	vagrant ssh-config

init: ssl 
	vagrant up

up:
	vagrant up

down:
	vagrant halt

reload:
	vagrant reload

clean:
	vagrant destroy
	rm -rf .vagrant

system-info:
	vagrant ssh -c "sudo service nginx status"
	vagrant ssh -c "supervisord --version"
	vagrant ssh -c "php --version"
	vagrant ssh -c "node --version"

verify:
	curl ${DOMAIN}
	
# Laravel
create-laravel-project:
	vagrant ssh -c "/vagrant/www"
	vagrant ssh -c "composer create-project laravel/laravel"
	vagrant ssh -c "php artisan key:generate"
	

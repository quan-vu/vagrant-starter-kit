up:
	vagrant up

down:
	vagrant halt

reload:
	vagrant reload

clean:
	vagrant destroy
	rm -rf .vagrant

ssh:
	vagrant ssh

ssh-config:
	vagrant ssh-config
	
ssl:
	mkdir .ssl
	openssl req -x509 -newkey rsa:4096 -nodes -out .ssl/cert.pem -keyout .ssl/key.pem -days 3650

create-laravel-project:
	composer create-project laravel/laravel ./www
	vagrant ssh -c "php artisan key:generate"
	
	


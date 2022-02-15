# Vagrant Starter Kit

Vagrant Starter Kit is a collection of bash scripts for setup software quickly.

Vagrant Starter Kit Command Line Tools. (comming soon...)

### OS

- [x] Ubuntu 20.04

### Web servers

- [x] apache-setup.sh
- [x] nginx-setup.sh

### Programming Languages

- [x] php7.4-setup.sh
- [x] php8.0-setup.sh
- [ ] python3-setup.sh
- [ ] golang-setup.sh

### Databases

- [x] mysql-setup.sh
- [ ] mongodb-setup.sh
- [x] elastic-setup.sh
- [x] redis-setup.sh

### Others

- [x] supervisor-setup.sh

### Frameworks

- [x] laravel-project-setup.sh
- [ ] django-project-setup.sh
- [ ] fastapi-project-setup.sh

... and more

**Easy to use by choose what you need.**

```shell
# Setup nginx
config.vm.provision "shell", path: ".vagrant-scripts/nginx.sh", args: [HOSTNAME]

# Setup MySQL
config.vm.provision "shell", path: ".vagrant-scripts/mysql-setup.sh"

# Setup Elastic Search
config.vm.provision "shell", path: ".vagrant-scripts/elastic-setup.sh"

# Setup Supervisor
config.vm.provision "shell", path: ".vagrant-scripts/supervisor-setup.sh"

# Final
# Setup Laravel project
config.vm.provision "shell", path: ".vagrant-scripts/laravel-project-setup.sh"

# Setup Django project
config.vm.provision "shell", path: ".vagrant-scripts/django-project-setup.sh"

# Setup FastAPI project
config.vm.provision "shell", path: ".vagrant-scripts/fastapi-project-setup.sh"
```




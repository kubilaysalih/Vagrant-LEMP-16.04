#!/bin/bash

echo "(Setting up your Vagrant box...)"

echo "(Updating apt-get...)"
sudo apt-get update > /dev/null 2>&1

# Nginx
echo "(Installing Nginx...)"
sudo apt-get install -y nginx > /dev/null 2>&1

# MySQL
echo "(Preparing for MySQL Installation...)"
sudo apt-get install -y debconf-utils > /dev/null 2>&1
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password password root"
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password_again password root"

# MySql Server
echo "(Installing MySQL...)"
sudo apt-get install -y mysql-server > /dev/null 2>&1

echo "(Creating database)"
mysql -u root --password=root -e "create database blogum;"

# Php Modules
echo "(Installing PHP and MySQL module...)"
sudo apt-get install -y php-fpm php-mysql php-curl php7.0-xml php7.0-intl php7.0-gd php7.0-mbstring > /dev/null 2>&1

# Nginx Config
echo "(Overwriting default Nginx config to work with Laravel)"
sudo rm -rf /etc/nginx/sites-available/default > /dev/null 2>&1
sudo cp /vagrant/provision/nginx_vhost /etc/nginx/sites-available/default > /dev/null 2>&1
sudo cp /vagrant/provision/nginx_vhost /etc/nginx/sites-enabled/default > /dev/null 2>&1

# Change Nginx user config
echo "(Changing Nginx user config)"
sudo sed -i -e 's/www-data/ubuntu/g' /etc/nginx/nginx.conf

# Change Php User for permissions
echo "(Changing PHP User)"
sudo sed -i -e 's/www-data/ubuntu/g' /etc/php/7.0/fpm/pool.d/www.conf

# Restarting Nginx for config to take effect
echo "(Restarting Nginx for changes to take effect...)"
sudo service nginx restart > /dev/null 2>&1

# Restarting Php for config to take effect
echo "(Restarting Php for config to take effect)"
sudo service php7.0-fpm restart > /dev/null 2>&1

# Zip & Unzip for dummy composer
echo "(Install zip and unzip)"
sudo apt-get install -y zip unzip > /dev/null 2>&1

# Composer
echo "(Install Composer and Make It Global)"
curl -s http://getcomposer.org/installer | php > /dev/null 2>&1
sudo mv composer.phar /usr/local/bin/ > /dev/null 2>&1
sudo ln -s /usr/local/bin/composer.phar /usr/local/bin/composer > /dev/null 2>&1

# Setting User
echo "(Setting Ubuntu (user) password to \"vagrant\"...)"
echo "ubuntu:vagrant" | chpasswd

# Cleaning Up
echo "(Cleaning up additional setup files and logs...)"
sudo rm -r /var/www/html

echo "+---------------------------------------------------------+"
echo "|                      S U C C E S S                      |"
echo "+---------------------------------------------------------+"
echo "|   You're good to go! You can now view your server at    |"
echo "|                 \"10.10.10.61/\" in a browser.              |"
echo "|                                                         |"
echo "|  If you haven't already, I would suggest editing your   |"
echo "|     hosts file with \"10.10.10.61  projectname.vagrant\"    |"
echo "|         so that you can view your server with           |"
echo "|      \"projectname.vagrant/\" instead of \"10.10.10.61/\"     |"
echo "|                      in a browser.                      |"
echo "|                                                         |"
echo "|          You can SSH in with ubuntu / vagrant           |"
echo "|                                                         |"
echo "|        You can login to MySQL with root / root          |"
echo "+---------------------------------------------------------+"

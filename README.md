# Vagrant-LEMP-16.04

## Differences From Original Repository

- Default IP
- PHP and Nginx User
- Default Database(blogum)
- Composer
- Additional PHP Modules
- Zip & Unzip
- Folder structure

## PLEASE NOTE

These is a bug in Vagrant 1.9.3 (the newest version at time of writing) which prevents this, and many other Vagrant boxes from working correctly. For now I suggest staying on 1.9.2, which you can download from the official [Vagrant Archive Page](https://releases.hashicorp.com/vagrant/?_ga=1.71162004.563489484.1490234198).

## Introduction

I hatched this project from need of an all-in-one Ubuntu 16.04 LEMP Vagrant Box which I could use on my projects.

With this box you will get the full LEMP Stack (Ubuntu 16.04, Nginx, MySQL and PHP), all nicely configured to work properly together.

- Default IP: **10.10.10.61**
- Default SSH Port: **2222**
- Linux Login: **ubuntu** / **vagrant**
- MySQL Login: **root** / **root**

I would suggest connecting to the MySQL database using SSH Tunnel.

**Warning: Please do not use this for production environments, as it contains insecurities (basic passwords, PHP configs) and is only intended as a development environment.**



## Prerequisites

+ [VirtualBox](https://www.virtualbox.org/)

+ [Vagrant](https://www.vagrantup.com/)

  ​

## Instructions

- Edit your `hosts` file to add `10.10.10.61	projectname.vagrant` (optional)


- Unzip and place `vagrantfile` and the `provision` folder into your project root.


- Open a terminal window in the project root's location and `vagrant up`

- If you recieve any UAC prompts for VirtualBox, click `yes`

- Wait (maybe make an extremely quick cuppa)

- You're good to go, happy devving!

  ​

## Possible Errors

`dpkg-preconfigure: unable to re-open stdin: No such file or directory` - This can be ignored and will not cause a problem.

`mesg: ttyname failed: Inappropriate ioctl for device`  - This can be ignored and will not cause a problem.

`Warning: Remote connection disconnect. Retrying...`  - This can be ignored and will not cause a problem.

`Inappropriate ioctl for device` - This can be ignored and will not cause a problem.



## Sources

[How To Install Linux, Nginx, MySQL, PHP (LEMP stack) in Ubuntu 16.04](https://www.digitalocean.com/community/tutorials/how-to-install-linux-nginx-mysql-php-lemp-stack-in-ubuntu-16-04)

http://askubuntu.com/questions/12098/what-does-outputting-to-dev-null-accomplish-in-bash-scripts



## License

Released under the [MIT License](http://choosealicense.com/licenses/mit/). Please use as you like, as long as it is for the betterment of the community. Attribution is always appreciated.

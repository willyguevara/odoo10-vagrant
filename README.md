# odoo10-vagrant

Vagrant Setup for Odoo 10 on Ubuntu 16.04

Dependencies
------------

* [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
* [Vagrant](https://www.vagrantup.com)

Setup
-----

* Download and install Virtual Box

* Download and install Vagrant

* Clone this repo

```
git clone https://github.com/willyguevara/odoo10-vagrant
```

* Start virtual machine

```
cd odoo-vagrant
vagrant up
```

### NOTES: If you got issues whith guest additions -__- ###

```
Vagrant was unable to mount VirtualBox shared folders. This is usually
because the filesystem "vboxsf" is not available. This filesystem is
made available via the VirtualBox Guest Additions and kernel module.
Please verify that these guest additions are properly installed in the
guest. This is not a bug in Vagrant and is usually caused by a faulty
Vagrant box. For context, the command attempted was:

mount -t vboxsf -o uid=1000,gid=1000 vagrant /vagrant

The error output from the command was:

/sbin/mount.vboxsf: mounting failed with the error: No such device
```

run these two commands:

```
vagrant plugin install vagrant-vbguest
vagrant vbguest
```

Install headers for the guest os (ubuntu):
```
vagrant ssh

sudo apt-get -y install dkms build-essential linux-headers-$(uname -r) virtualbox-guest-additions-iso
```
_fuente_: https://stackoverflow.com/questions/28328775/virtualbox-mount-vboxsf-mounting-failed-with-the-error-no-such-device

then 

```
vagrant up --provision
```

* Login to the guest virtual machina

```
vagrant ssh
```

* To restart odoo service

```
sudo service odoo restart
```

* Open your browser and go http://localhost:8069

Shared folders
--------------
src/my_addons is mapped to /home/vagrant/my_addons, you can write your modules in this directory

* IMPORTANT: Have to add manually the /my_addons directory to config in odoo:

```
sudo vim /etc/odoo/odoo.conf
```

line looks like:

```
addons_path = /usr/lib/python2.7/dist-packages/odoo/addons, /home/vagrant/my_addons
```

pgAdmin 
-------
If you want manage the postgresql server from your desktop, you only have to connect to localhost, username and password is 'admin'

Para entrar al shel de postgres en el server:

```
vagrant ssh

sudo -i -u postgres psql
```

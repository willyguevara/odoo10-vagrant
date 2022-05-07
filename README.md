# odoo-vagrant

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
git clone https://github.com/danishzahur/odoo-vagrant.git
```

* Start virtual machine

```
cd odoo-vagrant
vagrant up
```

### NOTA: si da el siguiente problema: ###

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

Correr los siguientes 2 comandos:

```
vagrant plugin install vagrant-vbguest
```

luego 

```
vagrant up --provision
```

* Login in the virtual machine

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


pgAdmin 
-------
If you want manage the postgresql server from your desktop, you only have to connect to localhost, username and password is 'admin'

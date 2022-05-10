#!/bin/bash
function print_out {
  echo "--------------------------------------------------"
  echo ""
  echo "$1"
  echo ""
  echo "--------------------------------------------------"
}

# print_out "Installing virtualbox-guest-additions-iso Headers packages..."
# apt-get -y install dkms build-essential linux-headers-$(uname -r) virtualbox-guest-additions-iso

wget -O - https://nightly.odoo.com/odoo.key | apt-key add -
echo "deb http://nightly.odoo.com/10.0/nightly/deb/ ./" >> /etc/apt/sources.list.d/odoo.list

print_out "Updating packages..."
apt-get update

print_out "Installing odoo..."
apt-get install odoo -y
print_out "Configuring my_addons path..."
cat /etc/odoo/odoo.conf | grep -v addons_path > /etc/odoo/.tmp
echo 'addons_path = /usr/lib/python2.7/dist-packages/odoo/addons,/home/vagrant/my_addons' >> /etc/odoo/.tmp
rm /etc/odoo/odoo.conf
mv /etc/odoo/.tmp /etc/odoo/odoo.conf
service odoo restart


# print_out "Configuring PostgreSQL access..."
# sudo -u postgres psql -c "ALTER USER odoo WITH ENCRYPTED PASSWORD 'odoo';"
# echo "listen_addresses = '*'" >> /etc/postgresql/9.5/main/postgresql.conf
# echo 'host  all   all   0.0.0.0/0   md5' >> /etc/postgresql/9.5/main/pg_hba.conf
# service postgresql restart

echo "--------------------------------------------------"
echo "Login into the VM 'vagrant ssh'"
echo "Open your browser and go to http://localhost:8069"
echo "Enjoy it !"
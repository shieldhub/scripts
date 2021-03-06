
#! /bin/bash
apt update -y
apt install php-xml php-fpm libapache2-mod-php php-mysql php-gd php-imap php-gettext php-curl -y
mkdir -p /var/www/mutillidae.com/public_html
cd /var/www/mutillidae.com/public_html/
wget https://github.com/shieldhub/scripts/raw/master/mutillidae-2.6.67.zip
unzip mutillidae-2.6.67.zip
rm -r mutillidae-2.6.67.zip
mv mutillidae/* ./
cd /etc/apache2/sites-available/
wget https://raw.githubusercontent.com/shieldhub/scripts/master/mutillidae.com.conf
a2ensite mutillidae.com.conf
service apache2 restart
service mysql start
mysql -u root
use mysql;
update user set authentication_string=PASSWORD('mutillidae') where user='root';
update user set plugin='mysql_native_password' where user='root';
flush privileges;
quit;
echo 127.0.0.1 mutillidae.com >> /etc/hosts




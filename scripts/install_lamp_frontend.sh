#!/bin/bash

#-e Formatea el script cuando hay error
#-x; Muestra el comando por pantalla

set -ex

# Script para instalar LAMP en Ubuntu 24.04

# Actualiza los repositorios
apt update -y

# Actualizamos los paquetes
apt upgrade -y

# Instalamos el servidor web Apache
apt install apache2 -y

# Instalamos PHP
apt install php libapache2-mod-php php-mysql -y

# Copiamos nuestro archivo de config de Apache
cp ../conf/000-default.conf /etc/apache2/sites-available

# Reiniciamos el servicio de Apache
systemctl restart apache2

# Copiamos nuestro archivo de prueba PHP a /var/www/html
cp ../php/index.php /var/www/html
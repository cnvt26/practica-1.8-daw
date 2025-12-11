#!/bin/bash

#-e Formatea el script cuando hay error
#-x; Muestra el comando por pantalla

set -ex

# Importamos el archivo de variables
source .env

# Actualiza los repositorios
apt update

# Actualizamos los paquetes
apt upgrade -y

# Instalamos mysql server
apt install mysql-server -y

# Configuramos mysql para que pueda ser accedido remotamente
sed -i "s/127.0.0.1/$BACKEND_PRIVATE_IP/" /etc/mysql/mysql.conf.d/mysqld.cnf

# Reiniciamos mysql
systemctl restart mysql
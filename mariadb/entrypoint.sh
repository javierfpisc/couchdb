#!/bin/bash

#Arrancamos servicios
if [ -d /var/lib/mysql ]
then
	service mariadb start
	#Crea las bases de datos si no existen
	mysql -uroot -e "CREATE DATABASE IF NOT EXISTS $DB"
	mysql -uroot -e "CREATE DATABASE IF NOT EXISTS $WPDB"
	#Crea el usuario DBUSER si no existe y le otorga permisos a la base de datos
	if [ $(mysql -uroot -D mysql -s -e "SELECT EXISTS(SELECT 1 FROM mysql.user WHERE user = '$DBUSER')") ]
	then
		mysql -uroot -e "GRANT ALL ON $DB.* TO '$DBUSER'@'%' IDENTIFIED BY '$DBPASS'"
		#Carga el dump
		mysql -uroot -D $DB < /root/webtoprint.sql
	fi
	#Crea el usuario WPUSER si no existe y le otorga permisos a la base de datos
	if [ $(mysql -uroot -D mysql -s -e "SELECT EXISTS(SELECT 1 FROM mysql.user WHERE user = '$WPUSER')") ]
	then
		mysql -uroot -e "GRANT ALL ON $WPDB.* TO '$WPUSER'@'%' IDENTIFIED BY '$WPPASS'"
	fi
fi

exec bash -c "while true;do sleep 10;done"

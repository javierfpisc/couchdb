FROM debian:bullseye

#Copiamos el entrypoint.sh al container
COPY entrypoint.sh /usr/bin/entrypoint.sh

#Damos permiso al entrypoint
RUN chmod +x /usr/bin/entrypoint.sh

#Instalación de dependencias
RUN apt update && apt install -y vim iputils-ping mariadb-server mariadb-client

#Copiamos el dump de la base de datos
COPY webtoprint.sql /root/webtoprint.sql

#Configuración de la BBDD mysql para acceder desde fuera
RUN sed -i 's/127.0.0.1/0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf

#Comando para arrancar
ENTRYPOINT ["/usr/bin/entrypoint.sh"]

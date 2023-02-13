FROM python:3.10

#Copiamos el entrypoint.sh al container
COPY entrypoint.sh /usr/bin/entrypoint.sh

#Damos permiso al entrypoint
RUN chmod +x /usr/bin/entrypoint.sh

#Instalación de dependencias
RUN apt update && apt install -y vim libgl1-mesa-glx

#Comando para arrancar
ENTRYPOINT ["/usr/bin/entrypoint.sh"]

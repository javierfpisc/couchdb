#!/bin/bash

#Nos movemos al directorio del proyecto
cd /usr/src/website

#Instala si no lo están los requirements
pip install --no-cache-dir -r requirements.txt

#Levanta gunicorn
gunicorn --bind 0.0.0.0:8000 website:app

#Uso exec para lanzar un proceso independiente de bucle infinito
exec bash -c "while true;do sleep 10;done"


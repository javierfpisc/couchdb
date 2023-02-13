#!/bin/bash

#Nos movemos al directorio del proyecto
cd /opt/web2print/website

#Instala si no lo están los requirements
pip install --no-cache-dir -r requirements.txt

#Levanta gunicorn
gunicorn --bind 0.0.0.0:8000 --log-level=debug --error-logfile /opt/web2print/website/flask.log --access-logfile /opt/web2print/website/flask.log  website:app

#Uso exec para lanzar un proceso independiente de bucle infinito
exec bash -c "while true;do sleep 10;done"


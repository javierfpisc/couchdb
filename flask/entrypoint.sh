#!/bin/bash

#Nos movemos al directorio del proyecto
cd /home/web2print/gitrepos/flask_couchdb/website_control

#Instala si no lo están los requirements
pip install --no-cache-dir -r requirements.txt

#Levanta gunicorn
gunicorn --bind 0.0.0.0:8000 --timeout 600 --workers 3 --worker-class gevent --log-level=debug --error-logfile /opt/web2print/website/flask.log --access-logfile /opt/web2print/website/flask.log  website:app

#Uso exec para lanzar un proceso independiente de bucle infinito
exec bash -c "while true;do sleep 10;done"


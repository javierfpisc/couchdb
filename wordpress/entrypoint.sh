#!/bin/bash

[ -d /var/www/html ] && service apache2 start

exec bash -c "while true;do sleep 10;done"


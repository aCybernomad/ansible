#!/bin/bash
apt update -y
apt install apache2 -y
systemctl start apache2
bash -c 'echo your first webserver > /var/www/html/index.html'
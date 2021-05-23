#!/bin/bash
set -e

yum install -y httpd 
python -c 'import socket; print "Page served from", socket.gethostname()' > /var/www/html/index.html
systemctl restart httpd
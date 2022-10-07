#!/bin/bash

# mettre a jour les paquets et installer proftpd

sudo apt-get update && sudo apt-get install proftpd-* openssl ssh -y 

sudo cp /etc/proftpd/proftpd.conf /etc/proftpd/proftpd.conf.
sudo cp proftpd.conf /etc/proftpd/proftpd.conf


# creation de dossier ssl
sudo mkdir -p /etc/proftpd/ssl
# creation du certicat et de la clef
sudo openssl req -new -x509 -days 365 -nodes -out /etc/proftpd/ssl/proftpd.cert.pem -keyout /etc/proftpd/ssl/proftpd.key.pem
# donner des droit au dossier ssl recursivement
sudo chmod -R 750 /etc/proftpd/ssl
sudo cp tls.conf /etc/proftpd/tls.conf
sudo cp modules.conf /etc/proftpd/modules.conf

# Restart proftpd
sudo service proftpd restart

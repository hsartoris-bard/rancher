#!/bin/bash

# running with this will only work after rancher-data is created during backup

# the first time just take out the volumes-from
sudo docker run -d \
        --volumes-from rancher-data \
        --name rancher \
        --restart=unless-stopped \
        -p 80:80 -p 443:443 \
        -v /etc/pki/rancher/rancher.pem:/etc/rancher/ssl/cert.pem \
        -v /etc/pki/rancher/rancher-key.pem:/etc/rancher/ssl/key.pem \
        -v /etc/ssl/certs/ca-bundle.crt:/etc/rancher/ssl/cacerts.pem \
        -v /etc/ssl/certs:/container/certs \
        -e SSL_CERT_DIR="/container/certs" \
        rancher/rancher:latest

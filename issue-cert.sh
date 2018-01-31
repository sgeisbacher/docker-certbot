#!/bin/bash

if [ "$1" == "" ]; then
    echo "domain-name is mandatory"
    exit 1
fi

echo "issueing certs for ${1} ..."
docker build -t certbot .
docker run --name docker-certbot -ti -p 80:80 -v `pwd`/certs:/etc/letsencrypt -d certbot
docker exec -ti docker-certbot certbot certonly -a webroot --webroot-path=/var/www/html -d ${1} --register-unsafely-without-email
docker stop docker-certbot
docker rm docker-certbot

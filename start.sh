#!/bin/bash

docker build . -t ilnuribat.ru:4443/nginx-ex

#docker login ilnuribat.ru:4443 -u ilnuribat

docker push ilnuribat.ru:4443/nginx-ex

ssh root@ilnuribat.ru '
  docker stop nginx-ex || true &&
  docker rm nginx-ex || true &&
  docker pull ilnuribat.ru:4443/nginx-ex &&
  docker run -d \
    -p 80:80 \
    -p 443:443 \
    -v /etc/letsencrypt/live/ilnuribat.ru/privkey.pem:/data/certs/privkey.pem \
    -v /etc/letsencrypt/live/ilnuribat.ru/fullchain.pem:/data/certs/fullchain.pem \
    --name=nginx-ex \
    ilnuribat.ru:4443/nginx-ex
  '
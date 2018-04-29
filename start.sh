#!/bin/bash

docker stop nginx-ex || true

docker rm nginx-ex || true

docker build . -t nginx-ex

docker run -d \
	-p 80:80 \
	-p 443:443 \
	--name=nginx-ex \
	nginx-ex

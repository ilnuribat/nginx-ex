#!/bin/bash

docker stop nginx-ex || true

docker rm nginx-ex || true

docker build . -t nginx-ex

docker run -d \
	-v ~/projects/nginx-ex/images/:/data/images/ \
	-v ~/projects/nginx-ex/nginx.conf:/etc/nginx/nginx.conf \
	-v ~/projects/nginx-ex/htmls/:/data/htmls/ \
	-p 80:80 \
	-p 443:443 \
	--name=nginx-ex \
	nginx-ex

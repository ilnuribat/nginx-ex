#!/bin/bash

docker stop nginx-ex || true

docker rm nginx-ex || true

docker run \
	-v ~/projects/nginx/nginx.conf:/etc/nginx/nginx.conf \
	-v ~/projects/nginx/htmls:/data/htmls \
	-v ~/projects/nginx/images:/data/images \
	-p 80:80 \
	--name=nginx-ex \
	nginx:1.13

#!/bin/bash

docker stop nginx-ex || true

docker rm nginx-ex || true

docker run \
	-v ~/projects/nginx-ex/nginx.conf:/etc/nginx/nginx.conf \
	-v ~/projects/nginx-ex/htmls:/data/htmls \
	-v ~/projects/nginx-ex/images:/data/images \
	-p 80:80 \
	--name=nginx-ex \
	nginx:1.13

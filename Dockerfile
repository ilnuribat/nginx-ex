FROM nginx:1.13

WORKDIR /data

COPY certs certs

COPY htmls/ htmls/

COPY images/ images/

COPY nginx.conf /etc/nginx/nginx.conf


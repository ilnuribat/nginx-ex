FROM nginx:1.13

WORKDIR /data

COPY htmls htmls

COPY images images

COPY nginx.conf /etc/nginx/nginx.conf

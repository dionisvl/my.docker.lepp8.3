FROM nginx:1.27-alpine3.19-slim

RUN apk add --no-cache curl bash

COPY ./.docker/nginx/snippets /etc/nginx/snippets
COPY ./.docker/nginx/conf.d /etc/nginx/conf.d
COPY ./.docker/nginx/start-nginx.sh /start-nginx.sh

RUN chmod +x /start-nginx.sh

WORKDIR /app

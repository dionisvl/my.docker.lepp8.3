FROM nginx:1.25.4-alpine3.18-slim

RUN apk add --no-cache curl bash

COPY ./.docker/nginx/snippets /etc/nginx/snippets
COPY ./.docker/nginx/conf.d /etc/nginx/conf.d

WORKDIR /app

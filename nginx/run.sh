#!/bin/bash

docker run -d --rm --name universe.proxy.server
    -h node-nginx
    -e NGINX_ENTRYPOINT_QUIET_LOGS=${NGINX_ENTRYPOINT_QUIET_LOGS:-1}
    -p 80:80
    -v /docker/nginx/nginx.conf:/etc/nginx/nginx.conf:ro
    -v /docker/nginx/conf.d:/etc/nginx/conf.d:rw
    -v /docker/nginx/templates:/etc/nginx/templates:rw
    -v /docker/nginx/static:/usr/share/nginx/html:ro
    -v universe.store:/var/www/html:ro
    --network universe.domain
    --restart always
    --health-cmd "curl -f http://universe.sync/ || exit 1"
    --health-start-period 1m
    --health-start-interval 1s
    --health-retries 3
    --health-interval 1m30s
    --health-timeout 10s
    nginx:1.31.7-alpine3.24

# reserved

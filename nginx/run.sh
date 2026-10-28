#!/bin/bash

docker run -d --rm --name universe.proxy.server
    -h node-nginx
    -e NGINX_ENTRYPOINT_QUIET_LOGS=${NGINX_ENTRYPOINT_QUIET_LOGS:-1}
    -p 127.0.0.1:80:80
    -p 127.0.0.1:3306:3306
    -p 127.0.0.1:5432:5432
    -p 127.0.0.1:27017:27017
    -p 127.0.0.1:6379:6379
    -p 127.0.0.1:11211:11211
    -p 127.0.0.1:5672:5672
    -p 127.0.0.1:9092:9092
    -v /docker/nginx/nginx.conf:/etc/nginx/nginx.conf:ro
    -v /docker/nginx/conf.d:/etc/nginx/conf.d:ro
    -v mysql.store:/var/www/html:ro
    --network universe.domain
    --restart always
    --health-cmd "curl -f -H 'Host: universe.sync' http://127.0.0.1/ping | grep -q PONG || exit 1"
    --health-start-period 1m
    --health-start-interval 1s
    --health-retries 3
    --health-interval 1m30s
    --health-timeout 10s
    nginx:1.31.7-alpine3.24

# reserved

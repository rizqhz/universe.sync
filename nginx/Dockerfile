FROM nginx:1.31.7-alpine3.24 AS server

ENV NGINX_ENTRYPOINT_QUIET_LOGS=1

ENV SRC=/docker/nginx
ENV DST=/etc/nginx

COPY ${SRC}/nginx.conf ${DST}/nginx.conf
COPY ${SRC}/conf.d     ${DST}/conf.d

HEALTHCHECK \
    --start-period=1m --start-interval=1s \
    --retries=3 \
    --interval=1m30s \
    --timeout=10s \
    CMD curl -f -H 'Host: universe.sync' http://127.0.0.1/ping | grep -q PONG || exit 1

# reserved

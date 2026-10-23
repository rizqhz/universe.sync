FROM mysql:26.7.0 AS server

ENV MYSQL_ROOT_PASSWORD=password
ENV MYSQL_DATABASE=db_example
ENV MYSQL_USER=user
ENV MYSQL_PASSWORD=password
ENV MYSQL_ALLOW_EMPTY_PASSWORD=no

HEALTHCHECK \
    --start-period=1m --start-interval=1s \
    --retries=3 \
    --interval=1m30s \
    --timeout=10s \
    CMD mysql -u$MYSQL_USER -p$MYSQL_PASSWORD -e"use $MYSQL_DATABASE" || exit 1

FROM phpmyadmin:5.2.3-fpm-alpine AS panel

ENV PMA_HOST=127.0.0.1
ENV PMA_PORT=3306
ENV UPLOAD_LIMIT=512M
ENV MAX_EXECUTION_TIME=300
ENV HIDE_PHP_VERSION=false

HEALTHCHECK \
    --start-period=1m --start-interval=1s \
    --retries=3 \
    --interval=1m30s \
    --timeout=10s \
    CMD pgrep -f php-fpm >/dev/null && netstat -tuln | grep -q ':9000' || exit 1

# reserved

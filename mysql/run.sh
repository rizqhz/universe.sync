#!/bin/bash

docker run -d --rm --name universe.db.mysql.server
    -h node-mysql-server
    -e MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD:-password}
    -e MYSQL_DATABASE=${MYSQL_DATABASE:-db_example}
    -e MYSQL_USER=${MYSQL_USER:-user}
    -e MYSQL_PASSWORD=${MYSQL_PASSWORD:-password}
    -e MYSQL_ALLOW_EMPTY_PASSWORD=${MYSQL_ALLOW_EMPTY_PASSWORD:-no}
    -p 3306:3306
    -v /docker/mysql/data:/var/lib/mysql:rw
    --network universe.domain
    --restart always
    --health-cmd "mysql -u$MYSQL_USER -p$MYSQL_PASSWORD -e\"use $MYSQL_DATABASE\" || exit 1"
    --health-start-period 1m
    --health-start-interval 1s
    --health-retries 3
    --health-interval 1m30s
    --health-timeout 10s
    mysql:26.7.0

docker run -d --rm --name universe.db.mysql.panel
    -h node-mysql-panel
    -e PMA_HOST=${PMA_HOST:-127.0.0.1}
    -e PMA_PORT=${PMA_PORT:-3306}
    -e UPLOAD_LIMIT=${UPLOAD_LIMIT:-512M}
    -e MAX_EXECUTION_TIME=${MAX_EXECUTION_TIME:-300}
    -e HIDE_PHP_VERSION=${HIDE_PHP_VERSION:-false}
    -p 9000:9000
    -v /docker/mysql/admin:/sessions:rw
    -v mysql.store:/var/www/html:rw
    --network universe.domain
    --restart always
    --health-cmd "pgrep -f php-fpm >/dev/null && netstat -tuln | grep -q ':9000' || exit 1"
    --health-start-period 1m
    --health-start-interval 1s
    --health-retries 3
    --health-interval 1m30s
    --health-timeout 10s
    phpmyadmin:5.2.3-fpm-alpine

# reserved

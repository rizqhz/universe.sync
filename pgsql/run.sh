#!/bin/bash

docker run -d --rm --name universe.db.pgsql.server
    -h node-pgsql-server
    -e POSTGRES_USER=${POSTGRES_USER:-user}
    -e POSTGRES_PASSWORD=${POSTGRES_PASSWORD:-password}
    -e POSTGRES_DB=${POSTGRES_DB:-db_example}
    -p 5432:5432
    -v /docker/pgsql/data:/var/lib/postgresql:rw
    --network universe.domain
    --restart always
    --health-cmd "psql -U $POSTGRES_USER -d $POSTGRES_DB -c 'select current_database()' || exit 1"
    --health-start-period 1m
    --health-start-interval 1s
    --health-retries 3
    --health-interval 1m30s
    --health-timeout 10s
    postgres:19rc1-alpine3.24

docker run -d --rm --name universe.db.pgsql.panel
    -h node-pgsql-panel
    -e PGADMIN_DEFAULT_EMAIL=${PGADMIN_DEFAULT_EMAIL:-user@example.com}
    -e PGADMIN_DEFAULT_PASSWORD=${PGADMIN_DEFAULT_PASSWORD:-password}
    -e PGADMIN_LISTEN_PORT=${PGADMIN_LISTEN_PORT:-80}
    -e PGADMIN_CONFIG_SERVER_MODE=${PGADMIN_CONFIG_SERVER_MODE:-False}
    -e PGADMIN_CONFIG_MASTER_PASSWORD_REQUIRED=${PGADMIN_CONFIG_MASTER_PASSWORD_REQUIRED:-False}
    -p 80:80
    -v /docker/pgsql/server.json:/pgadmin4/servers.json:rw
    -v /docker/pgsql/admin:/var/lib/pgadmin:rw
    --network universe.domain
    --restart always
    --health-cmd "wget -qO- http://127.0.0.1/misc/ping || exit 1"
    --health-start-period 1m
    --health-start-interval 1s
    --health-retries 3
    --health-interval 1m30s
    --health-timeout 10s
    dpage/pgadmin4:9.18.0

# reserved

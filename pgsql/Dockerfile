FROM postgres:19rc1-alpine3.24 AS server

ENV POSTGRES_USER=user
ENV POSTGRES_PASSWORD=password
ENV POSTGRES_DB=db_example

HEALTHCHECK \
    --start-period=1m --start-interval=1s \
    --retries=3 \
    --interval=1m30s \
    --timeout=10s \
    CMD psql -U $POSTGRES_USER -d $POSTGRES_DB -c 'select current_database()' || exit 1

FROM dpage/pgadmin4:9.18.0 AS panel

ENV PGADMIN_DEFAULT_EMAIL=user@example.com
ENV PGADMIN_DEFAULT_PASSWORD=password
ENV PGADMIN_LISTEN_PORT=80
ENV PGADMIN_CONFIG_SERVER_MODE=False
ENV PGADMIN_CONFIG_MASTER_PASSWORD_REQUIRED=False

HEALTHCHECK \
    --start-period=1m --start-interval=1s \
    --retries=3 \
    --interval=1m30s \
    --timeout=10s \
    CMD wget -qO- http://127.0.0.1/misc/ping || exit 1

# reserved

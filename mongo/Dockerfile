FROM mongo:9.0.4 AS server

ENV MONGO_INITDB_ROOT_USERNAME=user
ENV MONGO_INITDB_ROOT_PASSWORD=password

HEALTHCHECK \
    --start-period=1m --start-interval=1s \
    --retries=3 \
    --interval=1m30s \
    --timeout=10s \
    CMD mongosh -u $MONGO_INITDB_ROOT_USERNAME -p $MONGO_INITDB_ROOT_PASSWORD \
        --authenticationDatabase admin \
        --eval "db.adminCommand('ping')" || exit 1

# reserved

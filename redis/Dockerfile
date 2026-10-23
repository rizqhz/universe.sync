FROM redis:8.10.2-alpine3.23 AS cache

ENV REDIS_CONF=/etc/redis/redis.conf
ENV REDIS_USER=user
ENV REDIS_PASS=password

HEALTHCHECK \
    --start-period=1m --start-interval=1s \
    --retries=3 \
    --interval=1m30s \
    --timeout=10s \
    CMD redis-cli --user $REDIS_USER -a $REDIS_PASS ping 2>&1 | grep -q PONG || exit 1

CMD ["redis-server", "${REDIS_CONF}"]

# reserved

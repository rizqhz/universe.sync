FROM memcached:1.6.45-alpine3.24 AS cache

HEALTHCHECK \
    --start-period=1m --start-interval=1s \
    --retries=3 \
    --interval=1m30s \
    --timeout=10s \
    CMD echo stats | nc 127.0.0.1 11211 | grep -q uptime || exit 1

CMD ["memcached", "-c 1024", "-t 4", "-m 64", "-v"]

# reserved

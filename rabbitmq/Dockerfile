FROM rabbitmq:4.3.6-alpine AS broker

ENV RABBITMQ_DEFAULT_USER=user
ENV RABBITMQ_DEFAULT_PASS=password

HEALTHCHECK \
    --start-period=1m --start-interval=1s \
    --retries=3 \
    --interval=1m30s \
    --timeout=10s \
    CMD rabbitmq-diagnostics ping -q || exit 1

# reserved

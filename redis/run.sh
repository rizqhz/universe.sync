#!/bin/bash

docker run -d --rm --name universe.cache.redis
    -h node-redis
    -e REDIS_CONF=${REDIS_CONF:-/etc/redis/redis.conf}
    -e REDIS_USER=${REDIS_USER:-user}
    -e REDIS_PASS=${REDIS_PASS:-password}
    -p 6379:6379
    -v /docker/redis/redis.conf:/etc/redis/redis.conf:rw
    -v /docker/redis/data:/data:rw
    --network universe.domain
    --restart always
    --health-cmd "redis-cli --user $REDIS_USER -a $REDIS_PASS ping 2>&1 | grep -q PONG || exit 1"
    --health-start-period 1m
    --health-start-interval 1s
    --health-retries 3
    --health-interval 1m30s
    --health-timeout 10s
    redis:8.10.2-alpine3.23
    redis-server $REDIS_CONF

# reserved

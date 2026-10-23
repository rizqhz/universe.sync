#!/bin/bash

docker -d --rm run --name universe.cache.memcached
    -h node-memcached
    -p 11211:11211
    --network universe.domain
    --restart always
    --health-cmd "echo stats | nc 127.0.0.1 11211 | grep -q uptime || exit 1"
    --health-start-period 1m
    --health-start-interval 1s
    --health-retries 3
    --health-interval 1m30s
    --health-timeout 10s
    memcached:1.6.45-alpine3.24
    memcached -c 1024
              -t 4
              -m 64 
              -v

# reserved

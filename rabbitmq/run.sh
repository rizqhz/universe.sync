#!/bin/bash

docker run -d --rm --name universe.broker.rabbitmq
    -h node-rabbitmq
    -e RABBITMQ_DEFAULT_USER=${RABBITMQ_DEFAULT_USER:-user}
    -e RABBITMQ_DEFAULT_PASS=${RABBITMQ_DEFAULT_PASS:-password}
    -p 15672:15672
    -p 5672:5672
    -v /docker/rabbitmq/data:/var/lib/rabbitmq:rw
    --network universe.domain
    --restart always
    --health-cmd "rabbitmq-diagnostics ping -q || exit 1"
    --health-start-period 1m
    --health-start-interval 1s
    --health-retries 3
    --health-interval 1m30s
    --health-timeout 10s
    rabbitmq:4.3.6-alpine

# reserved

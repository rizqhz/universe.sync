#!/bin/bash

fmt="{\"name\":\"{{.Name}}\",\"start\":\"{{.State.StartedAt}}\",\"logs\":{{json .State.Health.Log}}}"

docker container inspect universe.db.mysql.server \
    --format="$fmt" | jq

docker container inspect universe.db.pgsql.server \
    --format="$fmt" | jq

docker container inspect universe.db.mongo.server \
    --format="$fmt" | jq

docker container inspect universe.db.mysql.panel  \
    --format="$fmt" | jq

docker container inspect universe.db.pgsql.panel  \
    --format="$fmt" | jq

docker container inspect universe.cache.redis     \
    --format="$fmt" | jq

docker container inspect universe.cache.memcached \
    --format="$fmt" | jq

docker container inspect universe.broker.rabbitmq \
    --format="$fmt" | jq

docker container inspect universe.broker.kafka    \
    --format="$fmt" | jq

docker container inspect universe.proxy.server    \
    --format="$fmt" | jq

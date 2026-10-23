#!/bin/bash

docker run -d --rm --name universe.db.mongo.server
    -h node-mongo-server
    -e MONGO_INITDB_ROOT_USERNAME=${MONGO_INITDB_ROOT_USERNAME:-user}
    -e MONGO_INITDB_ROOT_PASSWORD=${MONGO_INITDB_ROOT_PASSWORD:-password}
    -p 27017:27017
    -v /docker/mongo/data:/data/db:rw
    --network universe.domain
    --restart always
    --health-cmd "mongosh -u $MONGO_INITDB_ROOT_USERNAME -p $MONGO_INITDB_ROOT_PASSWORD \
                  --authenticationDatabase admin \
                  --eval \"db.adminCommand('ping')\" || exit 1"
    --health-start-period 1m
    --health-start-interval 1s
    --health-retries 3
    --health-interval 1m30s
    --health-timeout 10s
    mongo:9.0.4

# reserved

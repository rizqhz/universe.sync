#!/bin/bash

[[ "$UID" -ne 0 ]] && echo "err: must be superuser" && exit 1

src=${1:-redis}
dst=${2:-/docker/redis}

for params in \
    "$src/conf.d/redis.conf $dst/redis.conf" \
; do
    set -- $params
    if [[ ! -f $2 ]] || ! cmp -s $1 $2; then
        echo "copy: $1 -> $2"
        cp $1 $2
    fi
done

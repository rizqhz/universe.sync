#!/bin/bash

[[ "$UID" -ne 0 ]] && echo "err: must be superuser" && exit 1

src=${1:-nginx}
dst=${2:-/docker/nginx}

for params in \
    "$src/conf.d/main.conf   $dst/nginx.conf"         \
    "$src/conf.d/http.conf   $dst/conf.d/http.conf"   \
    "$src/conf.d/stream.conf $dst/conf.d/stream.conf" \
; do
    set -- $params
    if [[ ! -f $2 ]] || ! cmp -s $1 $2; then
        echo "copy: $1 -> $2"
        cp $1 $2
    fi
done

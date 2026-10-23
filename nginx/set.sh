#!/bin/bash

[[ "$UID" -ne 0 ]] && echo "err: must be superuser" && exit 1

src=${1:-nginx}
dst=${2:-/docker/nginx}

for params in \
    "$src/conf.d/00nginx.conf $dst/nginx.conf" \
    "$src/conf.d/01nginx.conf $dst/conf.d/default.conf" \
    "$src/conf.d/02nginx.conf $dst/conf.d/main.conf" \
; do
    set -- $params
    if [[ ! -f $2 ]] || ! cmp -s $1 $2; then
        echo "copy: $1 -> $2"
        cp $1 $2
    fi
done

for params in \
    "$src/static/index.html $dst/static/index.html" \
    "$src/static/50x.html $dst/static/50x.html" \
; do
    set -- $params
    if [[ ! -f $2 ]] || ! cmp -s $1 $2; then
        echo "copy: $1 -> $2"
        cp $1 $2
    fi
done

#!/bin/bash

[[ "$UID" -ne 0 ]] && echo "err: must be superuser" && exit 1

root=${1:-/docker}

if [[ ! -d $root ]]; then
    install -d -m 777 $root
    echo "create: $root"
fi

if [[ ! -d $root/nginx ]]; then
    base=$root/nginx && install -d -m 777 $base
    echo "create: $base"
    for params in \
        "777 0 0 d static" \
        "777 0 0 d templates" \
        "777 0 0 d conf.d" \
        "777 0 0 f conf.d/default.conf" \
        "777 0 0 f conf.d/main.conf" \
        "777 0 0 f nginx.conf" \
    ; do
        set -- $params && entry=$base/$5
        if [[ ! -e $entry ]]; then
            case $4 in
                'd') install -d -m $1 -o $2 -g $3 $entry ;;
                'f') touch $entry && chmod $1 $entry ;;
            esac
            echo "create: $entry"
        fi
    done
fi

if [[ ! -d $root/mysql ]]; then
    base=$root/mysql && install -d -m 777 $base
    echo "create: $base"
    for params in \
        "777  82  82 d admin" \
        "777 999 999 d data" \
    ; do
        set -- $params && entry=$base/$5
        if [[ ! -d $entry ]]; then
            install -d -m $1 -o $2 -g $3 $entry
            echo "create: $entry"
        fi
    done
fi

if [[ ! -d $root/pgsql ]]; then
    base=$root/pgsql && install -d -m 777 $base
    echo "create: $base"
    for params in \
        "777 5050 5050 d admin" \
        "777   70   70 d data" \
    ; do
        set -- $params && entry=$base/$5
        if [[ ! -d $entry ]]; then
            install -d -m $1 -o $2 -g $3 $entry
            echo "create: $entry"
        fi
    done
fi

if [[ ! -d $root/mongo ]]; then
    base=$root/mongo && install -d -m 777 $base
    echo "create: $base"
    for params in \
        "777 0 0 d data" \
    ; do
        set -- $params && entry=$base/$5
        if [[ ! -d $entry ]]; then
            install -d -m $1 -o $2 -g $3 $entry
            echo "create: $entry"
        fi
    done
fi

if [[ ! -d $root/redis ]]; then
    base=$root/redis && install -d -m 777 $base
    echo "create: $base"
    for params in \
        "777 999 1000 d data" \
    ; do
        set -- $params && entry=$base/$5
        if [[ ! -d $entry ]]; then
            install -d -m $1 -o $2 -g $3 $entry
            echo "create: $entry"
        fi
    done
fi

if [[ ! -d $root/memcached ]]; then
    base=$root/memcached && install -d -m 777 $base
    echo "create: $base"
    for params in \
        "777 0 0 d data" \
    ; do
        set -- $params && entry=$base/$5
        if [[ ! -d $entry ]]; then
            install -d -m $1 -o $2 -g $3 $entry
            echo "create: $entry"
        fi
    done
fi

if [[ ! -d $root/rabbitmq ]]; then
    base=$root/rabbitmq && install -d -m 777 $base
    echo "create: $base"
    for params in \
        "777 100 101 d data" \
    ; do
        set -- $params && entry=$base/$5
        if [[ ! -d $entry ]]; then
            install -d -m $1 -o $2 -g $3 $entry
            echo "create: $entry"
        fi
    done
fi

if [[ ! -d $root/kafka ]]; then
    base=$root/kafka && install -d -m 777 $base
    echo "create: $base"
    for params in \
        "777 0 0 d data" \
    ; do
        set -- $params && entry=$base/$5
        if [[ ! -d $entry ]]; then
            install -d -m $1 -o $2 -g $3 $entry
            echo "create: $entry"
        fi
    done
fi

for folders in \
    "nginx" \
    "mysql" \
    "pgsql" \
    "mongo" \
    "redis" \
    "memcached" \
    "rabbitmq" \
    "kafka" \
; do
    set -- $folders && entry=$1/set.sh
    if [[ -f $entry ]]; then
        ./$entry
    fi
done

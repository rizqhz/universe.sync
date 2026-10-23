#!/bin/bash

[[ "$UID" -ne 0 ]] && echo "err: must be superuser" && exit 1

root=${1:-/docker}

if [[ -d $root ]]; then
    echo "remove: $root"
    rm -rf $root
else
    echo "out: $root already removed"
fi

#!/bin/sh

usage () {
    echo "Usage: $0 <path-to-image-containing-qr-code>"
    exit 0
}

check_command () {
    if ! command -v $1 >/dev/null 2>&1
    then
        echo >&2 "$1 command not found, please install package $2"
        exit 2
    fi
}

if [ $# -ne 1 ] || [ "$1" = "-h" ] || [ "$1" = "--help" ]
then
    usage
fi

check_command zbarimg zbar-tools
check_command awk gawk

if [ ! -f "$1" ]
then
    echo >&2 "$1 is not a readable file"
    exit 2
fi

zbarimg -q "$1" | awk -f $(dirname $0)/swiss-qr-decode.awk

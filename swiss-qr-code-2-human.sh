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
check_command awk gawk

if [ ! -f "$1" ]
then
    echo >&2 "$1 is not a readable file"
    exit 2
fi

if message=$(zbarimg -q "$1")
then
    echo "$message" | awk -f $(dirname $([ -L "$0" ] && readlink "$0" || echo "$0"))/swiss-qr-decode.awk
else
    echo >&2 "Failed to find or decode the QR code in image $1. Things to check:"
    echo >&2 "- is the barcode large enough in the image?"
    echo >&2 "- is the barcode mostly in focus?"
    echo >&2 "- is there sufficient contrast/illumination?"
    exit 4
fi


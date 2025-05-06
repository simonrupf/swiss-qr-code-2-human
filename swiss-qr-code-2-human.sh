#!/bin/sh

usage () {
    echo "Usage: $(basename $0) [path-to-image-containing-qr-code]"
    exit 0
}

check_command () {
    if ! command -v $1 >/dev/null 2>&1
    then
        echo >&2 "$1 command not found, please install package $2"
        exit 2
    fi
}

urlencode () {
    local LANG=C
    local i=1
    local length="${#1}"
    while [ $i -le $length ]
    do
        local c="$(expr substr "$1" $i 1)"
        case $c in
            [a-zA-Z0-9/.~_-])
                printf "$c"
            ;;
            *)
                printf '%%%02X' "'$c"
            ;;
        esac
        i=$(expr $i + 1)
    done
}

if [ $# -ne 1 -a -t 0 ] || [ "$1" = "-h" ] || [ "$1" = "--help" ]
then
    usage
fi

check_command awk gawk
check_command java default-jre-headless
check_command realpath coreutils

if [ ! -f "$1" -a -t 0 ]
then
    echo >&2 "$1 is not a readable file"
    exit 2
fi

script_path="$(dirname $(realpath "$0"))"
awk_script="$script_path/swiss-qr-decode-en.awk"
case "$LANG" in
    de*)
        awk_script="$script_path/swiss-qr-decode-de.awk"
    ;;
    fr*)
        awk_script="$script_path/swiss-qr-decode-fr.awk"
    ;;
    it*)
        awk_script="$script_path/swiss-qr-decode-it.awk"
    ;;
esac
if [ ! -f "$awk_script" ]
then
    echo >&2 "$awk_script is not a readable file"
    exit 3
fi

if [ ! -t 0 ]
then
    { echo; echo; cat -; } | awk -f "$awk_script"
    exit 0
fi

img_uri=file://$(urlencode "$(realpath "$1")")
if message=$(java -Dfile.encoding=UTF-8 -jar "$script_path/zxing-javase-3.4.1-jar-with-dependencies.jar" "$img_uri")
then
    case "$message" in
        *"format: QR_CODE, type: TEXT"*)
            printf "%s" "$message" | awk -f "$awk_script"
            exit 0
        ;;
    esac
fi
echo >&2 "Failed to find or decode the QR code in image $1. Things to check:"
echo >&2 "- is the barcode large enough in the image?"
echo >&2 "- is the barcode mostly in focus?"
echo >&2 "- is there sufficient contrast/illumination?"
echo >&2 "- if all else fails, try to cover up the Swiss cross in the QR code with Tipp-Ex or fill it in with a black marker."
exit 4


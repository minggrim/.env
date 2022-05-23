#!/bin/bash

if [[ -z $1 ]] | [[ -z $2 ]]; then
    echo "Usage: $(basename "$0") <interface> <port>"
    exit -1
fi

tcpdump -i $1 -s 0 -X "tcp dst port $2 and (tcp[((tcp[12:1] & 0xf0) >> 2):4] = 0x504f5354) or (tcp[((tcp[12:1] & 0xf0) >> 2):4] = 0x47455420)"

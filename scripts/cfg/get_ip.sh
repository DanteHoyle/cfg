#!/usr/bin/env bash

option="$1"

case $option in
    4)
        ip=$(curl -s -4 ifconfig.me)
        ;;
    6)
        ip=$(curl -s -6 ifconfig.me)
        ;;
    *)
        iface=$(ip -o -4 route show to default | awk '{print $5}')
        ip_cidr=$(ip -o -4 addr show dev "$iface" | awk '{print $4}')

        if [[ -n "$ip_cidr" ]]; then
            echo "$ip_cidr"
        else
            echo "no-ip"
        fi
        ;;
esac

echo "$ip"


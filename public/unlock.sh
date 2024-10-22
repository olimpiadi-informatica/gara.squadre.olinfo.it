#!/bin/sh -e

WS="131.114.2.138"
DOMAIN="squadre.olinfo.it"  # usiamo vecchio dominio per retrocompatibilita'
                            # tanto sed cancella lo stesso la cosa giusta

for IPTABLES in "/sbin/iptables" "/sbin/ip6tables"; do
    $IPTABLES -P INPUT ACCEPT
    $IPTABLES -P FORWARD ACCEPT
    $IPTABLES -P OUTPUT ACCEPT
    $IPTABLES -F
    $IPTABLES -X
done

sed -i "/$DOMAIN/d" /etc/hosts

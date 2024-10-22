#!/bin/sh -e

WS="131.114.2.138"
DOMAIN="gara.squadre.olinfo.it"

for IPTABLES in "/sbin/iptables" "/sbin/ip6tables"; do
    $IPTABLES -P INPUT DROP
    $IPTABLES -P OUTPUT DROP
    $IPTABLES -P FORWARD DROP

    $IPTABLES -A INPUT -i lo -j ACCEPT
    $IPTABLES -A OUTPUT -o lo -j ACCEPT

    $IPTABLES -A OUTPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
    $IPTABLES -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
done

/sbin/iptables -A OUTPUT -d $WS -p tcp -j ACCEPT

echo $WS $DOMAIN >> /etc/hosts

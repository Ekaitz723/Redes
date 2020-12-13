#! /bin/bash
clear 
echo "******"
iptables -t filter -L
#ponemos Blacklisting
iptables -t filter -P FORWARD ACCEPT
iptables -t filter -P INPUT ACCEPT
iptables -t filter -P OUTPUT ACCEPT

echo "LIMPIAMOS LAS REGLAS"
iptables -t filter -F OUTPUT
iptables -t filter -F INPUT
iptables -t filter -F FORWARD

#ahora tod será aceptado



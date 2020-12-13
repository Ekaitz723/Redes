#! /bin/bash
clear 
echo "******"
iptables -t filter -L

iptables -t filter -P FORWARD ACCEPT
iptables -t filter -P INPUT ACCEPT
iptables -t filter -P OUTPUT ACCEPT

echo "LIMPIAMOS LAS REGLAS"
iptables -t filter -F OUTPUT
iptables -t filter -F INPUT
iptables -t filter -F FORWARD

echo "COMENTADO"

#echo "WHITELISTING"
#iptables -t filter -P FORWARD DROP
#iptables -t filter -P INPUT DROP
#iptables -t filter -P OUTPUT DROP
#iptables -t filter -L
#echo "deja pasar el SSH que venga de la LAN 192.168.20.0/24"
#iptables -t filter -A FORWARD -s 192.168.20.0/24 -d 192.168.10.0/24 -p tcp --dport 22 -j ACCEPT
#echo "devuelve algo el SSH"
#iptables -t filter -A FORWARD -d 192.168.20.0/24 -s 192.168.10.0/24 -p tcp --sport 22 -j ACCEPT

#echo "apache enviado"
#iptables -t filter -A FORWARD -d 192.168.30.0/24 -p tcp --dport 80  -j ACCEPT
#iptables -t filter -A FORWARD -d 192.168.30.0/24 -p tcp --dport 443 -j ACCEPT
#echo "devueltas apache"
#iptables -t filter -A FORWARD -s 192.168.30.0/24 -p tcp --sport 80  -j ACCEPT
#iptables -t filter -A FORWARD -s 192.168.30.0/24 -p tcp --sport 443 -j ACCEPT


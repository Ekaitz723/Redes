#! /bin/bash

#limpa terminal
clear

echo "******"

#echo "BLACKLISTING"
#iptables -t filter -P FORWARD ACCEPT
#iptables -t filter -P INPUT ACCEPT
#iptables -t filter -P OUTPUT ACCEPT

#con esto se eliminan las reglas que haya de la ejecución anterior
echo "LIMPIAMOS LAS REGLAS"
iptables -t filter -F OUTPUT
iptables -t filter -F INPUT
iptables -t filter -F FORWARD

#por defecto se utilizará la politica de whitelisting
echo "WHITELISTING"
iptables -t filter -P FORWARD DROP
iptables -t filter -P INPUT DROP
iptables -t filter -P OUTPUT DROP

echo -e "\nESTADO ACTUAL"
iptables -t filter -L

echo "deja pasar el SSH que venga de la LAN 192.168.20/24"
iptables -t filter -A FORWARD -s 192.168.20/24 -d 192.168.30/24 -p tcp --dport 22 -j ACCEPT
echo "devuelve algo el SSH"
iptables -t filter -A FORWARD -s 192.168.30/24 -d 192.168.20/24 -p tcp --sport 22 -j ACCEPT

echo "apache enviado"
iptables -t filter -A FORWARD -d 192.168.30.0/24 -p tcp --dport 80  -j ACCEPT
iptables -t filter -A FORWARD -d 192.168.30.0/24 -p tcp --dport 443 -j ACCEPT
echo "devueltas apache"
iptables -t filter -A FORWARD -s 192.168.30.0/24 -p tcp --sport 80  -j ACCEPT
iptables -t filter -A FORWARD -s 192.168.30.0/24 -p tcp --sport 443 -j ACCEPT

echo "usuario que le apetece ver youtube"
iptables -t filter -A FORWARD -s 192.168.20.0/24 -p tcp --dport 80  -j ACCEPT
iptables -t filter -A FORWARD -s 192.168.20.0/24 -p tcp --dport 443 -j ACCEPT
echo "youtube le devuelve"
iptables -t filter -A FORWARD -d 192.168.20.0/24 -p tcp --sport 80  -j ACCEPT
iptables -t filter -A FORWARD -d 192.168.20.0/24 -p tcp --sport 443 -j ACCEPT


echo "DNS IDA LIBRE"
iptables -t filter -A FORWARD -d 192.168.10.0/24 -p udp --dport 53 -j ACCEPT
echo "DNS VUELTA LIBRE"
iptables -t filter -A FORWARD -s 192.168.10.0/24 -p udp --sport 53 -j ACCEPT
echo 	' '
echo    ' '
echo   '-__-'
iptables -t filter -L







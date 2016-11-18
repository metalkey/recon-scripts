#!/bin/bash
echo "Arpsweep v0.1 - NOTE: ARP only works on a LAN"
echo "Enter first 3 octets (e.g. 192.168.1)"
read octets
for ip in {1..255};do
arping $octets.$ip -c 1 | grep "bytes from" | cut -d")" -f1 | cut -d"(" -f2 >> results.txt &
echo "- $octets.$ip";
done
wait

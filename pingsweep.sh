#!/bin/bash
echo "Pingsweep v0.1"
echo "Enter first 3 octets (e.g. 192.168.1)"
read octets
for ip in {1..255};do
ping $octets.$ip -c 1 -w 1 | grep "bytes from" | cut -d":" -f1 | cut -d" " -f4 >> results.txt &
echo "- $octets.$ip";
done
wait

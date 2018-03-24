#!/bin/bash
# GET RANGE
echo -e "Enter first 3 octets of IP (e.g. 192.168.1): "
read octets
echo -e "Enter first number for final octet (e.g. 0): "
read first
echo -e "Enter last number for final octet (e.g. 255): "
read last

# GENERATE TARGETS.TXT
for final in $(seq $first $last);do echo $octets.$final >> targets.txt;done

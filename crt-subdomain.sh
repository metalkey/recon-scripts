#!/bin/bash
echo "Enter domain name"
read domain
curl "https://crt.sh/?q=%25.$domain" | grep $domain | grep TD | grep -v "%" | cut -d">" -f2 | cut -d"<" -f1 | sort -u > subdomains.txt

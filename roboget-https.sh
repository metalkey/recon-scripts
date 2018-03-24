#!/bin/bash
rm robots-https-results.txt
for ip in $(cat targets.txt);do
echo $ip >> robots-https-results.txt
wget --tries=3 --no-check-certificate --timeout=1 https://$ip/robots.txt
cat robots.txt >> robots-https-results.txt
rm robots.txt
echo "" >> robots-https-results.txt
echo "" >> robots-https-results.txt
done

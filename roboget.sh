#!/bin/bash
rm robots-results.txt
for ip in $(cat targets.txt);do
echo $ip >> robots-results.txt
wget --no-check-certificate --tries=3 --timeout=1 http://$ip/robots.txt
cat robots.txt >> robots-results.txt
rm robots.txt
echo "" >> robots-results.txt
echo "" >> robots-results.txt
done

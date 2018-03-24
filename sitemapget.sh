#!/bin/bash
rm sitemap-results.txt
for ip in $(cat targets.txt);do
echo $ip >> sitemap-results.txt
wget --no-check-certificate --tries=3 --timeout=1 http://$ip/sitemap.xml
cat sitemap.xml | grep "http" >> sitemap-results.txt
rm sitemap.xml
echo "" >> sitemap-results.txt
echo "" >> sitemap-results.txt
done

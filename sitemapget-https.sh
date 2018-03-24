#!/bin/bash
rm sitemap-https-results.txt
for ip in $(cat targets.txt);do
echo $ip >> sitemap-https-results.txt
wget --no-check-certificate --tries=3 --timeout=1 https://$ip/sitemap.xml
cat sitemap.xml | grep "http" >> sitemap-https-results.txt
rm sitemap.xml
echo "" >> sitemap-https-results.txt
echo "" >> sitemap-https-results.txt
done

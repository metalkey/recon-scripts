#!/bin/bash
mkdir archive-get
cd archive-get
clear
echo "This script will query archive.org for the target website and download all results"
echo "Results are stored as archive-results.txt | The script then grabs all of the links from the archive-results.txt file and finally runs exiftool over everything and stores the exifdata in exif-results.txt"
echo ""
echo "Enter the target website (e.g. https://www.google.com)"
read website
curl -k "https://web.archive.org/web/*/$website/*" | grep "/web/" | cut -d">" -f2 | cut -d"<" -f1 | sort -u > archive-results.txt && for url in $(cat archive-results.txt);do
wget https://web.archive.org/$url
done
wait
exiftool * | sort -u > exif-results.txt

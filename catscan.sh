#!/bin/bash
mkdir catscan-results
cp targets.txt catscan-results
cd catscan-results

# Use ping to get IP addresses. Strip bash colours from output with sed
echo "Generating IP list..."
for host in $(cat targets.txt);do
	hostip=`ping -c 1 -W 1 $host  | grep PING | cut -d"(" -f2 | cut -d")" -f1 | sed -r "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[m|K]//g"`
	echo "$host resolves to $hostip" 
	echo "$host resolves to $hostip" >> host-ip.txt 
	echo $hostip >> temp-hosts.txt
done
wait

# Sort ips and remove dupes
sort -u temp-hosts.txt > hosts.txt
rm temp-hosts.txt

echo "Starting scan..."
# Scan y ports at a time and ouput to results.txt
# To change number of ports scanned at a time, change y, x incrementer, y incrementer
for ip in $(cat hosts.txt);do
	x=0
	y=1000
	while [ $y -le 66000 ];do
		echo "Scanning $ip (Ports $x - $y)"
		for num in $(seq $x $y);do
			netcat -vzn -w 1 $ip $num >> results.txt 2>&1 &
		done
		wait
		x=$(( $x + 1000 ))
		y=$(( $x + 1000 ))
		grep $ip results.txt | grep " open" results.txt | sort -u
	done
done
grep $ip results.txt | grep " open" results.txt | sort -u > open-ports.txt

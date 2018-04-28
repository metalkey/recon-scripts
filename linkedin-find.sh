#!/bin/bash
for email in $(cat emails.txt);do
firefox "https://www.linkedin.com/sales/gmail/profile/viewByEmail/$email"
sleep 3
done

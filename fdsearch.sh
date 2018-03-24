#!/bin/bash
echo "Full Disclosure Search v0.5"
read -p "Enter search keywords: " keywords
firefox https://www.google.com/#q=$keywords+site:http:%2F%2Fseclists.org%2Ffulldisclosure&search_plus_one=form &

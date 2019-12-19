#!/bin/bash

command -v hashcat >/dev/null 2>&1 || { echo 'hashcat required but not installed... exiting.'; exit 1; }
command -v md5sum  >/dev/null 2>&1 || { echo 'md5sum required but not installed... exiting.';  exit 1; }

PASSWORDS="password apple pears mango banana pineapple"
FILE=data/hashes.txt
>$FILE # empty the file

for PW in $PASSWORDS; do
  # store hashes
  echo -n $PW | md5sum | cut -d ' ' -f1 >> $FILE
done

# should find 'apple', 'pears', and 'mango'
hashcat -a 3 $FILE ?l?l?l?l?l --potfile-disable

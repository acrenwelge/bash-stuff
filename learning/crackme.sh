#!/bin/bash

# requires these
command -v crunch > /dev/null 2>&1 || { echo 'crunch required but not installed. Exiting'; exit 1; }
command -v sha256sum > /dev/null 2>&1 || { echo 'sha256sum required but not installed. Exiting'; exit 1; }

# Store the password and its hash
read -p "What password would you like to crack? " PASSWORD
LEN=${#PASSWORD}
HASH=$(echo $PASSWORD | sha256sum)

# generate password combinations with crunch and save to file
FILE=password-guesses.txt
crunch $LEN $LEN -o $FILE

START=$(date +%s)
cat $FILE | while read line ; do 
  GUESS=$(echo $line | sha256sum)
  if [[ $GUESS == $HASH ]]; then
    echo "Password has been cracked! it is: $line";
    break;
  fi
done
END=$(date +%s)
let DIFF=$END-$START

echo "Removing temporary password guess file $FILE..."
rm $FILE

echo "Time to crack: $DIFF seconds"

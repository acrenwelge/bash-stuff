#!/bin/bash

# Sample usage: ./menu.sh a b c

# PS3 env variable used for user prompt
PS3="Choose one of the above options:"
# simple menu from the local directory
select fname in *;
do
  echo you picked $fname \($REPLY\);
  break;
done

while [ $# -gt 0 ]; do
  # default uses $@ (positional params)
  select PARAM;
  do
    echo "You selected $PARAM... removing next parameter"
    shift; # removes the next param
    break;
  done
done 

# case statements with select
QUIT='Option 2'
select OPT in "Option 1" "$QUIT" "Option 3";
do
  case $OPT in
        "$QUIT")
          echo "Exiting."
          break
          ;;
        *)
          echo "You picked $OPT ($REPLY)"
          ;;
  esac
done

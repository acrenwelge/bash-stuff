#!/bin/bash

# basic equality tests
# algebraic
if [ 3 -eq 3 ]; then
  echo 'this should print'
fi

# strings
if [ "hi" == "hi" ]; then
  echo 'strings are equal'
fi

if [ -n "foo" ]; then
  echo 'this WILL print b/c string is not empty'
fi

if [ -z "foo" ]; then
  echo 'this WILL NOT print b/c string is not empty'
fi

touch myfile.txt
mkdir mydir

# test whether a file exists
if [ -e myfile.txt ]; then
  echo 'the file exists!'
fi

if [ -d mydir ]; then
  echo 'the directory exists!'
fi

rm myfile.txt
rmdir mydir

# test whether a command exists
if [ -z "$(command -v asfoi)" ]; then
  echo 'command asfoi not installed!'
fi

if [ -n "$(command -v curl)" ]; then
  echo 'curl is installed!'
fi

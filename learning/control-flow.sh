#!/bin/bash

echo '============='
echo 'IF STATEMENTS'
echo '============='
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
elif [ 5 -gt 3 ]; then # demonstrate use of 'elif' here
  echo 'Yes! 5 is greater than 3'
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

echo '========='
echo 'FOR LOOPS'
echo '========='
# by default, uses $@ (positional parameters)
for i; do echo "Param is: $i"; done

# otherwise, iterate over words, strings, numbers..
for j in "first" "second" "third"; do echo $j; done

# can also use a variable as well as command substitution
for k in $(seq 10); do
  echo "The number is " $k;
done

echo 

echo '==========='
echo 'WHILE LOOPS'
echo '==========='
# the syntax is: while CONTROL-COMMAND; do CONSEQUENT-COMMANDS; done
# when the CONTROL-COMMAND fails, the loop exits
i=0
while [ $i -lt 3 ]; do
  echo "The number is $i"
  let i++
done

while true; do
  echo "Press q to quit!"
  read key
  if [ $key == 'q' ]; then
    break
  else
    echo 'Still running!'
  fi
done

echo '==========='
echo 'UNTIL LOOPS'
echo '==========='
number=10
until [ $number -lt 5 ]; do
  echo $number
  let number--
done

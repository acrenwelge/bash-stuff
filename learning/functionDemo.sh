#!/bin/bash

# $1 - value

# function declaration
function firstfunc {
  ls -la  
}

# another way to declare a function
# no params are ever put in the () - args are passed when executed and referred to through $1-$9 variables
secfunc() { # note - nothing in the ()...
  cd $1 # but we still access the argument here
  # use $1-$9 to get params passed in
  local MYVAR='test me out'
}

thirdfun() {
  # we don't return values, but we can set a return status
  # 0 means success
  # non-0 return status means an error occurred
  if [ -z $1 ]
    then echo 'ERROR: must specify argument to this script'; return -1
  fi
  if [ $1 -gt 5 ] 
    then
    echo 'bad value'
	return -1
  else
    echo 'good value'
	return 0 # all good here!
  fi
}

# brace expansion
# preamble{comma-separated-list}postscript --> item1 item2
echo foo{apple,banana}bar # fooapplebar foobananabar

firstfunc

secfunc '../'

# this will be blank because MYVAR was a local variable in secfunc
echo $MYVAR

thirdfun $1

echo Last exit code was $?

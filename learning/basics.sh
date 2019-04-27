#!/bin/bash

# a few ways to run this file:
# bash basics.sh (reads the file to bash)
# source basics.sh (runs the script in the same shell session - useful for exporting env variables)
# . basics.sh (same as above)
# ./basics.sh (runs the script using the interpreter given with the shebang on line 1)

echo VARIABLES
# viewing environment variables
echo "The value of the home variable is: "
echo $HOME
# you can use variables like above, but it's a good idea to put them in quotes
echo "$HOME"

# note that "double quotes" allows using variable / command substitution
# but using 'sinlge quotes' is always a literal string

# built-in params
echo Name of file / process is $0
echo First param is $1
echo Second param is $2
echo etc...
echo There are $# params to the script which are: $@
echo Exit status of last command is $?
echo Process id of the shell: $$
echo Current option flags: $-
echo Here is a random number between 0 and 32767: $RANDOM
echo Number of seconds since start of script: $SECONDS
echo Printed after reading command and before execution: $PS0
echo Prompt string: $PS1
echo Secondary prompt string: $PS2
echo Used for the select command: $PS3
echo Bash will wait $TMOUT seconds for the 'read' command timeout

echo && echo "COMMANDS & SUBSTITUTION"
# issue a command
echo "The output of the pwd command is: "
pwd

# that's boring, grab output and make it readable
echo "The value of the pwd command is $(pwd)"

# assign command output to a variable
output=$(pwd)
echo "The value of the output variable is ${output}"
echo "The value of the output variable is $output" # this is a shorthand way of writing the above, but it's less flexible

# view data on the command line
echo "I saw $@ on the command line"
echo "The first argument is $1"
echo "The second argument is $2"
echo "etc..."

echo && echo "USER INPUT"
# read data from the user
echo "Enter a value: "
read
echo "You just entered $REPLY"

# concatenate user input with command output
echo "Enter a file extension: "
read ext
touch "yourfile.${ext}"
echo "Created yourfile.${ext}"
rm "yourfile.$ext"
echo "Removed yourfile.$ext"

# check to see if a file exists
if [ -d /etc/sysconfig ]; then
   echo "That file is there and a directory"
else
   echo "Not there or not a directory"
fi



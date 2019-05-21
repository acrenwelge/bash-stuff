#!/bin/bash

# STRINGS
# normal variable declaration - could be anything
MYVAR="hello world"
echo "MYVAR - $MYVAR - has length ${#MYVAR}"
echo "Since FOO is not defined, it uses the default value, ${FOO:-bar}"
# getting a substring of a string variable
echo "From index 3 to 6 is: ${MYVAR:3:6}"

# use "declare" shell built-in to restrict value assignment
# when used in a function, it creates local variables
# -a	Variable is an array.
# -f	Use function names only.
# -i	The variable is to be treated as an integer; arithmetic evaluation is performed when the variable is assigned a value (see Section 3.4.6).
# -p	Display the attributes and values of each variable. When -p is used, additional options are ignored.
# -r	Make variables read-only. These variables cannot then be assigned values by subsequent assignment statements, nor can they be unset.
# -t	Give each variable the trace attribute.
# -x	Mark each variable for export to subsequent commands via the environment.

# ARRAYS
declare -a MYARR
# ARR=(one two three) syntax to initialize via compound assignments
MYARR=(foo bar baz boo blah)
MYARR[5]=bleh
# access via ARR[INDEX] and assign via ARR[INDEX]=value
# index of @ or * means all members of the array
echo ${MYARR[0]} # arrays are 0-based indexed
echo ${MYARR[*]} # braces are neccessary to bypass shell interpretation of expansion operators

# INTEGERS
declare -i MYNUM=3
declare -i WRONG=hello # won't work
echo $WRONG
echo "The value of MYNUM is $MYNUM"

echo "Attempting to change MYNUM to a string..."
MYNUM=string
echo "The value of MYNUM is now $MYNUM"

# CONSTANTS
# use "readonly" to declare constants
readonly PASSWORD="super secret"
echo "PASSWORD defined as $PASSWORD"
echo "attempting to change PASSWORD..."
PASSWORD="12345"
echo "PASSWORD is still $PASSWORD"

foo() {
  declare LOCALVAR="FOO"
  echo "Local variable is $LOCALVAR"
}

foo

echo "Attempting to access local variable: $LOCALVAR"

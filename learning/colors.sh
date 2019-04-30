#!/bin/bash

# Copied from:
# https://stackoverflow.com/questions/5947742/how-to-change-the-output-color-of-echo-in-linux

Reset='\x1b[0m'
Bright='\x1b[1m'
Dim='\x1b[2m'
Underscore='\x1b[4m'
Blink='\x1b[5m'
Reverse='\x1b[7m'
Hidden='\x1b[8m'

FgBlack='\x1b[30m'
FgRed='\x1b[31m'
FgGreen='\x1b[32m'
FgYellow='\x1b[33m'
FgBlue='\x1b[34m'
FgMagenta='\x1b[35m'
FgCyan='\x1b[36m'
FgWhite='\x1b[37m'

BgBlack='\x1b[40m'
BgRed='\x1b[41m'
BgGreen='\x1b[42m'
BgYellow='\x1b[43m'
BgBlue='\x1b[44m'
BgMagenta='\x1b[45m'
BgCyan='\x1b[46m'
BgWhite='\x1b[47m'

echo 'normal text'
# the -e flag is needed to enable the backslashes
echo -e "${FgGreen}some text in green"

echo -e "$Underscore this text is underlined! $Reset"

echo -e "${BgCyan}this has a cyan background $Reset"
echo -e "$FgBlack$BgYellow this is black text on a yellow background $Reset"

# function to color the stderr as red
color()(set -o pipefail;"$@" 2>&1>&3|sed $'s,.*,\e[31m&\e[m,'>&2)3>&1

echo the lines below will be in red
# we can color stderr red inline like below
ls --some-invalid-flag 2> >(sed $'s,.*,\e[31m&\e[m,'>&2)
# or use the function defined above
color ls --some-invalid-flag 

#!/bin/bash

# Idea of this command is to be able to change the terminal background/foreground
# colors at will

# still not sure if this is possible...

# Usage:
# color fg green
# color bg black
# color reset
# color fg green --bright --blink
# Colors!!!
export Reset='\x1b[0m'
export Bright='\x1b[1m'
export Dim='\x1b[2m'
export Underscore='\x1b[4m'
export Blink='\x1b[5m'
export Reverse='\x1b[7m'
export Hidden='\x1b[8m'

export FgBlack='\x1b[30m'
export FgRed='\x1b[31m'
export FgGreen='\x1b[32m'
export FgYellow='\x1b[33m'
export FgBlue='\x1b[34m'
export FgMagenta='\x1b[35m'
export FgCyan='\x1b[36m'
export FgWhite='\x1b[37m'

export BgBlack='\x1b[40m'
export BgRed='\x1b[41m'
export BgGreen='\x1b[42m'
export BgYellow='\x1b[43m'
export BgBlue='\x1b[44m'
export BgMagenta='\x1b[45m'
export BgCyan='\x1b[46m'
export BgWhite='\x1b[47m'

CMD=${1}
COLOR=${2}

case CMD in
  "clear")
    echo -e "${Reset^}"
    exit
  ;;
  "fg")
    echo -e "Fg${COLOR^}"
    exit
    ;;
  "bg")
    echo -e "Bg${COLOR^}"
    exit
    ;;
  *)
    echo "unknown command"
    ;;
esac

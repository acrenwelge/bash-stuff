# this runs when a bash session starts (login shells run ~/.bash_profile)
# here are my helpful configurations, variables, aliases, plugins, etc...

echo Hello, $USER
export PS1="\u \w >> " # prints 'USERNAME /path/to/current/dir >>' for the prompt
export HISTCONTROL=ignoreboth # includes both ignoredups and ignorespace - duplicate commands and those w/ leading whitespace won't be put in history
export HISTIGNORE="clear:history:c:h" # don't add these commands to the history
export EDITOR="vim"
set -o vi

# Enable colors
export CLICOLOR=1
export LSCOLORS=ExGxFxdxCxDxDxxbaDecac

# Setting paths
export GEM_PATH="$HOME/.gem/ruby/2.7.0/bin"
export PATH="$GEM_PATH:$HOME/.cargo/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Helpful aliases
alias hdi='howdoi'
alias python='python3'
alias pip='pip3'
alias lf='ll -rt'
if command -v logo-ls &> /dev/null
then # aliases for https://github.com/Yash-Handa/logo-ls
  alias ils='logo-ls'
  alias ila='logo-ls -A'
  alias ill='logo-ls -alh'
  # equivalents with Git Status on by Default
  alias ilsg='logo-ls -D'
  alias ilag='logo-ls -AD'
  alias illg='logo-ls -alDh'
fi
alias q='exit'
alias c='clear'
alias h='history'
alias gs='git status'
alias gl='git log'
# list the last commit for each remote branch sorted by most recent commit date
alias gitlatest='for branch in `git branch -r | grep -v HEAD`;do echo -e `git show --format="%ci %cr" $branch | head -n 1` \\t$branch; done | sort -r'
# split output into lines - usage example: cat file.txt | linecut ","
function linecut() {
  tr "$1" "\n"
}
if [[ $OSTYPE == 'gnu-linux' ]] || [[ $OSTYPE == 'msys' ]]; then # only for linux, windows
  alias ll='ls -AFlh --group-directories-first'
else # for Mac
  alias ll='ls -AFlh'
  alias vi='mvim -v'
  alias vim='mvim -v'
  alias chrome='./Google\ Chrome.app/Contents/MacOS/Google\ Chrome --kiosk'
  # Add Homebrew to PATH
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# POWERLINE vim plugin - enable in iTerm2 only
if [ "$TERM_PROGRAM" == "iTerm.app" ]; then
  powerline-daemon -q
  POWERLINE_BASH_CONTINUATION=1
  POWERLINE_BASH_SELECT=1
  . '/opt/homebrew/lib/python3.9/site-packages/powerline/bindings/bash/powerline.sh'
fi

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

# Updates PATH for the Google Cloud SDK.
if [[ -f '/Users/Andrew/google-cloud-sdk/path.bash.inc' ]]; then . '/Users/Andrew/google-cloud-sdk/path.bash.inc'; fi
# Enables shell command completion for gcloud.
if [[ -f '/Users/Andrew/google-cloud-sdk/completion.bash.inc' ]]; then . '/Users/Andrew/google-cloud-sdk/completion.bash.inc'; fi


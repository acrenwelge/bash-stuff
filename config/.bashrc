echo Hello, Andrew
export PS1=">>"
export HISTCONTROL=ignoreboth
export HISTIGNORE="clear:history"
export EDITOR="vim"
set -o vi
# enable colors
export CLICOLOR=1
export LSCOLORS=ExGxFxdxCxDxDxxbaDecac

export PATH="$HOME/.cargo/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

alias ls='ls --color=always'
alias ll='ls -AFlh --group-directories-first'
alias lf='ll -rt'
alias q='exit'
alias c='clear'
alias h='history'

powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. '/usr/local/Cellar/python/3.7.3/Frameworks/Python.framework/Versions/3.7/lib/python3.7/site-packages/powerline/bindings/bash/powerline.sh'
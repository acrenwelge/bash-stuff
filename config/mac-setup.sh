# install Homebrew if it's not there
if [ -z "$(command -v brew)" ]; then
  echo 'Homebrew not detected... installing'
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo 'Installing packages via Homebrew...'
brew install ansiweather
brew install awscli
brew install bash
brew install docker
brew install gdbm
brew install genact
brew install git
brew install jq
brew install libevent
brew install ncurses
brew install nmap
brew install oniguruma
brew install openssl
brew install python
brew install readline
brew install sqlite
brew install tmux
brew install xz
brew install zsh
brew install macvim

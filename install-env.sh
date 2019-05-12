#!/bin/bash

# This script configures the local environment with the configuration files found in the 'config' folder:

CONFIG_DIR=./config

# use the first argument (but default to $HOME dir if not specified)
INSTALL_DIR=${1:-$HOME}

echo 'Remove old configuration files (y/n)? y - overwrite; n - rename old files to file.old'
read -n 1 OVERRIDE 

if [ $OVERRIDE != 'n' ]; then
  for i in .bashrc .bash_profile .vimrc 
  do
    mv "$INSTALL_DIR/$i" "$INSTALL_DIR/$i.old"
  done;
fi

# Bash shell config
cp $CONFIG_DIR/.bashrc $HOME/.bashrc

# Vim config
cp $CONFIG_DIR/.vimrc $HOME/.vimrc


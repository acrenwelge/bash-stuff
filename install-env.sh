#!/bin/bash

# This script configures the local environment with the configuration files found in the 'config' folder:

CONFIG_DIR=./config

# use the first argument (but default to $HOME dir if not specified)
INSTALL_DIR=${1:-$HOME}

echo 'Remove old configuration files (y/n)? y - overwrite; n - rename old files to file.old'
read -n 1 OVERRIDE 

if [ $OVERRIDE != 'n' ]; then
do
  for i in .bashrc .bash_profile .vimrc .gitconfig
  do
    mv "$INSTALL_DIR/$i" "$INSTALL_DIR/$i.old"
  done;
done

# Bash shell config
cp $CONFIG_DIR/.bash_profile $INSTALL_DIR/.bash_profile
cp $CONFIG_DIR/.bashrc $INSTALL_DIR/.bashrc

# Vim config
cp $CONFIG_DIR/.vimrc $INSTALL_DIR/.vimrc

# Git config
cp $CONFIG_DIR/.bashconfig $INSTALL_DIR/.bashconfig

# for Mac environments
if [[ $OSTYPE == darwin* ]]; then
  source $CONFIG_DIR/mac-setup.sh
fi

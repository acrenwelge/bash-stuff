#!/bin/sh

# Installs my custom help file
cp ./vim/myhelp.txt ~/.vim/doc/myhelp.txt
cp ./vim/tags ~/.vim/doc/tags

echo "Don't forget to run :helpt ~/.vim/docs from vim to rebuild the help tags"

#!/bin/bash

# Important! the installation directory must be on the $PATH, otherwise the commands cannot be used
INSTALL_DIR=${1:-/usr/local/bin}
UTIL_DIR=utils

echo "Installing scripts to $INSTALL_DIR..."
for FILE in $(ls $UTIL_DIR); do
  # copy the script to the directory, remove the file extension
  echo "installing $FILE..."
  cp $UTIL_DIR/$FILE $INSTALL_DIR/${FILE%.*}
done

# install open source utilities
curl https://raw.githubusercontent.com/coryfklein/sw/master/sw > "$INSTALL_DIR/sw"
chmod a+x "$INSTALL_DIR/sw" # stopwatch utility

echo "Installation complete!"

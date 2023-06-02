#!/bin/bash

# TODO:
# - figure out bash script permissions
# - add overwrite option

# The filename will be parsed to check its extension and determine which type of file to create
# Possible file types are:
# - bash (.sh)
# - java (.java)
# - python (.py)
# - html (.html)

Help()
{
   # Display Help
   echo "This script initializes a file defined by the user (cf == create file)"
   echo
   echo "Syntax: cf [-o|h] FILENAME"
   echo "options:"
   echo "o     Overwrite existing file"
   echo "h     Print this help."
   echo
}

FILE=$1
if [[ -z $FILE ]]; then echo 'Please give file name' && exit; fi

FILENAME=${FILE%.*} # delete everything after the last "."
EXT=${FILE##*.} # delete everything before the last "."

# other script variables
PS3="=>"
GEN_CONTENT="Hello world!"
OVERWRITE='false'

# Functions to create the files
function checkFile() {
  if [ -f $FILE ]; then
    if [ "$OVERWRITE" == 'true' ]; then
      echo "File with same name detected, renaming to $FILE.old"
      mv $FILE $FILE.old
      return
    else
      echo 'File detected with same name, cannot override. Exiting'
      exit 1
    fi
  fi
}

function createBashScript() {
  checkFile $FILE
  echo '#!/bin/bash' > $FILE
  echo "echo $GEN_CONTENT" >> $FILE
}

function createJavaFile() {
  checkFile $FILE
  read -p 'Enter the package: ' PACKAGE
  if [ -n $PACKAGE ]; then
    echo "package $PACKAGE;" > $FILE
  fi
  if [ -z $PACKAGE ];
    then echo 'NO PACKAGE PROVIDED' && exit
  fi

  cat >> $FILE <<EOF
public class $FILENAME {
  public static void main(String[] args) {
    System.out.println(\"$GEN_CONTENT\");"
  }
}
EOF
}

function createPythonScript() {
  checkFile $FILE
  cat >> $FILE <<EOF
def main():
  print("$GEN_CONTENT")

if __name__ == '__main__':
  main()
EOF
}

function createHtml() {
  checkFile $FILE
  cat >> $FILE << EOF
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Hello world</title>
</head>
<body>
  <h1>Hello World!</h1>
</body>
</html>
EOF
}

if [[ $EXT = "sh" ]]; then
  createBashScript
elif [[ $EXT = "java" ]]; then
  createJavaFile
elif [[ $EXT = "py" ]]; then
  createPythonScript
elif [[ $EXT = "html" ]]; then
  createHtml
else echo "invalid extension $EXT"
fi

vi $FILE

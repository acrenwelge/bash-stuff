#!/bin/bash

# TODO:
# - figure out bash script permissions

# This script initializes a file defined by the user (cf == create file)
# Script parameters are:
# -o flag will overwrite existing files
# filename - the name of the file to create

# The filename will be parsed to check its extension and determine which type of file to create
# Possible file types are:
# - bash (.sh)
# - java (.java)
# - python (.py)
# - html (.html)

FILE=$1
FILENAME=${FILE%.*} # delete everything after the last "."
EXT=${FILE##*.} # delete everything before the last "."

# other script variables
PS3="=>"
GEN_CONTENT="Hello world!"
OVERWRITE='true'

# Functions to create the files
function checkFile() {
  if [ -f $FILE ]; then
    if [ "$OVERRIDE" == 'true' ]; then
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
  echo "package $PACKAGE;" > $FILE
  echo '' >> $FILE
  echo "public class $FILENAME {" >> $FILE
  echo "  public static void main(String[] args) {" >> $FILE
  echo "    System.out.println(\"$GEN_CONTENT\");" >> $FILE
  echo '  }' >> $FILE
  echo '}' >> $FILE
}

function createPythonScript() {
  checkFile $FILE
  echo 'def main():' > $FILE
  echo "  print(\"$GEN_CONTENT\")" >> $FILE
  echo '' >> $FILE
  echo "if __name__ == '__main__':" >> $FILE
  echo '  main()' >> $FILE
}

function createHtml() {
  checkFile $FILE
  echo "<!DOCTYPE html>" > $FILE
  echo "<html>" >> $FILE
  echo "<head>" >> $FILE
  echo "  <meta charset="UTF-8">" >> $FILE
  echo "  <title>Hello world</title>" >> $FILE
  echo "</head>" >> $FILE
  echo "<body>" >> $FILE
  echo "  <h1>Hello World!</h1>" >> $FILE
  echo "</body>" >> $FILE
  echo "</html>" >> $FILE 
}

if [ $EXT = "sh" ]; then
  createBashScript
elif [ $EXT = "java" ]; then
  createJavaFile
elif [ $EXT = "py" ]; then
  createPythonScript
elif [ $EXT = "html" ]; then
  createHtml
else echo "invalid extension $EXT" 
fi

#!/bin/bash

# Search through man pages for the second parameter
man $1 | grep -iC2 --color=always $2 | less 

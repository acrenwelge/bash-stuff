#!/bin/bash

# sed stands for "stream editor" - here's a few use cases

# print lines 3 through 5 of this script, then quit
sed -n '3,5p;6q' $0

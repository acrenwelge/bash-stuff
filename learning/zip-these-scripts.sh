#!/bin/bash

# script for creating a tar archive of all the scripts in the current directory

tar -czf "backup-$(date +%Y%m%d)" *.sh

#!/bin/bash
MEM_ALLOCATE=${1:-"1G"} # default to 1 gig of memory
FILE='/swapfile'
echo 'Free memory before swap (MB):'
free -m
echo
echo 'Allocating disk space to swap file...'
sudo fallocate -l $MEM_ALLOCATE $FILE
sudo chmod 600 $FILE
sudo mkswap $FILE
sudo swapon $FILE
echo
# we have to run the next command this way because fstab is owned by root (need to write with sudo)
# The tee command uses streams to write to the fstab file
# By writing to it, we can configure AWS to automatically mount an attached EBS volume after every reboot
echo "$FILE swap swap defaults 0 0" | sudo tee -a /etc/fstab # make the change permanent
echo "Memory allocated. Current free memory (MB):"
free -m
echo
echo "Run 'sudo swapon --show' to view the swapfile"
# To deactivate and remove the swap file:
# sudo swapoff $FILE
# remove entry in /etc/fstab
# sudo rm $FILE

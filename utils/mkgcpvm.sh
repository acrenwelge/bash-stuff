#!/bin/bash

read -p "What should the instance name be? " INSTANCE_NAME 
IMAGE_FAMILY=ubuntu-1404-lts
IMAGE_PROJECT=ubuntu-os-cloud
#DISK_IMAGE=
#DISK_IMAGE_PROJECT=
#SIZE_GB=
#DISK_TYPE=
gcloud compute instances create $INSTANCE_NAME \
  --image-family $IMAGE_FAMILY \
  --image-project $IMAGE_PROJECT
#  --create-disk image=[DISK_IMAGE],image-project=[DISK_IMAGE_PROJECT],size=[SIZE_GB],type=[DISK_TYPE]

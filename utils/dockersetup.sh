#!/bin/bash

# run this to setup docker group so that user doesn't need 'sudo' to talk run docker
if [ -z "$(which docker)" ]; then
  sudo yum install docker -y
fi

echo "Starting up the docker service..."
sudo service docker start

sudo groupadd docker # may or may not exist already
sudo usermod -aG docker $USER
newgrp docker # activate changes to group

echo "Testing out docker command:"
docker ps
if [ $? -eq 0 ]; then
  echo "SUCCESS"
else
  echo "Something went wrong..."
fi

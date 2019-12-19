#!/bin/bash

# Note: requires AWS CLI to be installed and configured w/ proper credentials

# create a t2.micro instance of Amazon Linux in us-east-1a with pre-configured security group & key pair
echo "Spinning up EC2 instance..."
IMAGE=ami-0ff8a91507f77f867 
SIZE=t2.micro
KEY=andrew-ec2-key 
SEC_GRP=sg-028e174ec1aa02227 
SUBNET=subnet-e2f0a086

aws ec2 run-instances --image-id $IMAGE --count 1 --instance-type $SIZE --key-name $KEY --security-group-ids $SEC_GRP --subnet-id $SUBNET

# terminate with:
# aws ec2 terminate-instances --instance-id <id1> <id2> ...

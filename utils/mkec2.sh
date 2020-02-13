#!/bin/bash

# Note: requires AWS CLI to be installed and configured w/ proper credentials
TIMEOUT=5

# create a t2.micro instance of Amazon Linux in us-east-1a with pre-configured security group & key pair
echo "Spinning up EC2 instance..."
# AMIs
AMAZON_LINUX=ami-0ff8a91507f77f867
UBUNTU=ami-04763b3055de4860b

# Config
IMAGE=$UBUNTU
SIZE=m4.large
KEY=andrew-ec2-key
SEC_GRP=sg-028e174ec1aa02227
SUBNET=subnet-e2f0a086

aws ec2 run-instances --image-id $IMAGE --count 1 --instance-type $SIZE --key-name $KEY --security-group-ids $SEC_GRP --subnet-id $SUBNET

echo "Waiting $TIMEOUT seconds for EC2 to initialize..."
sleep $TIMEOUT

echo "All EC2 public IPs:"
aws ec2 describe-instances --query Reservations[*].Instances[*].[InstanceId,PublicIpAddress] --output text | tr -s '\t' '\n'

echo ""
echo "Terminate EC2s with:"
echo 'aws ec2 terminate-instances --instance-id <id1> <id2> ...'

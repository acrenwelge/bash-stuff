#!/bin/bash

# Note: requires AWS CLI to be installed and configured w/ proper credentials

# create a t2.micro instance of Amazon Linux in us-east-1a with pre-configured security group & key pair
aws ec2 run-instances --image-id ami-0ff8a91507f77f867 --count 1 --instance-type t2.micro --key-name andrew-ec2-key --security-group-ids sg-028e174ec1aa02227 --subnet-id subnet-e2f0a086

# terminate with:
# aws ec2 terminate-instances --instance-id <id1> <id2> ...

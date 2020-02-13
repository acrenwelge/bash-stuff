#!/bin/bash

IMG=ami-0ff8a91507f77f867 # amazon linux ami - N. Virginia
SIZE=m4.large
KEY=terraform-temp-key
SECGRP=sg-028e174ec1aa02227 # home ssh access
REGION=us-east-1 # N. Virginia region
winpty -Xallow-non-tty aws.cmd ec2 run-instances --image-id $IMG --count 1 --instance-type $SIZE --key-name $KEY --security-group-ids $SECGRP --region $REGION

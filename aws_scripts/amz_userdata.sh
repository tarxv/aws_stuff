#!/bin/bash

yum update
yum install java-1.8.0 awslogs
yum remove java-1.7.0-openjdk
cd /home/ec2-user
wget https://aws-codedeploy-us-east-1.s3.amazonaws.com/latest/install
chmod +x ./install
./install auto
service codedeploy-agent start

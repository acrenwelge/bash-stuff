#!/bin/bash

# basics:
sudo yum install java-1.8.0-openjdk-devel -y

sudo yum install maven -y
sudo yum install git -y

sudo amazon-linux-extras install tomcat8.5 -y

# Change tomcat port to 8085 (this command edits a file in place, and uses regular expressions to determine what to do
sed -i 's/<Connector port=\"8080\"/<Connector port=\"8085\"/' /etc/tomcat/server.xml
sudo service tomcat start

# jenkins:
sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo
sudo rpm --import http://pkg.jenkins-ci.org/redhat-stable/jenkins-ci.org.key
sudo yum install -y jenkins

# start jenkins:
sudo service jenkins start

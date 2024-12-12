#!/bin/bash

# Install git and clone files to the Web Server 
sudo yum update -y   # For Amazon Linux or CentOS
sudo yum install -y git
cd 
mkdir App
sudo mkdir .aws
cd App
git clone https://github.com/roee4643/MemeGenerator
cd ..

# Ensure that pip is installed and is the latest version
sudo python3 -m ensurepip --upgrade
sudo python3 -m pip install --upgrade pip

# Install and run docker
cd home/ec2-user/App

sudo yum install docker -y
sudo service docker start

sudo docker build -t meme-api .
sudo docker run -p 5000:5000 meme-api
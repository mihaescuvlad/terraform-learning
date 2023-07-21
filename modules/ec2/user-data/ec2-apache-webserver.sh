#!/bin/bash

# Updates
sudo apt update -y

# Install dependencies
sudo apt install -y nginx
sudo apt install -y docker
sudo apt install -y docker.io

# Cloning repositories
git clone "https://github.com/RevianLabs/devops-webapp-sample"

# Deploying repositories
cd /devops-webapp-sample || echo "Failed\n" >> /tmp/failed-cd.txt
sudo docker build -t devops-webapp:1.0 .
sudo docker run -p 8888:5000 devops-webapp:1.0

# Turning on services
service nginx start
sudo systemctl enable nginx -y

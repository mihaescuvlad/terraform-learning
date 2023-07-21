#!/bin/bash

# Updates
sudo apt update -y

# Install dependencies
sudo apt install -y nginx
sudo apt install -y docker
sudo apt install -y docker.io
sudo apt install -y unzip
sudo curl https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip -o awscliv2.zip
sudo unzip awscliv2.zip
sudo ./aws/install

# Cloning repositories
sudo aws s3 sync s3://${bucket_name} /${application_name}
sudo chmod +x /${application_name}/${bucket_name}/mvnw

# Deploying repositories
sudo docker build -t "${application_name}:1.0" "/${application_name}/${bucket_name}"
sudo docker run -p 8080:8080 -e DB_USER="${db_user}" -e DB_PASS="${db_pass}" -e DB_URL="${db_url}" "${application_name}:1.0"

# Turning on services
service nginx start
sudo systemctl enable nginx -y

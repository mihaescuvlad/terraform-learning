#!/bin/bash

apt-get update
apt-get install -y apache2

service apache2 start
systemctl enable apache2

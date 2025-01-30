#!/bin/bash
apt update -y
apt install -y apache2
service apache2 start
EC2ID=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)
echo '<center><h1>Este Webserver foi criado pelos Brabus via Terraform #respeitaospai: EC2ID </h1></center>' > /var/www/html/index.txt
sed "s/EC2ID/$EC2ID/" /var/www/html/index.txt > /var/www/html/index.html

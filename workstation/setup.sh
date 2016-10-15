#!/bin/bash

#setup users
sudo adduser -s /bin/bash devops
sudo gpasswd -a devops wheel

sudo adduser -s /bin/bash student
sudo gpasswd -a devops wheel

# setup keys
sudo mkdir -p /home/devops/.ssh/
sudo cp /vagrant/keys/lab_key.pub /home/devops/.ssh/authorized_keys
sudo cp /vagrant/keys/lab_key.pub /home/devops/.ssh/lab_key.pub
sudo cp /vagrant/keys/lab_key /home/devops/.ssh/lab_key
sudo chown -R devops: /home/devops

# setup keys for student
sudo mkdir -p /home/student/.ssh/
sudo cp /vagrant/keys/lab_key.pub /home/student/.ssh/authorized_keys
sudo cp /vagrant/keys/lab_key.pub /home/student/.ssh/lab_key.pub
sudo cp /vagrant/keys/lab_key /home/student/.ssh/lab_key
sudo cp /vagrant/keys/sshconfig /home/student/.ssh/config
sudo chown -R student: /home/student

# install software
sudo yum -y update
curl -o epel-release-latest-7.noarch.rpm https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
sudo rpm -ivh epel-release-latest-7.noarch.rpm
sudo yum install -y ansible


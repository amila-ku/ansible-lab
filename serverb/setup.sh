#!/bin/bash

#setup users
sudo adduser -s /bin/bash devops
sudo gpasswd -a devops wheel

sudo adduser -s /bin/bash student
sudo gpasswd -a devops wheel

# set nopasswd access
sudo cp /vagrant/devops /etc/sudoers.d/devops

# setup keys
sudo mkdir -p /home/devops/.ssh/
sudo cp /vagrant/keys/lab_key.pub /home/devops/.ssh/authorized_keys
sudo cp /vagrant/keys/lab_key.pub /home/devops/.ssh/lab_key.pub
sudo cp /vagrant/keys/lab_key /home/devops/.ssh/lab_key
sudo cp /vagrant/keys/sshconfig /home/devops/.ssh/config
sudo chown -R devops: /home/devops

# setup keys for student
sudo mkdir -p /home/student/.ssh/
sudo cp /vagrant/keys/lab_key.pub /home/student/.ssh/authorized_keys
sudo cp /vagrant/keys/lab_key.pub /home/student/.ssh/lab_key.pub
sudo cp /vagrant/keys/lab_key /home/student/.ssh/lab_key
sudo cp /vagrant/keys/sshconfig /home/student/.ssh/config
sudo chown -R student: /home/student


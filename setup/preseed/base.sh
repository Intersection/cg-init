#!/bin/bash

echo 'ubuntu ALL=NOPASSWD:ALL' > ubuntu
echo 'ubuntu' | sudo -S chmod 440 ubuntu
echo 'ubuntu' | sudo -S chown root:root ubuntu
echo 'ubuntu' | sudo -S mv ubuntu /etc/sudoers.d/

sleep 30;
sudo apt-get -y update;
sudo apt-get install -y git puppet zip virtualbox-guest-additions-iso;
mkdir /home/ubuntu/.ssh;
wget --no-check-certificate 'https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub' -O /home/ubuntu/.ssh/authorized_keys;

#Utilize Puppet to load packages
sudo puppet apply --debug --verbose --modulepath=/home/ubuntu/puppet/modules /home/ubuntu/puppet/manifests/site.pp;


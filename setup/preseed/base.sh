#!/bin/bash

echo 'ubuntu ALL=NOPASSWD:ALL' > ubuntu
echo 'ubuntu' | sudo -S chmod 440 ubuntu
echo 'ubuntu' | sudo -S chown root:root ubuntu
echo 'ubuntu' | sudo -S mv ubuntu /etc/sudoers.d/

sleep 30;
sudo apt-get -y update;

#we only want to include virtualbox and ssh keys if this is vagrant build, not AMI
hostnameStr=$(hostname)
if [[ ${hostnameStr} =~ ubuntu-* ]]; then
    sudo apt-get install -y git puppet zip virtualbox-guest-additions-iso;
    mkdir /home/ubuntu/.ssh;
    wget --no-check-certificate 'https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub' -O /home/ubuntu/.ssh/authorized_keys;
else
    sudo apt-get install -y git puppet zip
fi

#Utilize Puppet to load packages
sudo puppet apply --debug --verbose --modulepath=/home/ubuntu/puppet/modules /home/ubuntu/puppet/manifests/site.pp;


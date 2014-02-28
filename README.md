CG-INIT TEMPLATE
================

	The goal of cg-init is to create a git-based project repo template. The cg-init flow is as follows:

        1) A CG github admin clones this repo via the cg-init command
        2) The initial developer edits the puppets site.pp and module init.pp files for the respective project
        3) All onboarding members of the project change directory to setup/ and run the install.sh <arch> script to bootstrap their environment.

Setup Instructions
==================

The following are prerequisites for using the install script: [Vagrant](http://www.vagrantup.com/), [Virtualbox](https://www.virtualbox.org/), [Packer](http://www.packer.io/). The versions listed below were the most up-to-date as of November 6, 2013.

Installing Vagrant:

- [Download and install 1.3.5 dmg](http://downloads.vagrantup.com/)

Virtualbox:

- [Download and install 4.3.2 dmg for OS X x386](https://www.virtualbox.org/wiki/Downloads)

Packer:

- [Download zip file 0.4.1 for amd64 mac](https://dl.bintray.com/mitchellh/packer/0.4.1_darwin_amd64.zip) *Note CG has only verified cg-init up to 4.1
- Unzip, rename folder to "packer", and move folder to /usr/local/bin
- Add /usr/local/bin/packer to $PATH


To boostrap environment run, change directory to setup/ and run the install.sh script passing the host architecture as an agrument:

     $ ./install.sh mac
     
It may appear that the installation is hanging at the output below, but it is not, and you should not try to kill the process:

    ==> virtualbox: Waiting for SSH to become available...

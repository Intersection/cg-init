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

- [Download and install 1.6.x dmg](http://downloads.vagrantup.com/)

Virtualbox:

- [Download and install 4.3.2 dmg for OS X x386](https://www.virtualbox.org/wiki/Downloads)

To boostrap environment run, change directory to setup/ and run the install.sh script`:

     $ ./install.sh 
     

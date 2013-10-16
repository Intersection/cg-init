Environments
=============

This directory should house build tools for environments. Use puppet, homebrew, etc, in the appropriate shell file to build out everything needed for this project on the given platform.

If manual instructions exist in addition to build tools (for things that cannot be scripted, such as hardware integration or software purchases), use this file for instructions.


Manual Instructions
====================

None, unless someone edits this.

Initial Setup
=============

After the initial checkout of this template, a developer must edit the needed puppet modules configurations to set config options such as database name, db user, db pass, etc. They must also edit the puppet/manifests/init.pp to include the needed dependencies. 
This will be a one time setup.


Onboarding Instructions
=======================

If you are an onboarding developer, the configurations have already been setup. Simply run the ./install.sh <arch> script for your respective host architecture.

Directory Structure
====================

    |---mac/ This contains the packer specific file for mac based host OS
    |
    |---linux/ This contains the packer specific file for linux based host OS
    |
    |---windows/ This contains the packer specific file for windows based host OS
    |
    |---preseed/ This contains the base preseed configuration 
    |    |
    |    |---base.sh The base install script
    |
    |---puppet/ This contains the puppet modules and receipes
         |
         |---manifets/ This contains the main puppet manifest
         |      |
         |      |---init.pp This file is the main puppet manifest. 
         |
         |---modules/ This contains the different modules that may be included in a project


Packer Commands
===============


Validate the packer file

    $ packer validate <arch>/packer-<arch>.json


Build packer

    $ packer build <arch>/packer-<arch>.json 


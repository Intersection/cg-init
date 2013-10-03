Environments
=============

This directory should house build tools for environments. Use puppet, homebrew, etc, in the appropriate shell file to build out everything needed for this project on the given platform.

If manual instructions exist in addition to build tools (for things that cannot be scripted, such as hardware integration or software purchases), use this file for instructions.


Manual Instructions
====================

None, unless someone edits this.

Initial Setup
=============

    After checking out this template, a developer must update each of the packer specific architecture packer-<arch>.json files to include the appropriate language preseed files. For example to include additional java language dependencies update the provisioners section as follows:
        "scripts": [
          "preseed/base.sh",
          "preseed/java-preseed/base.sh"
      ]        


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


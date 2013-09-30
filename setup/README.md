Environments
=============

This directory should house build tools for environments. Use puppet, homebrew, etc, in the appropriate shell file to build out everything needed for this project on the given platform.

If manual instructions exist in addition to build tools (for things that cannot be scripted, such as hardware integration or software purchases), use this file for instructions.


Manual Instructions
====================

None, unless someone edits this.


Directory Structure
====================

    |---mac/ This contains the packer specific file for mac based host OS
    |
    |---linux/ This contains the packer specific file for linux based host OS
    |
    |---windows/ This contains the packer specific file for windows based host OS
    |
    |---preseed/ This contains the base preseed configuration as well as language specific based configurations
         |
         |---base.sh The base install script
         |
         |---java-preseed This contains the java specific configurations
         |
         |---php-preseed This containst the php specific configurations
         |
         |---python-preseed This contains the python specific configurations

(Please fill out this README as a courtesy to your team and maintainers)


Project Name
=============
What is this project all about? 


Setup Instructions (git cg-init)
--------------------------------
Approach A: Clone the Repo
First, you need the cg-init repo somewhere on your system. If you have a projects folder, just clone the repo down. That way, you can contribute back up! 
Then, add the full path to the cg-init/tools/ folder to your $PATH variable (in, for example, ~/.profile)

```bash
git clone git@github.com:controlgroup/cg-init.git
cd cg-init
```
Then, in your profile:

```bash
export PATH=$PATH:/path/to/cg-init/tools/
source ~/.profile
git cg-init
```

This is, of course, a security risk. Adding a random folder to your path means I'll hijack your 'git' command and make it send me all your bitcoins. 
The paranoid should use the second path.

Approach B: Grab the script and put it in your $PATH somewhere.
```bash
cd WHEREVER
curl -O https://raw.github.com/controlgroup/cg-init/master/tools/git-cg-init
chmod +x git-cg-init
export PATH=$PATH:/path/to/folder/with/git-cg-init/
source ~/.profile
git cg-init
```

Setup Instructions (project)
--------------------------------
To set up a new project, you can use the macro once it's in your $PATH. 

```bash
git cg-init organizationName projectName localDirName
```

Answer [Y] when asked if the remote repo (on github) exists. Unless it doesn't. In that case, you'll need to set it up afterwards with normal ol' git commands. Github will give you instructions when you create your repo. Look for this line:
```bash
git remote add...
```


Once Setup
-----------
Make sure you go into your new project, rather than the cg-init folder you cloned. The cg-init clone is like a library you need.








Team
----
Product Owner: 

Platform Architect:

Design Architect:

Scrum Master:

QA Manager: Dan Meltz @danmeltz

Support Manager: Jon Spooner @jonspooner


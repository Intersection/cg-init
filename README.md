cg-init
=======

This is a general-purpose project template for Control Group projects.

This should scale nicely to various project types, including:

* Cinder
* iOS
* Java/Groovy/JRuby
* PHP
* Node.js
* HTML5
* Processing

Usage
=====

Usage is simple.

1. Make sure cg-git-init is in your $PATH and is executable (chmod +x cg-git-init). I place mine in ~/bin and add ~/bin to my path.
2. Go to the directory where you'd like to create your project. I use ~/Projects
3. Run this command, substituting "myShinyNewProject" with the name of your project. Ideally (the script assumes this), you already have a remote git repo on the controlgroup account with the same name. `git cg-init myShinyNewProject`
4. If you don't have a remote by the same name, create one, do a `git pull origin master` and you should be set.
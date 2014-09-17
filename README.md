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

This will log a few items of interest to the screen. Please take note of the generated private key.

    ==> app: +------------------------------------------------------------------------------+
    ==> app: | Insecure SSH key installed                                                   |
    ==> app: |                                                                              |
    ==> app: | DO NOT expose port 22 on the Internet unless you know what you are doing!    |
    ==> app: |                                                                              |
    ==> app: | Use the private key bellow to connect with user root                         |
    ==> app: +------------------------------------------------------------------------------+
    ==> app: -----BEGIN RSA PRIVATE KEY-----
    ==> app: MIIEpQIBAAKCAQEA1ZswRub+3DvSEnBiyM5YRpRzRYV88vO1X2j867u6pyCHUNXv
    ==> app: RRCr7ahMLPIVYsZwlHb4sF+Zb3DJOBH+E265o93chdMxbWG44k0spf10JRevA0JX
    ==> app: NrEwHR8vesCR74e5MuddbSic88lsEqnnn+Fo3lStvE6nBp6tbqdEu7GhTtHSYejn
    ==> app: wwINnA5ocsHkd1YE9L2Scqw1e4bXveTAQnSvhqe33QshGXFpt0tQwRWngah887f2
    ==> app: P54wFSm2C/UyFT7pvIjINKzIi4vUoXz/nU+V7neTmt3XDdjloYg3ycOaX4RSVneO
    ==> app: HCf7hkcEKbzbPzzSrGAAYYC5UzFB+ImsIbtV2wIDAQABAoIBAQCjROxgtX2Gft7y
    ==> app: Ix8Ol9IXmK6HLCI2XZt7ovb3hFWGGzHy0qMBql2P2Tzoed1o038Hq+woe9n+uTnE
    ==> app: dtQ6rD6PByzgyW2VSsWTjCOdeJ5HH9Qw7ItXDZZWHBkhfYHOkXI4e2oI3qshGAtY
    ==> app: NLALn7KVhioJriCyyaSM2KOLx5khcY+EJ1inQfwQJKqPGsdKc72liz07T8ifRj+m
    ==> app: NLKtwrxlK3IXYfIdgLp/1pCKdrC80DhprMsD4xvNgq4pCR9jd4FoqM9t/Up5ppTm
    ==> app: +p6A/bDwdIPh6cFFeyMP+G3+bTlW1Gg7RLoNCc6qh53WWVgEOQqdLHcQ8Ge4RLmb
    ==> app: wLUmnRuRAoGBAPfXYfjpPZi8rPIQpux13Bs7xaS1/Fa9WqrEfrPptFdUVHeFCGY8
    ==> app: qOUVewPviHdbs0nB71Ynk9/e96agFYijQdqTQzVnpYI4i8GiGk5gPMiB2UYeJ/HZ
    ==> app: mIB3jtWyf6Z/GO0hJ1a6mX0XD3zJGNqFaiwqaYgdO1Fwh9gcH3O2lHyjAoGBANyj
    ==> app: TGDBYHpxPu6uKcGreLd0SgO61PEj7aOSNfrBB2PK83A+zjZCFZRIWqjfrkxGG6+a
    ==> app: 2WuHbEHuCGvu2V5juHYxbAD/38iV/lQl/2xyvN1eR/baE3US06qn6idxjnmeNZDy
    ==> app: DelAx1RGuEvLX1TNAzDTxBwYyzH3W2RpKAUAD11pAoGAN38YJhd8Pn5JL68A4cQG
    ==> app: dGau/BHwHjAqZEC5qmmzgzaT72tvlQ0SOLHVqOzzHt7+x45QnHciSqfvxnTkPYNp
    ==> app: FJuTGhtKWV12FfbJczFjivZgg63u/d3eoy2iY0GkCdE98KNS3r3L7tHCGwwgr5Xe
    ==> app: T2Nz3BHHnZXYJVEuzcddeocCgYEAnhDjPAHtw2p0Inxlb9kPb6aBC/ECcwtBSUkL
    ==> app: IOy/BZA1HPnxs89eNFAtmwQ8k2o6lXDDSJTJSuZj5CdGVKfuU8aOUJz/Tm2eudxL
    ==> app: A/+jLJhJyCBthhcJyx3m04E4CAr+5ytyKeP9qXPMvoghcNg66/UabuKYV+CU+feX
    ==> app: 8xUa7NkCgYEAlX8HGvWMmiG+ZRFB//3Loy87bBxGlN0pUtCEScabZxdB2HkI9Vp7
    ==> app: Yr67QIZ3y7T88Mhkwam54JCjiV+3TZbSyRMOjkqf7UhTCZC6hHNqdUnlpv4bJWeW
    ==> app: i5Eun8ltYxBnemNc2QGxA4r+KCspi+pRvWNGzL3PFVBGXiLsmOMul78=
    ==> app: -----END RSA PRIVATE KEY-----
    ==> app:  
    ==> app:  
    

This key will need to be manually copied into a file name 'cg.key' located within the working direcotry of the Vagrantfile.     

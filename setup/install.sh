
if [ -z "$1" ] 
then
  echo "Usage: install arch"
else
  #do packer install
  echo "Starting packer build at " `date`  
  packer build $1/packer-$1.json
  echo "Packer build complete at " `date`

  #vagrant init
  echo "Starting Vagrant initialization at " `date`
  vagrant init dev packer_virtualbox_virtualbox.box 
  echo "Vagrant initilization complete at " `date`

  #add ssh user
  echo "Adding ssh user..."
  sed -i "" '36i\'$'\n''config.ssh.username = "ubuntu"' Vagrantfile 
  
  echo "Bringing Box Up..." `date`
  #vagrant up
  vagrant up
  echo "Vagrant box is up..." `date`
  echo "Attempting to ssh to box..." `date`

  #vagrant ssh
  vagrant ssh
fi


if [ -z "$1" ] 
then
  echo "Usage: install arch"
else
  #do packer install
  echo "Starting packer build..."
  packer build $1/packer-$1.json
  echo "Packer build complete..."
  echo "Starting Vagrant initilization..."
  #vagrant init
  vagrant init dev packer_virtualbox_virtualbox.box 
  echo "Vagrant initilization complete..."
  #add ssh user
  echo "Adding ssh user..."
  sed -i "" '36i\'$'\n''config.ssh.username = "ubuntu"' Vagrantfile 
  echo "Bringing Box Up..."
  #vagrant up
  vagrant up
  echo "Vagrant box is up..."
  echo "Attempting to ssh to box..."
  #vagrant ssh
  vagrant ssh
fi

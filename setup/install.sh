if [ -z "$1" ] 
then
  echo "Usage: install OS-architechture"
else
  #Turn on debug
  #VAGRANT_LOG=info 
  
  #install vbguest vagrant plugin
  isVBPluginInstalled=$(vagrant plugin list | grep -c "vagrant-vbguest")
  if [ $isVBPluginInstalled -ne 1 ]; then
     vagrant plugin install vagrant-vbguest  
  fi
 
  #Check for existing files and remove before attempting new build
  if [ -e "Vagrantfile" ]
  then
  echo "Removing current Vagrantfile"
  vagrant destroy
  vagrant box remove dev
  rm Vagrantfile
  fi 
  
  if [ -e "packer_virtualbox_virtualbox.box" ]
  then  
  echo "Removing current box"
  rm packer_virtualbox_virtualbox.box
  fi
 
  if [ -e ".vagrant" ]
  then
  echo "Removing current vagrant configs"
  rm -r .vagrant
  fi
  
  #do packer install
  echo "Starting packer build at " `date`  
  #PACKER_LOG=1 packer build -only=virtualbox $1/packer-$1.json
  packer build -only=virtualbox-iso $1/packer-$1.json
  echo "Packer build complete at " `date`

  #vagrant init
  echo "Starting Vagrant initialization at " `date`
  vagrant init dev packer_virtualbox_virtualbox.box 
  echo "Vagrant initilization complete at " `date`

  #add ssh user
  echo "Adding ssh user..."
  sed -i "" '36i\'$'\n''config.ssh.username = "ubuntu"' Vagrantfile 

  #configure shared folder
  echo "Configuring shared folder..."
  sed -i "" '42i\'$'\n''config.vm.synced_folder "../product", "/home/ubuntu/product"' Vagrantfile

  #configure port forwarding
  echo "Configuring port forwarding..."
  sed -i "" '23i\'$'\n''config.vm.network :forwarded_port, guest: 80, host: 8080' Vagrantfile
  
  #configure memory for box
  echo "Configuring box memory..."
  sed -i "" '57c\'$'\n''config.vm.provider :virtualbox do |vb|'$'\n' Vagrantfile
  sed -i "" '58c\'$'\n''vb.customize ["modifyvm", :id, "--memory", "2048"]'$'\n' Vagrantfile
  sed -i "" '59c\'$'\n''end'$'\n' Vagrantfile

  echo "Bringing Box Up..." `date`
  #vagrant up
  vagrant up
  echo "Vagrant box is up..." `date`
  echo "Attempting to ssh to box..." `date`

  #vagrant ssh
  vagrant ssh
fi

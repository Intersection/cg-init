#Turn on debug
#VAGRANT_LOG=info 
APPLICATION_NAME=app

#install vbguest vagrant plugin
isVBPluginInstalled=$(vagrant plugin list | grep -c "vagrant-vbguest")
if [ $isVBPluginInstalled -ne 1 ]; then
   vagrant plugin install vagrant-vbguest  
fi

echo "Bringing up Container at " `date`

# Bring up Docker container
vagrant up $APPLICATION_NAME --provider=docker

echo "Displaying docker logs, Please take note of the private key..."
vagrant docker-logs $APPLICATION_NAME

echo "Attempting to ssh to box..." `date`

#vagrant ssh
vagrant ssh

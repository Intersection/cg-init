if [ $2 ]
	#project vm name set from command line
	then PROJECTNAME=$2
else 
	PROJECTNAME=dev
fi
echo $PROJECTNAME

python make_dir_list.py
./env_list.sh



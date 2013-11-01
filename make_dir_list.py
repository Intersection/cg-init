import os 
import stat 

#create a script file 
envList = open('env_list.sh','w')


#read the contents of the directory

#write contents of directory to the .sh file using proper syntax

for i in os.listdir('envItems'):
	envList.write('echo ' + i + '\n')
	#save and close file
envList.close()

changeStatus = os.stat('env_list.sh')
os.chmod('env_list.sh', changeStatus.st_mode | stat.S_IEXEC)
	

 
import os 
import subprocess
import stat


for i in os.listdir('../../envItems'):
	changeStatus = os.stat('../../envItems/' + i)
	os.chmod( '../../envItems/' + i, changeStatus.st_mode | stat.S_IEXEC)
	subprocess.call('../../envItems/' + i, shell = True )


	

 
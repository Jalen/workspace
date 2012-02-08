import subprocess
import sys
import platform

sysstr = platform.system()

if(sysstr == "Windows"):
    subprocess.Popen('explorer ' + sys.argv[1])
elif(sysstr == "Linux"):
    subprocess.Popen('nautilus ' + sys.argv[1])
else:
    subprecess.Popen('open ' + sys.argv[1])

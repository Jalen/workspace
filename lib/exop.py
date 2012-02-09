#!/usr/bin/python

import os
import sys
import platform
import pdb

sysstr = platform.system()

if(sysstr == "Windows"):
   os.system('explorer ' + sys.argv[1])
elif(sysstr == "Linux"):
    #pdb.set_trace()
    os.system('nautilus ' + sys.argv[1])
else:
    os.system('open ' + sys.argv[1])

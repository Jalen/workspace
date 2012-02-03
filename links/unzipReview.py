# -*- coding:utf-8 -*-

'''
Created on 2011-7-6

@author: Jalen
'''

import os
import os.path
import sys
import subprocess

if not os.path.exists('c:\\temp'):
    os.mkdir('c:\\temp')
    
zipFile = sys.argv[1]

APPS = os.environ.get("APPS")

name = zipFile.split("\\")[-1]
FolderName = name.split(".")[0] 
outputFolder = "c:\\temp\\" + FolderName

#Unzip the package
os.system(APPS + "\\FileReaderCreater\\7-Zip\\7z" + " x " + zipFile + " -y -o" + outputFolder)

#Call the merger
subFolder = os.listdir(outputFolder)[0]
newFolder = outputFolder + "\\" + subFolder + "\\new"
oldFolder = outputFolder + "\\" + subFolder + "\\old"

os.system("C:\PROGRA~2\Araxis\ARAXIS~1.5\Merge " + oldFolder + " " + newFolder)
    

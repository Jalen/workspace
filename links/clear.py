# -*- coding:utf-8 -*-

'''
Created on 2011-6-19

@author: Jalen
'''

import os.path
import sys
import string

def visitDir(dir):
    a = os.listdir(dir)

    for f in a:
        path = dir + '\\' + f
        if (os.path.isdir(path) == True):
            if string.lower(f) <> "Catalyst":
                visitDir(dir + '\\' + f)            
        else :
            os.remove(path)
    os.rmdir(dir)

if __name__ == '__main__':
    if len(sys.argv) <> 2:
        print("USAGE: clear.py <path>")
        exit()
    
    dir = sys.argv[1]
    
#   convert to the absolute path if it is not
    if os.path.isabs(dir):  
        visitDir(dir)
    else:
        visitDir(os.getcwd() + "\\" + dir)
        
    print("done")
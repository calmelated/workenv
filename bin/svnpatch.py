#!/usr/bin/python
# -*- coding: utf-8  -*-

import re
import os
import getopt
import sys

def usage():
    print "Usage: ", sys.argv[0], "[svn path] [from] [to]"
    sys.exit(2)    

if __name__ == '__main__':
    if sys.argv[1] == '':          
        usage()

    print "Read diff file: %s\n" % sys.argv[1]
    fdiff = file(sys.argv[1], 'r')
    first = 1        
    for fline in fdiff:
        fidx = fline.split(':')[0]        
        if fidx == "Index": 
            fname = fline.split(':')[-1][1:-1]
            fname = fname.replace("/","_")
            print "svnpatch/%s.diff" % fname
            fname_ = "svnpatch/%s.diff" % fname
            if first == 1:
                fnew = file(fname_, 'w')
                first = 0
            else:
                fnew.close()
                fnew = file(fname_, 'w')

            fnew.write("%s" % fline)
        else:
            fnew.write("%s" % fline)
                         
    fdiff.close()

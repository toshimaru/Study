#!/usr/bin/python

import sys
import string
from random import randrange

argv = sys.argv
argc = len(argv)
alphabets = string.digits + string.letters

if (argc != 2):
    print 'Usage: mkpwd.py 10'
    quit()

def randstr(n):
    return ''.join(alphabets[randrange(len(alphabets))] for i in xrange(n))

if (argv[1].isdigit()):
    print randstr(int(argv[1]))
else:
    print 'arg should be number.'

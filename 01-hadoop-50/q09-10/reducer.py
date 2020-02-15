#!/usr/bin/env python

import sys

if __name__ == '__main__':
    n=0
    for line in sys.stdin:

        col1,letra,fecha,valor1 = line.split("\t")
        col2=int(valor1)
        if n < 6:            
            sys.stdout.write("{}   {}   {}\n".format(letra,fecha,col2))
        n=n+1

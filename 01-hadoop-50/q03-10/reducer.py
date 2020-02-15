#!/usr/bin/env python

import sys

if __name__ == '__main__':

    for line in sys.stdin:

        col1,letra,valor1 = line.split("\t")
        col2=int(valor1)

        sys.stdout.write("{},{}\n".format(letra, col2))
        

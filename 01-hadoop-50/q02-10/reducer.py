#!/usr/bin/env python

import sys

##
## Esta funcion reduce los elementos que
## tienen la misma clave
##

if __name__ == '__main__':

    curkey = None
    mayor= 0

    ##
    ## cada linea de texto recibida es una
    ## entrada clave \tabulador valor
    ##
    for line in sys.stdin:

        key, val = line.split("\t")
        val = int(val)
        
        if curkey == None:
            curkey = key
            curval = val
            
        elif key == curkey:
            if val > mayor:
                mayor = val
                
        elif key != curkey:
            sys.stdout.write("{}\t{}\n".format(curkey, mayor))
            curkey = key
            mayor = val
    sys.stdout.write("{}\t{}\n".format(curkey, mayor))

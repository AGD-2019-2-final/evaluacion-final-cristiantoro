#! /usr/bin/env python

##
## Esta es la funcion que mapea la entrada a parejas (clave, valor)
##
import sys
if __name__ == "__main__":

       for line in sys.stdin:

        splits = line.split(" ")
        letra = splits[0]
        sys.stdout.write("{}\t1\n".format(letra))

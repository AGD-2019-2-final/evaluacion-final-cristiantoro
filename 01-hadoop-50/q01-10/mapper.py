#! /usr/bin/env python

##
## Esta es la funcion que mapea la entrada a parejas (clave, valor)
##
import sys
if __name__ == "__main__":

    for line in sys.stdin:
    # Setting some defaults
        product_id = "-"
        line = line.strip("\t")
        splits = line.split(",")
        product_id =splits[2]
        sys.stdout.write("{}\t1\n".format(product_id))

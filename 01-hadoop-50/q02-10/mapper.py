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
        purpose =splits[3]
        amount =splits[4]
        sys.stdout.write("{}\t{}\n".format(purpose, amount))

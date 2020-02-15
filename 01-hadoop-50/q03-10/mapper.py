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
        letra=splits[0]
        numero =splits[1]
        col2 = int(numero)
        sys.stdout.write("{}\t{}\t{}\n".format(col2,letra, col2))

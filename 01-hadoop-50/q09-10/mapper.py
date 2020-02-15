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
        splits = line.split('   ')
        letra=splits[0]
        fecha =splits[1]
        numero =int(splits[2])
        valor1 = "{:03.0f}".format(numero)
        sys.stdout.write("{}\t{}\t{}\t{}\n".format(valor1,letra,fecha,numero))

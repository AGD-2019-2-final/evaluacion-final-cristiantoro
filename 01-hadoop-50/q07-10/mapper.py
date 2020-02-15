#! /usr/bin/env python

##
## Esta es la funcion que mapea la entrada a parejas (clave, valor)
##
import sys
if __name__ == "__main__":

      for line in sys.stdin:
        
        splits = line.split('   ')
        letra = splits[0]
        fecha = splits[1]
        valor = int(splits[2])
        valor1 = "{:03.0f}".format(valor)
        
        sys.stdout.write("{}\t{}\t{}\t{}\n".format(letra,valor1,fecha,valor))

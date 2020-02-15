#!/usr/bin/env python

import sys

##
## Esta funcion reduce los elementos que
## tienen la misma clave
##

if __name__ == '__main__':

    letra_actual = None
    cuenta_actual = 0
    
    for line in sys.stdin:
        
        letra, cuenta = line.split("\t")
        
        if not letra_actual:
            letra_actual = letra
            cuenta_actual += int(cuenta)
                 
        elif letra_actual == letra:
            cuenta_actual += int(cuenta)
                       
        elif letra_actual != letra:
            print(letra_actual + ',' +str(cuenta_actual))
            cuenta_actual = 1
            letra_actual = letra
    
    print(letra_actual + ',' +str(cuenta_actual))

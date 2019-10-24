.MODEL small
.DATA
    titulo DB 'FACTORES DE UN NUMERO$'
    mensaje DB 'Ingrese un numero porfavor:$'
    press DB 'Presione cualquier tecla para continuar...$'
    num  DB ?
    m1  DB ?
    m2  DB ?
    salto DB 13,10, "$"
    diez DB 10d
    resultado DB 'RESULTADO$' 
.CODE

Programa:
    MOV AX, @DATA
    MOV DS, AX
    
    MOV DX, Offset titulo
    MOV AH, 09h
    INT 21h
    
    MOV DX, Offset salto
    MOV AH, 09h
    INT 21h
    
    MOV DX, Offset mensaje
    MOV AH, 09h
    INT 21h
    
    ; Leer numeros
    XOR AX, AX
    
    MOV AH, 01h     ;Se lee el 1er.Numero
    INT 21h
    SUB AL, 30h     ;Se le restan 30h para obtener el valor real.
    
    MUL diez        ;Se multiplica por 10 para almacenar en AL las decenas.
    MOV num, AL
    
    MOV AH, 01h     ;Se lee el 2do.Numero
    INT 21h
    SUB AL, 30h     ;Se le restan 30h para obtener el valor real.
    ADD num, AL     ;Se suma el 2do. numero al primero para obtener el numero completo.

    MOV CL, num     ;se le asigna a CL el valor de num
    
    MOV DX, Offset salto
    MOV AH, 09h
    INT 21h
    
    MOV DX, Offset press
    MOV AH, 09h
    INT 21h
    
    MOV AH, 08h     ;espera el valor de una tecla
    INT 21h
    
    MOV AX, 0003h   ;Se limpia pantalla
    INT 10h
    
    MOV DX, offset resultado
    MOV AH, 09h
    INT 21h
    
    MOV DX, Offset salto
    MOV AH, 09h
    INT 21h
    
    Factores:
    XOR AX, AX      ;Se limpia el registro
    MOV AL, num
    DIV CL          ;Se divide el num dentro de CL que se ira decrementando
    CMP AH, 0h      ;Se compara si la resta es 0
    JZ  Impresion
    Retorno:
    LOOP Factores
    JMP Finalizar
    
    Impresion:
    
    MOV DX, offset salto    ;se imprime el salto
    MOV AH, 09h
    INT 21h
    
    XOR AX, AX              ;Se limpia el registro
    MOV AL, CL 
    DIV Diez                ;Se divide dentro de diez para obtener decenas y unidades
    MOV m1, AL
    MOV m2, AH
    
    ADD m1, 30h             ;Se imprime el 1er.numero
    MOV DL, m1
    MOV AH, 02h
    INT 21h

    ADD m2, 30h             ;Se imprime el 2do.numero
    MOV DL, m2
    MOV AH, 02h
    INT 21h
    
    JMP Retorno
    
    ; finalizar
    Finalizar:
    MOV AH, 4ch
    INT 21h
    
END Programa
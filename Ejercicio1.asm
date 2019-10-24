.MODEL small
.DATA
    num1  DB ?
    num2  DB ?
    titulo DB 'PRODUCTO DE DOS NUMEROS$'
    mensaje1 DB 'Ingrese el numero 1 porfavor:$'
    mensaje2 DB 'Ingrese el numero 2 porfavor:$'
    press DB 'Presione cualquier tecla para continuar...$'
    m1 DB ?
    m2 DB ?
    Diez DB 10d
    salto DB 13,10, "$"
    resultado DB 'RESULTADO$' 
.CODE

Programa:
    MOV AX, @DATA
    MOV DS, AX
    
     MOV DX, offset titulo ;se imprime el titulo
     MOV AH, 09h
     INT 21h
     
     MOV DX, offset salto    ;se imprime el salto
     MOV AH, 09h
     INT 21h
     
     MOV DX, offset mensaje1 ;se imprime el mensaje1
     MOV AH, 09h
     INT 21h
     
    ; Leer numeros
    XOR AX, AX
    MOV AH, 01h     ;Se lee el 1er. numero
    INT 21h
    MOV num1, AL   
    
    MOV DX, offset salto    ;se imprime el salto
    MOV AH, 09h
    INT 21h
     
    MOV DX, offset mensaje2 ;se imprime el mensaje1
    MOV AH, 09h
    INT 21h
    
    MOV AH, 01h     ;Se lee el 1er. numero
    INT 21h
    MOV num2, AL   
             
    MOV DX, offset salto    ;se imprime el salto
    MOV AH, 09h
    INT 21h
     
    MOV DX, offset press ;se imprime el mensaje1
    MOV AH, 09h
    INT 21h
    
    MOV AH, 08h     ;espera el valor de una tecla
    INT 21h
    
    MOV AX, 0003h   ;Se limpia pantalla
    INT 10h 
    
    XOR AX, AX
    
    ; Convertirlos al valor real
    SUB num1, 30h
    SUB num2, 30h
    
    ; Preparar valores para el ciclo
    MOV CL, num2
      
    Multiplicar:
        ADD BL, num1
        LOOP Multiplicar      
        
    Imprimir:
        
        MOV DX, offset resultado
        MOV AH, 09h
        INT 21h
    
        MOV DX, offset salto    ;se imprime el salto
        MOV AH, 09h
        INT 21h
        
        XOR AX, AX
        
        MOV AL, BL
        DIV Diez
        MOV m1, AL
        MOV m2, AH
    
        ADD m1, 30h
        MOV DL, m1
        MOV AH, 02h
        INT 21h
        
        ADD m2, 30h
        MOV DL, m2
        MOV AH, 02h
        INT 21h

    ; finalizar
    Finalizar:
    MOV AH, 4ch
    INT 21h
    
END Programa
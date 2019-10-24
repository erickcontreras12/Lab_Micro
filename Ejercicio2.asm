.MODEL small
.DATA
    titulo DB 'IMPRESION MULTIPLE$'
    salto DB 13,10, "$"
    resultado DB 'RESULTADO$'  
    press DB 'Presione ENTER para finalizar el ciclo...$'
    pos DB 0h
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
    
    MOV DX, Offset press
    MOV AH, 09h
    INT 21h
    
    MOV AH, 01
    INT 21h
    
    Impresion:
    MOV DL, 58h
    MOV AH, 02h
    INT 21h
  
    MOV AH, 01          ;Se obtiene el estado del Buffer del teclado
    INT 16h             ;Interrupci?n de Teclado
    LOOPZ Impresion     ;Salta si la bandera Z es 1 y CX es distinto de 0

    CMP AL, 0dh         ;Compara si lo que si el valor que tiene AL es un Enter
    JZ Finalizar        ;Si es un Enter Finaliza, sino sigue la impresion
    LOOP Impresion      ;Si no es un Enter el Loop Sigue 
       
    
    ; finalizar
    Finalizar:
    MOV AH, 4ch
    INT 21h
    
END Programa
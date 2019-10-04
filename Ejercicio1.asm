.model small 
.stack 
.data
    cadenaS DB 'Resultado de la suma: $';
    cadenaR DB 'Resultado de la resta: $'; 
    cadenaM DB 'Resultado de la multiplicacion: $'; 
    cadenaC DB 'Cociente: $'; 
    cadenaD DB 'Residuo: $'; 
    num1 db 34h
    num2 db 32h  
    cociente db ? 
    residuo db ? 
.code 
programa: 
    MOV AX, @DATA
    MOV DS, AX
    
    XOR AX, AX        

    ;imprimir
    MOV DX, OFFSET cadenaS 
    MOV AH, 09h 
    INT 21h 
    
    XOR AX, AX
    
    ;suma
    MOV AL, num1
    ADD AL, num2
    
    ;imprimir¿
    sub AL, 30h 
    MOV DL, AL
    
    MOV AH, 02 
    INT 21H 
    
    XOR AX, AX 
    
    ;salto de linea
    MOV DL, 10
    MOV AH, 02
    INT 21h
    MOV DL, 13
    INT 21H
    XOR AX, AX 
    
    ;imprimir
    MOV DX, OFFSET cadenaR
    MOV AH, 09h 
    INT 21h 
    
    XOR AX, AX
    
    ;resta
    MOV AL, num1 
    SUB AL, num2 
    
    ;imprimir
    ADD AL, 30H
    MOV DL, AL 
    MOV AH, 02
    INT 21H
    
    XOR AX, AX 
    
    ;salto de linea
    MOV DL, 10
    MOV AH, 02
    INT 21h
    MOV DL, 13
    INT 21H
    XOR AX, AX 
    
    ;imprimir
    MOV DX, OFFSET cadenaM
    MOV AH, 09h 
    INT 21h 
    
    XOR AX, AX
    
    ;multi
    MOV AL, num1 
    SUB AL, 30H
    MOV BL, num2
    SUB BL, 30H
    MUL BL
         
    MOV DL, AL
    ADD DL, 30H
    MOV AH, 02
    INT 21H
    
    XOR AX, AX
    
    ;salto de linea
    MOV DL, 10
    MOV AH, 02
    INT 21h
    MOV DL, 13
    INT 21H
    XOR AX, AX 
    
    ;imprimir
    MOV DX, OFFSET cadenaC
    MOV AH, 09h 
    INT 21h 
    
    XOR AX, AX
    
    ;division
    MOV AL, num1 
    SUB AL, 30H
    MOV BL, num2
    SUB BL, 30H
    DIV BL 
    MOV cociente, AL
    MOV residuo, AH
    
    ;cociente
    MOV DL, cociente 
    ADD DL, 30H 
    MOV AH, 02
    INT 21H 
    
    XOR AX, AX 
    
    ;salto de linea
    MOV DL, 10
    MOV AH, 02
    INT 21h
    MOV DL, 13
    INT 21H
    XOR AX, AX 
    
    ;imprimir
    MOV DX, OFFSET cadenaD
    MOV AH, 09h 
    INT 21h 
    
    XOR AX, AX
    
    ;reisduo
    MOV DL, residuo 
    ADD DL, 30H 
    MOV AH, 02
    INT 21H 
    
    XOR AX, AX
    
    
    
    
    ;finalizar el programa
    MOV AH, 4CH 
    INT 21H
END programa
    
    
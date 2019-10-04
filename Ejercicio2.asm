.model small 
.stack 
.data
    cadena1 db  "Ingrese el primer numero= $";ingrese n1
    cadena2 db  "Ingrese el segundo numero= $";ingrese n2
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

    ;solicitar del teclado numero 1
    
    mov ah, 09
    lea dx, cadena1
    int 21h
    mov ah, 01
    int 21h
    ;sub al, 30h
    mov num1,al
    
    ;alto de linea
    MOV DL, 10
    MOV AH, 02
    INT 21h
    MOV DL, 13
    INT 21H
    XOR AX, AX
    
;solicitar del teclado numero 2
    
    mov ah, 09
    lea dx, cadena2
    int 21h
    mov ah, 01
    int 21h
    ;sub al, 30h
    mov num2,al
    
    ;salto de linea
    MOV DL, 10
    MOV AH, 02
    INT 21h
    MOV DL, 13
    INT 21H
    XOR AX, AX
        

    ;imprimir
    MOV DX, OFFSET cadenaS 
    MOV AH, 09h 
    INT 21h 
    
    XOR AX, AX
    
    ;suma
    MOV AL, num1
    ADD AL, num2
    
    ;imprimir
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
    
    ;imprimir   
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
    
    ;imprimir cociente
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
    
    ;imprimir
    MOV DL, residuo 
    ADD DL, 30H 
    MOV AH, 02
    INT 21H 
    
    XOR AX, AX
    
    ;finalizar el programa
    MOV AH, 4CH 
    INT 21H
END programa
    
    
.model small
.data
    num1 DB ?
    num2 DB ?
    numtemp DB ?
    diez DB 10d
    dos DB 2d
    titulo DB 'CONVERSION DE NUMEROS DECIMALES A BINARIOS$'
    mensaje DB 'Ingrese un numero de dos digitos:$'
    mensajer DB 'El resultado de la conversion es:$'
    press DB 'Presione cualquier tecla para continuar...$'
    count db 0
    binarynum DB 9 dup(' '),'$'
    salto DB 13,10, "$"
.stack
.code
Program:
    JMP Ingreso
    Finalizar:
    
    MOV AX, 0003h   ;Se limpia pantalla
    INT 10h
    
    MOV DX, offset salto    ;se imprime el salto
    MOV AH, 09h
    INT 21h
     
    MOV DX, offset mensajer ;se imprime el mensaje1
    MOV AH, 09h
    INT 21h
    
    MOV DX, offset salto    ;se imprime el salto
    MOV AH, 09h
    INT 21h
    
    MOV DX,offset binarynum
    MOV AH,09h
    INT 21h
    MOV AH, 4ch
    INT 21h

  Ingreso:
     MOV AX,@Data
     MOV DS,AX
     XOR AX,AX
     MOV DX, offset titulo ;se imprime el titulo
     MOV AH, 09h
     INT 21h
     
     MOV DX, offset salto    ;se imprime el salto
     MOV AH, 09h
     INT 21h
     
     MOV DX, offset mensaje ;se imprime el mensaje1
     MOV AH, 09h
     INT 21h
     
     MOV DL, 20h
     MOV Ah,02h
     INT 21h
     
     MOV Ah,01h
     INT 21h
     MOV num1,AL
     SUB num1,30h
     
     XOR AX,AX
     
     MOV AL,diez
     MUL num1
     
     MOV BL,AL
     XOR AX,AX
     MOV AH,01h  
     INT 21h
     
     MOV num2,AL
     SUB num2,30h
     ADD BL,num2
     MOV num2,BL
     
     MOV DL,10
     MOV AH, 02h
     INT 21h
    
     MOV SI,6
     XOR AX,AX
     MOV AL,num2
     DIV dos
     MOV numtemp,AL
     CALL Agregar
     CMP numtemp,0      
     JG Proceso ;si es mas de 1
    JMP Finalizar ; si es uno

    Proceso:        
    XOR CX,CX    
    MOVs CL,1    
    
    Convertir:    
    XOR AX,AX
    MOV AL,numtemp
    DIV dos
    MOV numtemp,AL
    CALL Agregar
    CMP numtemp,0
    JG Incrementar    
    Ciclo:
    LOOP Convertir    
    JMP Finalizar       
    
    Agregar PROC    
    XOR DX,DX        
    MOV DL,AH
    ADD DL,30h
    MOV binarynum[SI],DL
    DEC SI
    RET
    Agregar endp   

    Incrementar:
    INC CL
    JMP Ciclo

  
    end Program
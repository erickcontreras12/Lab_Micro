model small            ; Modelo para ejecutables
.data

igual DB 'iguales$' ; $siginifica el final de la cadena db se utiliza para declarar una variable que ocupa un registro entero  
unomayorquedos DB '1 mayor que 2$'
dosmayorqueuno DB '2 mayor que 1$'
num1 DB 1
num2 DB 1
.code                   ; Inicia el segmento de c?digo
.stack
programa:               ; Etiqueta para el inicio del programa
       

 Mov AX,@DATA    ; Se obtiene la direcci?n de inicio del segmento de datos
        Mov DS,AX   
        Mov AX,0000h    ; Se inicializa el acumulador
        Mov BX,0000h    ; Se inicializa el registro BX
        mov ah, 01h ; leer entrada del usuario
        int 21h ;resulado queda en al
        mov num1,al
        
        
        mov ah, 01h ; leer entrada del usuario
        int 21h ;resulado queda en al
        mov num2,al
       
        
        mov al,num1
        mov bl,num2
        
        mov cl,30h     ; siempre se suma 30h para obtener un numero real porque en 30h empiezan los digitos por loo que sumar 21 + 21 nos deberia de desplazar 42 registros en la tabla ascii y llevarnos a l caracter Z
        sub al,cl 
        sub bl,cl 
        
        
        
        
        cmp al,bl
        je  iguales
        jne  diferentes
        
        iguales:
      
       mov dl,10
        mov ah, 02h ; leer entrada del usuario
        int 21h ;resulado queda en al
        MOV dx, OFFSET igual ;asignando dx a la variable cadena 
mov ah,09h; decimos que se le imprima la cadena
int 21h ;
jmp salir

    diferentes:
      
    jns uno;
    js dos;

    uno:
      mov dl,10
        mov ah, 02h ; leer entrada del usuario
        int 21h ;resulado queda en al
    MOV dx, OFFSET unomayorquedos ;asignando dx a la variable cadena 
mov ah,09h; decimos que se le imprima la cadena
int 21h ;
jmp salir

 dos:
    mov dl,10
        mov ah, 02h ; leer entrada del usuario
        int 21h ;resulado queda en al  
 MOV dx, OFFSET dosmayorqueuno ;asignando dx a la variable cadena 
mov ah,09h; decimos que se le imprima la cadena
int 21h ;
jmp salir

salir:
        Mov AH,4CH      ; Se asigna el c?digo para finalizaci?n de programa
        int 21h         ; Si invoca a la interrupci?n del DOS 21h para finalizar
        
        
        
End programa
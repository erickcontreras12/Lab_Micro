.model small            ; Modelo para ejecutables
.data

resultado DB 'resultado$' ; $siginifica el final de la cadena db se utiliza para declarar una variable que ocupa un registro entero  
cociente DB 'cociente$'
residuo DB 'residuo$'
num1 DB 1
num2 DB 1
res DB 1
mul1 DB 0

.code                   ; Inicia el segmento de c?digo
.stack
programa:               ; Etiqueta para el inicio del programa
       

 Mov AX,@DATA    ; Se obtiene la direcci?n de inicio del segmento de datos
        Mov DS,AX   
        Mov AX,0000h    ; Se inicializa el acumulador
        Mov BX,0000h    ; Se inicializa el registro BX
        Mov CX,0000h    ; Se inicializa el registro BX
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
        
        
        loop_sub:
         
        sub al,bl
        add cl,1
        mov res,al
        cmp al,bl
        jns  loop_sub
        js  mostrar
        
        mostrar:
      
         mov dl,10
        mov ah, 02h ; leer entrada del usuario
        int 21h ;resulado queda en al
        MOV dx, OFFSET cociente ;asignando dx a la variable cadena 
        mov ah,09h; decimos que se le imprima la cadena
        int 21h ;
        mov dl,cl
        mov ah,02h
         int 21h ;resulado queda en al
         
       mov dl,10
        mov ah, 02h ; leer entrada del usuario
        int 21h ;resulado queda en al
        MOV dx, OFFSET residuo ;asignando dx a la variable cadena 
        mov ah,09h; decimos que se le imprima la cadena
        int 21h ;
        mov al,res
        add al,30h
        mov dl,al
        mov ah,02h
         int 21h ;resulado queda en al
        jmp salir

    

salir: 
     xor cx,cx
     xor Ax,Ax
     xor Bx,Bx     

      
      mov al,num1
      mov bl,num2
      sub al,30h 
        sub bl,30h 
         loop_sum:
         
        add mul1,al
        add cl,1        
        cmp bl,cl
        jne  loop_sum
        je  salir2
        
        salir2:
         mov dl,10
        mov ah, 02h ; leer entrada del usuario
        int 21h ;resulado queda en al
        MOV dx, OFFSET resultado ;asignando dx a la variable cadena 
        mov ah,09h; decimos que se le imprima la cadena
        int 21h ;
        xor ax,ax
        xor dx,dx 
       
       add mul1,30h
        mov dl,mul1        
        mov AH,02
        int 21h ;resulado queda en al
         
        Mov AH,4CH      ; Se asigna el c?digo para finalizaci?n de programa
        int 21h         ; Si invoca a la interrupci?n del DOS 21h para finalizar
        
        
        
End programa
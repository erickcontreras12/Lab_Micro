.model small            ; Modelo para ejecutables
.data

par DB 'par$' ; $siginifica el final de la cadena db se utiliza para declarar una variable que ocupa un registro entero  
impar DB 'impar$'
num1 DB 1
.code                   ; Inicia el segmento de c?digo
.stack
programa:               ; Etiqueta para el inicio del programa
       

 Mov AX,@DATA    ; Se obtiene la direcci?n de inicio del segmento de datos
        Mov DS,AX   
        Mov AX,0000h    ; Se inicializa el acumulador
        Mov BX,0000h    ; Se inicializa el registro BX
        mov ah, 01h ; leer entrada del usuario
        int 21h ;resulado queda en al
        mov bl,2
        mov cl,30h     ; siempre se suma 30h para obtener un numero real porque en 30h empiezan los digitos por loo que sumar 21 + 21 nos deberia de desplazar 42 registros en la tabla ascii y llevarnos a l caracter Z
        sub al,cl 
        div bl
        cmp ah,0h
        je  if_true
        jne  end_if
        
        if_true:
      
       
     MOV dx, OFFSET par ;asignando dx a la variable cadena 
mov ah,09h; decimos que se le imprima la cadena
int 21h ;
jmp salir

    end_if:
      
     MOV dx, OFFSET impar ;asignando dx a la variable cadena 
mov ah,09h; decimos que se le imprima la cadena
int 21h ;
jmp salir
salir:
        Mov AH,4CH      ; Se asigna el c?digo para finalizaci?n de programa
        int 21h         ; Si invoca a la interrupci?n del DOS 21h para finalizar
        
        
        
End programa
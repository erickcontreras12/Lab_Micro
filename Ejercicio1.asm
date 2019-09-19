.MODEL small
.DATA

; variable hque contiene el texto que queremos mostrar
cadena DB 'Erick Eduardo Contreras Gomez$' ; $siginifica el final de la cadena db se utiliza para declarar una variable que ocupa un registro entero  
cadena2 DB ' 1009017$'
.STACK
.CODE

programa: ; etiqueta de inicio de programa
; inicializa programa
MOV AX ,@DATA ; guardando direccion de inicio segmento de datos
mov ds, ax 

;imprimir cadena
MOV dx, OFFSET cadena ;asignando dx a la variable cadena 
mov ah,09h; decimos que se le imprima la cadena
int 21h ;ejecuta proceso

;imprimir cadena2
MOV dx, OFFSET cadena2 ;asignando dx a la variable cadena 
mov ah,09h; decimos que se le imprima la cadena
int 21h ;ejecuta proceso


;finalizacion del programa
mov ah, 4ch; finalizacion proceso
int 21h ;ejecuta la interrupcion

end
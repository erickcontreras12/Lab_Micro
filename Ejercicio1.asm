.model small
.stack 
.data 
	mensaje db 'Ingrese Cadena para convertir a Mayusculas : ','$'
	PALABRA db 100 dup(' '), '$' 	
	Minusculas db "en Mayusculas: $" 
.code 

	mov ax,@data 
	mov ds,ax 

	mov ah, 09h
	lea dx, mensaje
	int 21h

	MOV AH, 3fH
	MOV BX, 00
	MOV CX, 100
	lea DX, PALABRA
	int 21h

	lea dx,Minusculas 
	mov ah,9h 
	int 21h 

	mov si,0 
seguirleyendo:
	mov al,PALABRA[si] 
	cmp al,36d 
	jz finlectura 
	cmp al,122d 
	jg pasar_a_mayuscula
	cmp al,97d 
	jl pasar_a_mayuscula
	sub al,20H 
pasar_a_mayuscula:
	mov dl,al 
	mov ah,2 
	int 21h 
	inc si 
	jmp seguirleyendo 
finlectura :  

	mov ah,4ch 
	int 21h 
	end
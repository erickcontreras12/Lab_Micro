.386
;model
.model flat, stdcall				;flat es como small
option casemap:none
;includes
include \masm32\include\windows.inc
include \masm32\include\kernel32.inc
include \masm32\include\masm32.inc
include \masm32\include\masm32rt.inc
;librerias
includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\masm32.lib

.DATA
TITULO DB "--- LABORATORIO NO.07 ---",0
MSJ DB "Ingrese un numero de un digito:  ",0,13h,10h
MSJ1 DB "El resultado de la suma es: ",0,13,10h
MSJ2 DB "El resultado de la resta es: ",0,13,10h
MSJ3 DB "Este es el numero mayor: ",0,13,10h
MSJ4 DB "Ambos numeros son IGUALES ",0,13,10h
ESPACIO DB 13,10
.DATA?
N1 Dw ?
N2 Dw ?
FINALIZAR Dw ?

.code

PROGRAM:

PRINCIPAL PROC

	INVOKE StdOut, addr TITULO
	INVOKE StdOut, addr ESPACIO
	INVOKE StdOut, addr ESPACIO


	INVOKE StdOut, addr MSJ
	INVOKE StdIn, addr N1,10	
	XOR BX,BX
	MOV BX,N1
	SUB BX,30h

	INVOKE StdOut, addr MSJ
	INVOKE StdIn, addr N2,10	
	SUB N2,30h
	ADD BX,N2

	INVOKE StdOut, addr MSJ1
	print str$(BX),13,10
	SUB N1,30h	
	XOR BX,BX
	MOV BX,N1
	SUB BX,N2

	INVOKE StdOut, addr MSJ2
	print str$(BX),13,10
	XOR BX,BX
	MOV BX,N1
	CMP BX,N2
	JG  P1
	JL  P2
	JE  P3

P1:
INVOKE StdOut, addr MSJ3
print str$(BX),13,10
JMP FINAL

P2:
XOR BX,BX
MOV BX,N2
INVOKE StdOut, addr MSJ3
print str$(BX),13,10
JMP FINAL

P3:
INVOKE StdOut, addr MSJ4
JMP FINAL

FINAL:
	INVOKE StdIn, addr FINALIZAR,10
	INVOKE ExitProcess,0

PRINCIPAL ENDP

END PROGRAM

; PALABRA
	global palabraLongitud
	section .text
	palabraLongitud:
	push rbp
	mov rbp, rsp
	xor rsi, rsi
	mov rsi, 0
	.ciclo:
		cmp byte [rdi],0
		je .fin
		add rdi,1
		inc rsi
		jmp .ciclo
	.fin:
		mov rax, rsi
	pop rbp
	ret

global palabraMenor
	section .text
	palabraMenor:
	push rbp
	mov rbp, rsp
	xor rax, rax
	xor rdx, rdx
	.ciclo:
		cmp byte [rdi], 0
		je .terminop1
		cmp byte [rsi],0
		je .fin
		mov rdx,[rsi]
		cmp byte [rdi], dl 
		jg .fin
		jl .true
		add rdi,1
		add rsi,1
		jmp .ciclo
	.terminop1:
		cmp byte [rsi],0
		jne .true
		jmp .fin
	.true:
		mov rax,1
	.fin:
	pop rbp
	ret

global palabraFormatear
	extern rsi
	section .text
	palabraFormatear:
		push rbp
		mov rbp, rsp
		sub rsp, 24
		push rbx
		push r12
		push r13
		push r14
		push r15
		
		call rsi
		
		pop r15
		pop r14
		pop r13
		pop r12
		pop rbx
		add rsp, 24
		pop rbp
		mov rax, 0
		ret

global palabraImprimir
	extern fprintf
	section .data:
	msg1: DB '%s', 10, 0

	section .text
	palabraImprimir:
		push rbp
		mov rbp, rsp
		mov rdx, rdi
		mov rdi, rsi
		mov rsi, msg1
		mov rax, 0
		call fprintf
		pop rbp
		ret

;global palabraCopiar
	
; LISTA y NODO
	global nodoCrear
	global nodoBorrar
	global oracionCrear
	global oracionBorrar
	global oracionImprimir

; AVANZADAS
	global longitudMedia
	global insertarOrdenado
	global filtrarPalabra
	global descifrarMensajeDiabolico

; YA IMPLEMENTADAS EN C
	extern palabraIgual
	extern insertarAtras

; /** DEFINES **/    >> SE RECOMIENDA COMPLETAR LOS DEFINES CON LOS VALORES CORRECTOS
	%define NULL 		0
	%define TRUE 		0
	%define FALSE 		0

	%define LISTA_SIZE 	    	 0
	%define OFFSET_PRIMERO 		 0

	%define NODO_SIZE     		 0
	%define OFFSET_SIGUIENTE   	 0
	%define OFFSET_PALABRA 		 0


section .rodata


section .data


section .text


;/** FUNCIONES DE PALABRAS **/
;-----------------------------------------------------------

	; unsigned char palabraLongitud( char *p );
	;palabraLongitud:
		; COMPLETAR AQUI EL CODIGO

	; bool palabraMenor( char *p1, char *p2 );
	;palabraMenor:
		; COMPLETAR AQUI EL CODIGO

	; void palabraFormatear( char *p, void (*funcModificarString)(char*) );
	;palabraFormatear:
		; COMPLETAR AQUI EL CODIGO

	; void palabraImprimir( char *p, FILE *file );
	;palabraImprimir:
		; COMPLETAR AQUI EL CODIGO

	; char *palabraCopiar( char *p );
	;palabraCopiar:
		; COMPLETAR AQUI EL CODIGO


;/** FUNCIONES DE LISTA Y NODO **/
;-----------------------------------------------------------

	; nodo *nodoCrear( char *palabra );
	nodoCrear:
		; COMPLETAR AQUI EL CODIGO

	; void nodoBorrar( nodo *n );
	nodoBorrar:
		; COMPLETAR AQUI EL CODIGO

	; lista *oracionCrear( void );
	oracionCrear:
		; COMPLETAR AQUI EL CODIGO

	; void oracionBorrar( lista *l );
	oracionBorrar:
		; COMPLETAR AQUI EL CODIGO

	; void oracionImprimir( lista *l, char *archivo, void (*funcImprimirPalabra)(char*,FILE*) );
	oracionImprimir:
		; COMPLETAR AQUI EL CODIGO


;/** FUNCIONES AVANZADAS **/
;-----------------------------------------------------------

	; float longitudMedia( lista *l );
	longitudMedia:
		; COMPLETAR AQUI EL CODIGO

	; void insertarOrdenado( lista *l, char *palabra, bool (*funcCompararPalabra)(char*,char*) );
	insertarOrdenado:
		; COMPLETAR AQUI EL CODIGO

	; void filtrarAltaLista( lista *l, bool (*funcCompararPalabra)(char*,char*), char *palabraCmp );
	filtrarPalabra:
		; COMPLETAR AQUI EL CODIGO

	; void descifrarMensajeDiabolico( lista *l, char *archivo, void (*funcImpPbr)(char*,FILE* ) );
	descifrarMensajeDiabolico:
		; COMPLETAR AQUI EL CODIGO

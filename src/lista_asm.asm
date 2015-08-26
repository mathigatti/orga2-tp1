
; /** DEFINES **/    >> SE RECOMIENDA COMPLETAR LOS DEFINES CON LOS VALORES CORRECTOS
	%define NULL 		0
	%define TRUE 		1
	%define FALSE 		0

	%define LISTA_SIZE 	    	 8
	%define OFFSET_PRIMERO 		 0

	%define NODO_SIZE     		 16
	%define OFFSET_SIGUIENTE   	 0
	%define OFFSET_PALABRA 		 8
	
	%define LF					10


section .rodata


section .data


section .text

	extern rsi
	extern fprintf
	extern malloc
	extern free




;/** FUNCIONES DE PALABRAS **/
;-----------------------------------------------------------


	global palabraLongitud
	global palabraMenor
	global palabraFormatear
	global palabraImprimir
	global palabraCopiar


; unsigned char palabraLongitud( char *p );
;palabraLongitud:
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
	
; bool palabraMenor( char *p1, char *p2 );
;palabraMenor:
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


; void palabraFormatear( char *p, void (*funcModificarString)(char*) );
;palabraFormatear:
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
; void palabraImprimir( char *p, FILE *file );
;palabraImprimir:


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
; char *palabraCopiar( char *p );
;palabraCopiar:
	
	section .text
	palabraCopiar:
		push rbp
		mov  rbp, rsp
		push r14
		push r15 
		mov r14, rdi ;tengo la palabra guardada
		call palabraLongitud
		add rax,1
		mov r15,rax ;tengo la longitud guardada, con final de palabra inclusive
		xor rdi, rdi
		mov dil,al ;paso el tamaño de la palabra
		call malloc
		mov rsi,rax ;guardo el puntero a la palabra nueva
		xor rdx,rdx
		.ciclo:
			cmp byte [r14],NULL
			je .fin
			mov dl,[r14]
			mov [rsi],dl
			add r14,1
			add rsi,1
			jmp .ciclo
		.fin:
		mov byte [rsi],NULL
		pop r15
		pop r14
		pop rbp
		ret ;en rax esta el puntero a la palabra, que ni lo toque
		
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



;/** FUNCIONES DE LISTA Y NODO **/
;-----------------------------------------------------------
section .text

	; nodo *nodoCrear( char *palabra );
	nodoCrear:
		push rbp
		mov rbp, rsp
		push r14
		push r15
		mov r15,rdi ;guardo la palabra
		xor rdi,rdi
		mov dil,16
		call malloc
		mov r14, rax ; guardo puntero a nodo
		mov [r14 + OFFSET_PALABRA], r15
		mov qword [r14],NULL
		pop r15
		pop r14
		pop rbp
		ret
	; void nodoBorrar( nodo *n );
	nodoBorrar:
		push rbp
		mov rbp, rsp
		call free		
		pop rbp
		ret
		; COMPLETAR AQUI EL CODIGO

	; lista *oracionCrear( void );
	oracionCrear:
		push rbp
		mov rbp, rsp
		
		xor rdi,rdi
		mov dil, 8
		call malloc
		mov qword [rax + OFFSET_PRIMERO],NULL ;Que el primero sea null
		pop rbp
		ret	
	; void oracionBorrar( lista *l );
	oracionBorrar:
		push rbp
		mov rbp, rsp
		push r15
		push r14
		push r13
		cmp qword [rdi + OFFSET_PRIMERO],NULL
			je .fin
		lea r14,[rdi + OFFSET_PRIMERO] ;guardo el puntero al primer nodo
		
		.ciclo:
			cmp qword [r14+OFFSET_SIGUIENTE],NULL ;me fijo si el siguiente es null
			je .fin
			mov r13,[r14+OFFSET_SIGUIENTE]; guardo el puntero al nodo siguiente
			mov rdi,r14; preparo para borrar el nodo actual
			call nodoBorrar
			mov r14,r13
			jmp .ciclo
		.fin:
		mov rdi,r14
		call nodoBorrar
		
		push r13
		push r14
		push r13
		pop rbp
		ret
		
		
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

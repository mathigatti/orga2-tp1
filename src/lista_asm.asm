

; PALABRA

	global palabraLongitud
	global palabraMenor
	global palabraFormatear
	global palabraImprimir
	global palabraCopiar
	
		
; LISTA y NODO
	global nodoCrear
	global nodoBorrar
	global oracionCrear
	global oracionBorrar
	global oracionImprimir

; AVANZADAS
	global longitudMedia
	global insertarOrdenado
;	global filtrarPalabra
;	global descifrarMensajeDiabolico


; YA IMPLEMENTADAS EN C
	extern palabraIgual
	extern insertarAtras
	extern fprintf
	extern malloc
	extern free
	extern fclose
	extern fopen



; /** DEFINES **/ 
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
	msg1: DB '%s', 10, 0
	msg2:	DB 'w',10




section .text


;/** FUNCIONES DE PALABRAS **/
;-----------------------------------------------------------


; unsigned char palabraLongitud( char *p );

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


;/** FUNCIONES DE LISTA Y NODO **/
;-----------------------------------------------------------

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

	; lista *oracionCrear( void );
	oracionCrear:
		push rbp
		mov rbp, rsp
		
		xor rdi,rdi
		mov dil, LISTA_SIZE
		call malloc
		mov qword [rax + OFFSET_PRIMERO],NULL ;Que el primero sea null
		pop rbp
		ret	
		
	; void oracionBorrar( lista *l );

	;r15 = puntero a la lista
	;r14 = puntero al nodo actual
	;r13 = puntero al siguiente
	oracionBorrar:
		push rbp
		mov rbp, rsp
		push r15
		push r14
		push r13
		sub rsp,8
		mov r15,rdi
		cmp qword [r15 + OFFSET_PRIMERO],NULL
			je .fin
		mov r14,[r15 + OFFSET_PRIMERO] ;guardo el puntero al primer nodo
		mov r13,[r14 + OFFSET_SIGUIENTE] ;guardo el puntero al siguiente
		mov rdi,r14
		call nodoBorrar ;borro al primero
		mov r14, r13; r14 ahora apunta al segundo nodo
		.ciclo:
			cmp qword r14,NULL ;me fijo si es null
			je .fin
			mov r13,[r14+OFFSET_SIGUIENTE]; guardo el puntero al nodo siguiente
			mov rdi,r14; preparo para borrar el nodo actual
			call nodoBorrar
			mov r14,r13
			jmp .ciclo
		.fin:
		mov rdi,r15
		call free
		add rsp,8
		pop r13
		pop r14
		pop r15
		pop rbp
		ret
		
	; void oracionImprimir( lista *l, char *archivo, void (*funcImprimirPalabra)(char*,FILE*) );
	oracionImprimir:
		push rbp
		mov rbp, rsp
		push r13
		push r14
		push r15
		sub rsp, 8		
		mov r13, [rdi + OFFSET_PRIMERO] ;r13 = puntero al primero
		mov rdi, rsi
		mov rsi, msg2
		mov r15, rdx ;guardo la funcionImprimir
		call fopen
		mov r14,rax ;guardo el puntero al archivo
		.ciclo:
			cmp r13,NULL
			je .fin
			mov rdi, [r13+OFFSET_PALABRA]
			mov rsi, r14
			call r15
			mov r13, [r13+OFFSET_SIGUIENTE]
			jmp .ciclo
		.fin:
			mov rdi,r14
			call fclose
		add rsp, 8
		pop r15
		pop r14
		pop r13
		pop rbp
		ret


;/** FUNCIONES AVANZADAS **/
;-----------------------------------------------------------


	; float longitudMedia( lista *l );
	longitudMedia:
	push rbp
	mov rbp, rsp
	push r12
	push r13
	push r14
	push r15
	
	xor r12, r12 ; logitud
	xor r13, r13 ; contador
	mov r14,[rdi + OFFSET_PRIMERO] ; nodo actual
	.ciclo:
		cmp r14,NULL
		je .fin
		mov rdi, [r14+OFFSET_PALABRA]
		call palabraLongitud
		add r12,rax
		add r13,1
		mov r14, [r14+OFFSET_SIGUIENTE]
		jmp .ciclo
	.fin:
	pxor xmm0,xmm0
	pxor xmm1,xmm1
	cmp r13, 0
	je .terminar
	cvtsi2ss xmm0, r12
	cvtsi2ss xmm1, r13
	divss xmm0,xmm1
	.terminar:
	pop r15
	pop r14
	pop r13
	pop r12
	pop rbp
	ret

; inputs: rdi, rsi, rdx, rcx, r8, r9
; preservar: r12, r13, r14, r15, rbx, 
; la pila: rbp, rsp
; devolver por rax o xmmo 
; inputs floats: xmm0, xmm1, ..., xmm7

	; void insertarOrdenado( lista *l, char *palabra, bool (*funcCompararPalabra)(char*,char*) );
insertarOrdenado:
	push rbp
	mov rbp, rsp
	push r12
	push r13
	push r14
	push r15
	push rbx
	sub rsp,8
	
	mov r12, rdx ;guardo la funcion
	mov r13, [rdi+OFFSET_PRIMERO] ;guardo nodo actual
	mov r14, rdi ;guardo la lista
	mov r15, rsi ;guardo la palabra

	cmp r13,NULL
	je .insertarAtras
	mov rdi, r15
	mov rsi, [r13+OFFSET_PALABRA]
	call r12
	cmp rax, TRUE
	je .insertarAdelante
	xor rbx, rbx; si es 1 entonces inserté la palabra si es 0 no.
	.ciclo:
	cmp rbx, 1
	je .fin
	mov rdi, [r13+OFFSET_SIGUIENTE]
	cmp rdi,NULL
	je .insertarAtras
	
	mov rdi, r15
	mov rsi, [r13+OFFSET_SIGUIENTE]
	mov rsi, [rsi+OFFSET_PALABRA]
	call r12
	cmp rax, FALSE
	je .sigociclo
	mov rdi, r15
	call nodoCrear
	mov rdi,[r13+OFFSET_SIGUIENTE]
	mov [rax+OFFSET_SIGUIENTE],rdi
	mov [r13+OFFSET_SIGUIENTE],rax
	mov rbx,1
	.sigociclo:
	mov r13,[r13+OFFSET_SIGUIENTE]
	jmp .ciclo
	
	
	cmp rbx,1
	je .fin
	
	.insertarAtras:
	mov rdi, r14
	mov rsi, r15
	call insertarAtras
	jmp .fin
	
	.insertarAdelante:
	mov rdi,r15
	call nodoCrear
	mov [rax+OFFSET_SIGUIENTE],r13
	mov [r14+OFFSET_PRIMERO], rax
		
	.fin:
	add rsp,8
	pop rbx
	pop r15
	pop r14
	pop r13
	pop r12
	pop rbp
	ret
	
	; void filtrarAltaLista( lista *l, bool (*funcCompararPalabra)(char*,char*), char *palabraCmp );
	filtrarPalabra:
		; COMPLETAR AQUI EL CODIGO

	; void descifrarMensajeDiabolico( lista *l, char *archivo, void (*funcImpPbr)(char*,FILE* ) );
	descifrarMensajeDiabolico:
		; COMPLETAR AQUI EL CODIGO
		
		

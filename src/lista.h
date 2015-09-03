#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>

/** Tipos lista y nodo **/

	typedef struct lista_t {
		struct nodo_t 	*primero;
	} __attribute__((__packed__)) lista;

	typedef struct nodo_t {
		struct nodo_t 	*siguiente;
		char 			*palabra;
	} __attribute__((__packed__)) nodo;


/** Funciones de palabras **/

extern unsigned char palabraLongitud( char *p );
extern bool palabraMenor( char *p1, char *p2 );
extern void palabraFormatear( char *p, void (*funcModificarString)(char*) );
extern void palabraImprimir( char *p, FILE *file );
extern char *palabraCopiar( char *p );

void fTest(char *p);

/** Funciones de lista y nodo **/


extern	nodo *nodoCrear( char *palabra );
extern	void nodoBorrar( nodo *n );
extern	lista *oracionCrear( void );
extern	void oracionBorrar( lista *l );
extern void oracionImprimir( lista *l, char *archivo, void (*funcImprimirPalabra)(char*,FILE*) );


/** Funciones Avanzadas **/

	float longitudMedia( lista *l );
	void insertarOrdenado( lista *l, char *palabra, bool (*funcCompararPalabra)(char*,char*) );
	void filtrarPalabra( lista *l, bool (*funcCompararPalabra)(char*,char*), char *palabraCmp );
	void descifrarMensajeDiabolico( lista *l, char *archivo, void (*funcImpPbr)(char*,FILE* ) );


/** Funciones Auxiliares ya implementadas en C **/

	bool palabraIgual( char *p1, char *p2 );											
	void insertarAtras( lista *l, char *palabra );


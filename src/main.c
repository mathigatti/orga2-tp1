#include "lista.h"
#include <stdio.h>
#include <stdlib.h>

int main (void){	

	printf("%s\n","Test palabraLongitud");
	printf( "la longitud de ’hola’ es = %d \n", palabraLongitud( "hola" ) );
	printf( "la longitud de ’’ es = %d \n", palabraLongitud( "" ) );
	printf( "la longitud de ’12345678910’ es = %d \n", palabraLongitud( "12345678910" ) );	
	
	printf("%s\n","Test palabraMenor");
	if( palabraMenor( "merced", "mercurio" ) )
		printf( "TRUE\n" ); else printf( "FALSE\n" );
	if( palabraMenor( "zorro", "perro" ) )
		printf( "TRUE\n" ); else printf( "FALSE\n" );
	if( palabraMenor( "senior", "seniora" ) )
		printf( "TRUE\n" ); else printf( "FALSE\n" );
	if( palabraMenor( "hola", "hola" ) )
		printf( "TRUE\n" ); else printf( "FALSE\n" );
	printf("%s\n","Test palabraFormato");
	printf("\n");
	char var[] = "Uno";
	printf("%s\n",var);
	fTest(var);
	printf("%s\n",var);
	char var2[] = "Dos";
	printf("%s\n",var2);
	void (*punteroF)(char*);
	punteroF = &fTest;
	palabraFormatear(var2, punteroF);
	printf("%s\n",var2);

	printf("%s\n","Test palabraImprimir");
	printf("\n");
		
	FILE *f = fopen("asd.txt","w");
	char *text = "Mensaje que deberia imprimirse";
	palabraImprimir(text,f);
	palabraImprimir(text,stdout);
	fclose(f);
	
	printf("%s\n","Test palabraCopiar");
	printf("\n");

	char* unaPalabra = palabraCopiar("Veintiocho");
	char* otraPalabra = palabraCopiar(unaPalabra);
	unaPalabra[1] = 'X';
	palabraImprimir(unaPalabra, stdout);
	palabraImprimir(otraPalabra, stdout);
	free(unaPalabra);
	free(otraPalabra);
	printf("%s\n","Test nodocrear y borrar");

	nodo* n = nodoCrear(palabraCopiar("Soy un nodo"));
	printf("%s\n",n->palabra);
	free(n->palabra);
	nodoBorrar(n);
	printf("%s\n","Test nodocrear y borrar");
	lista ora = oracionCrear();
	insertarAtras(ora, "uno");
	insertarAtras(ora, "dos");
	insertarAtras(ora, "tres");
	oracionBorrar(ora);
	return 0;

	
}

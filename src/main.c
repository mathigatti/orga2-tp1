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
	printf("%s\n","Test nodo crear y borrar");

	nodo* n = nodoCrear(palabraCopiar("Soy un nodo"));
	printf("%s\n",n->palabra);
	free(n->palabra);
	nodoBorrar(n);
	
	
	printf("%s\n","Test oracion crear y borrar");
	printf("\n");
	
	lista* ora = oracionCrear();
	insertarAtras(ora, "uno");
	insertarAtras(ora, "dos");
	insertarAtras(ora, "tres");
	oracionBorrar(ora);
	lista* ora2 = oracionCrear();
	oracionBorrar(ora2);
	lista* ora3 = oracionCrear();
	insertarAtras(ora3, "uno");
	oracionBorrar(ora3);
	
	printf("%s\n","Test oracionImprimir");
	printf("\n");

	void (*funcImprimir)(char*,FILE*);
	funcImprimir = &palabraImprimir;
	lista* ora4 = oracionCrear();
	insertarAtras(ora4, "uno");
	insertarAtras(ora4, "tres");
	insertarAtras(ora4, "cinco");
	oracionImprimir(ora4,"asd.txt", funcImprimir);
	oracionBorrar(ora4);

	printf("%s\n","Test oracionLongitud");
	printf("\n");
	
	lista *miLista = oracionCrear();
	insertarAtras( miLista, "uno" );
	insertarAtras( miLista, "do" );
	
	lista *miLista2 = oracionCrear();
	insertarAtras( miLista2, "cuatro" );
	insertarAtras( miLista2, "tres" );
	insertarAtras( miLista2, "ochenta y dos");

	printf( "LongMedia = %2.5f\n", longitudMedia (miLista));
	printf( "LongMedia = %2.5f\n", longitudMedia (miLista2));
	
	oracionBorrar(miLista);
	oracionBorrar(miLista2);

	printf("\n");
	printf("%s\n","Test insertarOrdenado ver en asd.txt");
	printf("\n");

	bool (*funcMenor)(char*,char*);
	funcMenor = &palabraMenor;

	lista *miLista3 = oracionCrear();
	insertarOrdenado(miLista3, "zeta", funcMenor);
	insertarOrdenado(miLista3, "casa", funcMenor);
	insertarOrdenado(miLista3, "acasa", funcMenor);
	insertarOrdenado(miLista3, "bebe", funcMenor);
		
	oracionImprimir(miLista3,"asd.txt", funcImprimir);
	oracionBorrar(miLista3);

	printf("\n");
	printf("%s\n","Test filtrarPalabra");
	printf("\n");
	
	
	return 0;

	
}

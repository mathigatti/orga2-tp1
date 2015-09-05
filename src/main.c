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
	nodoBorrar(n);
	
	
	printf("%s\n","Test oracion crear y borrar");
	printf("\n");
	
	lista* ora = oracionCrear();
	insertarAtras(ora, palabraCopiar("uno"));
	insertarAtras(ora, palabraCopiar("dos"));
	insertarAtras(ora, palabraCopiar("tres"));
	oracionBorrar(ora);
	lista* ora2 = oracionCrear();
	oracionBorrar(ora2);
	lista* ora3 = oracionCrear();
	insertarAtras(ora3, palabraCopiar("uno"));
	oracionBorrar(ora3);
	
	printf("%s\n","Test oracionImprimir");
	printf("\n");

	void (*funcImprimir)(char*,FILE*);
	funcImprimir = &palabraImprimir;
	lista* ora4 = oracionCrear();
	insertarAtras(ora4, palabraCopiar("uno"));
	insertarAtras(ora4, palabraCopiar("tres"));
	insertarAtras(ora4, palabraCopiar("cinco"));
	oracionImprimir(ora4,"asd.txt", funcImprimir);
	oracionBorrar(ora4);

	printf("%s\n","Test oracionLongitud");
	printf("\n");
	
	lista *miLista = oracionCrear();
	insertarAtras( miLista, palabraCopiar("uno") );
	insertarAtras( miLista, palabraCopiar("do") );
	
	lista *miLista2 = oracionCrear();
	insertarAtras( miLista2, palabraCopiar("cuatro" ));
	insertarAtras( miLista2, palabraCopiar("tres"));
	insertarAtras( miLista2, palabraCopiar("ochenta y dos"));

	printf( "LongMedia = %2.5f\n", longitudMedia (miLista));
	printf( "LongMedia = %2.5f\n", longitudMedia (miLista2));
	
	oracionBorrar(miLista);
	oracionBorrar(miLista2);

	printf("\n");
	printf("%s\n","Test insertarOrdenado ver en asd.txt");
	printf("\n");
	
	char* s1 = palabraCopiar("s");
	char* s2 = palabraCopiar("bfas");
	bool bul = palabraMenor(s1,s2);
	if (bul == true){
		printf("%s\n","True");
		}
	else printf("%s\n","False");
	
	free(s2);
	free(s1);
/*	

	lista *miLista3 = oracionCrear();
	insertarOrdenado(miLista3, palabraCopiar("zeta"), palabraMenor);
	insertarOrdenado(miLista3, palabraCopiar("casa"), palabraMenor);
	
	
	
	oracionImprimir(miLista3,"asd.txt", funcImprimir);
	oracionBorrar(miLista3);
*/
	printf("\n");
	printf("%s\n","Test filtrarPalabra");
	printf("\n");
	
	lista *miLista4 = oracionCrear();
	insertarAtras(miLista4, palabraCopiar("uno"));
	insertarAtras(miLista4, palabraCopiar("dos"));
	insertarAtras(miLista4, palabraCopiar("uno"));


	bool (*funcIgual)(char*,char*);
	funcIgual = &palabraIgual;


	filtrarPalabra(miLista4, funcIgual, "dos");
	oracionImprimir(miLista4,"filt1.txt",funcImprimir);
	oracionBorrar(miLista4);

	lista *miLista5 = oracionCrear();
	insertarAtras(miLista5, palabraCopiar("uno"));
	insertarAtras(miLista5, palabraCopiar("tres"));	

	filtrarPalabra(miLista5, funcIgual, "dos");
	oracionImprimir(miLista5,"filt2.txt",funcImprimir);
	oracionBorrar(miLista5);

	lista *miLista6 = oracionCrear();

	filtrarPalabra(miLista6, funcIgual, "dos");
	oracionImprimir(miLista6,"filt3.txt",funcImprimir);
	oracionBorrar(miLista6);

	printf("\n");
	printf("%s\n","Test DecifraMensajeDiabolico");
	printf("\n");
	
	lista *miLista7 = oracionCrear();
	insertarAtras(miLista7, palabraCopiar("uno"));
	insertarAtras(miLista7, palabraCopiar("dos"));
	insertarAtras(miLista7, palabraCopiar("tres"));
	insertarAtras(miLista7, palabraCopiar("tres"));
	insertarAtras(miLista7, palabraCopiar(""));
		


//	descifrarMensajeDiabolico(miLista7, "asd.txt", palabraImprimir);
	oracionBorrar(miLista7);	

	return 0;

	
}

#include "lista.h"


/** Funciones Auxiliares ya implementadas en C **/

extern nodo *nodoCrear( char *palabra );

bool palabraIgual( char *p1, char *p2 ){
   int i = 0;
   while( p1[i] == p2[i] ){
      if( p1[i] == 0 || p2[i] == 0 )
         break;
      i++;
   }
   if( p1[i] == 0 && p2[i] == 0 )
      return true;
   else
      return false;
}

void insertarAtras( lista *l, char *palabra ){
    nodo *nuevoNodo = nodoCrear( palabra );
    nodo *nodoActual = l->primero;
    if( nodoActual == NULL ){
        l->primero = nuevoNodo;
        return;
	}
    while( nodoActual->siguiente != NULL )
		nodoActual = nodoActual->siguiente;
	nodoActual->siguiente = nuevoNodo;
}

// Mis funciones

/*
char* palabraCopiar( char* p ){
	int i = 0;
	int n = palabraLongitud(p);
	char* res = malloc(sizeof(char)*(n+1));
	while(n>=i){
		res[i] = p[i];
		i++;	
	}
	return res;
}

unsigned char palabraLongitud( char *p ){
	int i = 0;	
	while( p[i] != 0){
	i++;	
	}
	unsigned char res = i + '0';
	return res;
}

bool palabraMenor( char *p1, char *p2 ){
   int i = 0;
   while( p1[i] == p2[i] ){
      if( p1[i] == 0 || p2[i] == 0 )
         break;
      i++;
   }
  if( p1[i] < p2[i])	
	return true;
  else
	return false;
}


void palabraFormatear( char *p, void (*funcModificarString)(char*) ){
	(*funcModificarString)(p);

}


void palabraImprimir( char *p, FILE *file ){
	fprintf(file, "%s\n", p);
}





*/

void fTest(char *p){
	p[0] = 'b';
}


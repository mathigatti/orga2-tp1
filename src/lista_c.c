#include "lista.h"


/** Funciones Auxiliares ya implementadas en C **/

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



void insertarOrdenado( lista *l, char *palabra, bool (*funcCompararPalabra)(char*,char*) ){
	nodo* actual = l->primero;
	if(actual == NULL){
		insertarAtras(l,palabra);
	}
	else{
		if(funcCompararPalabra(palabra, actual->palabra)){
		nodo* nuevo = nodoCrear(palabra);
		nuevo->siguiente = actual;
		l->primero = nuevo;	
		}
		else{
			int i = 0;
			while(i != 1 && actual->siguiente != NULL){
				if (funcCompararPalabra(palabra, (actual->siguiente)->palabra)){
						nodo* nuevo = nodoCrear(palabra);
						nuevo->siguiente = actual->siguiente;
						actual->siguiente = nuevo;
						i = 1;		
				}
				actual = actual->siguiente;
			}
			if( i != 1){
				insertarAtras(l, palabra);
			}
		}
	}
}


//	void filtrarPalabra( lista *l, bool (*funcCompararPalabra)(char*,char*), char *palabraCmp );
//	void descifrarMensajeDiabolico( lista *l, char *archivo, void (*funcImpPbr)(char*,FILE* ) );



// Mis funciones

/*

float longitudMedia( lista *l ){
	nodo* actual = l->primero;
	unsigned char longitud = 0;
	int i = 0;
	while(actual != NULL){
		longitud = longitud + palabraLongitud(actual->palabra);
		i = i + 1;
		actual = actual->siguiente;
	}
	return (float)longitud/(float)i;
}


void oracionImprimir( lista *l, char *archivo, void (*funcImprimirPalabra)(char*,FILE*) ){
	nodo* proximo = l->primero;
	FILE *archi = fopen(archivo,"w");
	while(proximo != NULL){
		(*funcImprimirPalabra)(proximo->palabra, archi); 
		proximo = proximo->siguiente;
		}	
	fclose(archi);
}



void oracionBorrar( lista *l ){
	nodo* aux;
	nodo* prox = l->primero;
	if(l->primero == NULL){
		free(l);
		}
	else{
		aux = prox->siguiente;
		nodoBorrar(prox);
		prox = aux;
		while(prox != NULL){
			aux = prox->siguiente;
			nodoBorrar(prox);
			prox = aux;
			}
		free(l);
		}
	}


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


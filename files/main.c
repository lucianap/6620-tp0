#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include "matrix.h" 

// Lee lineas de la entrada estandard
/*
PRE: Recibe un puntero a un numero (size_t *).
POST: Lee de la entrada estandar lineas (hasta 
encontrar un \n; y termina al encontrar un EOF), 
y la devuelve (char *), almacenando su longitud 
la variable size, recibida por parametro.
Queda a responsabilidad del usuario liberar la 
memoria reservada, por medio de la funcion free.
*/
char* read_from_stdin(size_t* size);

// Parsea una cadena de matrices, a un arreglo de 
// matrices
/*
PRE : Recibe una cadena con matrices cuadradas 
en el formato :
N a11 .... ann b11 .... bnn, 
donde N es la dimension esta matrices, tal que,
NxN.
POST: Devuelve un arreglo de numero (double *), 
con los elementos de la primer matriz, seguidos 
de los elementos de la segunda.
Ademas almacena en matrix_size el la dimension
de la matriz.
*/
double* parse(char* string_matrixes, size_t* matrix_size);

// Extrae un arreglo de elementos de una la matriz
// desde un arreglo de elementos para dos matrices
/*
PRE : Recibe:
    un arreglo con los elementos de dos matrices 
    cuadradas, unos seguidos de los otros.
    la dimension (de lado) de estas matrices
    y un numero:
        0 : para referirse a la primer matriz
        1 : para referirse a la segunda matriz
POST: Devuelve un arreglo con los elementos de la 
matriz seleccionada (0 o 1).
Queda a responsabilidad del usuario liberar la memoria
reservada por medio de la funcion free.
*/
double* extract_matrix(double* array_matrixes, size_t matrix_size, size_t matrix_num);

// Loguea un mensaje por stderr y sale de la aplicacion.
/*
PRE: Recibe un codigo de error (int)
POST: Imprime por salida de error estandar, un mensaje
descriptivo para el error en cuestion, y termina la 
ejecucion del programa.
*/
void logAndExit(int error_code);

// Ejecuta el programa de desde el parseo de la 
// entrada estandar, la multiplicacion de 
// matrices cuadradas y la impresion del resultado.
void exec_program();

//Procesa lineas de mutliplicacion de matrices
/*
PRE: Recibe una linea correspondiente a dos matrices 
a multiplicar.
POST: Procesa la linea, realizando la multiplicacion,
e imprimiendo el resultado por entrada estandard.
*/
void process_line(char* line); 

// Imprime por salida estandard, la distintas
// formas de ejecutar el programa
void show_help() {

    char buffer[512];
	snprintf(buffer, sizeof buffer, "%s",
   			"\tUsage: \n"
   			"\t\t./tp0 -h \n"
   			"\t\t./tp0 -V \n"
            "\t\t./tp0 < in_file > out_file\n"   
   			"\ttp0 [options] \n"
   			"\tOptions: \n"
   			"\t\t-V, --version \tPrint version and quit.\n"
   			"\t\t-h, --help \tPrint this information.\n"
			"\tExamples:\n"
			"\t\t./tp0 < in.txt > out.txt\n"
            "\t\tcat in.txt | ./tp0 > out.txt\n"
            
		);
	printf("%s\r\n", buffer);

}

// Imprime la version del programa
void version() {
	printf("%s", "tp0 version 1.0\n");
}

// Procesa los argumentos del programa para
// mostrar ayuda, version o ejecutar el programa
// dependiendo del caso.
int main( int argc, const char* argv[] ) {
    if(argc > 1) {
		int i;
		for(i = 1; i < argc; i++) {
			if(argv[i][1] == 'h' || strcmp(argv[i],"--help") == 0 ) {
				show_help();
			} else if (argv[i][1] == 'V' || strcmp(argv[i],"--version") == 0) {
				version();
			} else {
                printf("Argument not recognized.\n");
                
            }
		}
    } else {
        exec_program();
    }
    
    
    return 0;
}

// Ejecuta el programa de desde el parseo de la 
// entrada estandar, la multiplicacion de  matrices 
// cuadradas y la impresion del resultado.
// (Para todas las lineas de multiplicacion de 
// matrices recibidas por entrada estandard)
void exec_program() {

    //Leo de std in la entrada de caracteres.
    size_t size;
    char* string_read = read_from_stdin(&size);

    //Cada línea representa una matriz, así que leo línea por línea.
    char * cur_line = string_read;
    while(cur_line)
    {
        char * next_line = strchr(cur_line, '\n');
        if (next_line) *next_line = '\0';  // termino la línea actual temporalmente.
        
        if(strlen(cur_line) > 0) {
            process_line(cur_line);
        }
        
        if (next_line) *next_line = '\n';   // para ser limpios le devuelvo el newline a la linea.
        cur_line = next_line ? (next_line+1) : NULL;

    }
           
    free(string_read);

}

void process_line(char* line) {

     //Transformo esa entrada a doubles, en matrix_size pongo la dimensión de la matriz (sabiendo que es nxn)
    size_t matrix_size;
    double* matrixes = parse(line, &matrix_size);
    
    //Extraigo la matriz 1 y la matriz 2 de la tira de doubles parseada
    double* matrix1 = extract_matrix(matrixes, matrix_size, 0);
    double* matrix2 = extract_matrix(matrixes, matrix_size, 1);

    //instancio matrix 1
    matrix_t *matrix_one = create_matrix(matrix_size, matrix_size);
    matrix_one->array = matrix1;

    //instancio matrix 2
    matrix_t *matrix_two = create_matrix(matrix_size, matrix_size);
    matrix_two->array = matrix2;

    matrix_t *final_matrix = matrix_multiply(matrix_one, matrix_two);

    print_matrix(stdout, final_matrix);

    destroy_matrix(matrix_one);
    destroy_matrix(matrix_two);
    free(matrixes);
}

char* read_from_stdin(size_t* size)
{
    unsigned int len_max = 128;
    unsigned int current_size = 0;

    char *pStr = malloc(len_max);
    current_size = len_max;

    if(pStr != NULL)
    {
        int c = EOF;
        unsigned int i =0;
        while (( c = getchar() ) && c != EOF)
        {
            pStr[i++]=(char)c;

            //llegué al máximo tamaño.
            if(i == current_size)
            {
                current_size = i+len_max;
                if(!(pStr = realloc(pStr, current_size))){
                    logAndExit(6);
                }
            }
        }

        pStr[i] = '\0';
        *size = current_size;
        
    } else {
        logAndExit(5);
    }

    return pStr;

}

double* parse(char* string_read, size_t* matrix_size) {

    //cantidad de matrices en el string.
    //TODO - evaluar si tal vez este dato podría venir esto por param.
    int matrix_count = 2;

    //Puntero en el que se almacena cada caracter leído.
    char *p;
    p = strtok(string_read, " ");

    double* matrixes = NULL;

    //Primer caracter: tamaño de las matrices
    if((*matrix_size) = atoi(p)){

        //aloco memoria para las matrices
        int n = (*matrix_size)*(*matrix_size)*matrix_count;
        matrixes = malloc(n*sizeof(double));

        //declaro un iterador entero para significar los índices del array de resultado.
        int iterator = 0;

        while ( (p = strtok(NULL, " ")) != NULL)
        {

            //valor parseado del string
            double matrix_valueij;

            if(matrix_valueij = atof(p)){
                matrixes[iterator] = matrix_valueij;
                iterator++;
            } else {
                //Fix para cuando atof devuelve 0 (supuestamente el valor 0 está reservado para cuando falla.. a excepción que el valor
                // a parsear sea 0, entonces parece que falló cuando en realidad no.)
                //--------- TODO VER SI SE PUEDE MEJORAR.
                if(strcmp(p, "0")==0){
                    matrixes[iterator] = matrix_valueij;
                    iterator++;
                } else {
                    logAndExit(4);
                };
                
            }
        }

        if((iterator) != n) {
            logAndExit(3);
        }

    } else {
        logAndExit(2);
    }

    return matrixes;

}


double* extract_matrix(double* array_matrixes, size_t matrix_size, size_t matrix_num) {
    
    int i;
    
    if(matrix_num > 1) {
        logAndExit(1);
    }
    
    double* matrix_n = malloc(matrix_size*matrix_size*sizeof(double));
    int matrix_index = 0;
   
    for(i = 0; i < matrix_num; i++ ) {
        //Se avanza el indicador de a una matriz.
        matrix_index+=(matrix_size*matrix_size);
    }

    for(i = 0; i<(matrix_size*matrix_size); i++, matrix_index++) {
        matrix_n[i] = array_matrixes[matrix_index];
    }

    return matrix_n;
}

void logAndExit(int error_code) {
    switch(error_code) {
        case 1: {
            fprintf( stderr, "La cantidad de matrices permitidas son 2.\n");
            break;
        } case 2: {
            fprintf( stderr, "Caracter inválido para el tamaño de la matriz.\n");
            break;
        } case 3: {
            fprintf( stderr, "Tamaño inválido para la matriz. Solo se permiten matrices cuadradas.\n" );
            break;
        } case 4: {
            fprintf( stderr, "Caracter inválido para un valor de la matriz.\n");
            break;
        } case 5: {
            fprintf( stderr, "Malloc falló adquiriendo memoria.");
        } case 6: {
            fprintf( stderr, "Realloc falló realocando memoria.");
        }
    }

    exit(1);
}

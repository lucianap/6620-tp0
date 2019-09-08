#include <stdio.h>
#include <string.h>
#include <stdlib.h>
//Utilizo header, por problema de deficiones multiples
#include "matrix.h" 
#include "testing.h"

//Lee del standar input una cadena de longitud variable y la devuelve.
//Almacena el tamaño total del buffer de la cadena en size.
char* read_from_stdin(size_t* size);

//Devuelve las matrices como un array de doubles, pone el tamaño de las matrices en la variable matrixSize.
//  Formato esperado: TamañoMatriz a11 .... ann b11 .... bnn
//  Ejemplo: 2 1.1 2.7 3 4.3 1.23 6 12 1
//Casos de error:
//  1: tamaño de las matrices inválido: se pone un número no entero como tamaño
//  2: valores inválidos: solo se aceptan floats en notación científica.
//  3: tamaño de la matrix inválido: alguna de las matrices no tiene el tamaño especificado.
//Si ocurre alguno de los casos mencionados se termina la ejecución del programa.
double* parse(char* string_matrixes, size_t* matrix_size);

//Extrae la matriz [matrixNum] del array parseado.
//Solo se admite matrixNum = 0 (primera matriz) o matrixNum = 1 (segunda matriz)
double* extract_matrix(double* array_matrixes, size_t matrix_size, size_t matrix_num);

//Loguea un mensaje por stderr y sale de la aplicación.
void logAndExit(int error_code);

//Ejecuta el programa principal de multiplicación de matrices.
void exec_program();

//Procesador línea por línea.
void process_line(char* line); 

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

void version() {
	printf("%s", "tp0 version 1.0\n");
}

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

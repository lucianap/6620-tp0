#include <stdio.h>
#include <string.h>
#include <stdlib.h>
//Utilizo header, por problema de deficiones multiples
#include "matrix.h" 

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

int main()
{
    size_t size;
    char* string_read = read_from_stdin(&size);
    
    size_t matrix_size;
    double* matrixes = parse(string_read, &matrix_size);
    
    double* matrix1 = extract_matrix(matrixes, matrix_size, 0);
    double* matrix2 = extract_matrix(matrixes, matrix_size, 1);

    printf("\nSize de las matrices:%ld \n\n",matrix_size);

    printf("\nSe imprime la matriz 1 \n\n");
    int i;
    for(i = 0; i < (matrix_size*matrix_size); i++){
        printf("matrix1[%i]=%f \n", i, matrix1[i]);
    }

    printf("\nSe imprime la matriz 2 \n\n");
    for(i = 0; i < (matrix_size*matrix_size); i++){
        printf("matrix2[%i]=%f \n", i, matrix2[i]);
    }


    free(matrixes);
    free(matrix1);
    free(matrix2);    
    free(string_read);
    return 0;

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
        while (( c = getchar() ) != '\n' && c != EOF)
        {
            pStr[i++]=(char)c;

            //llegué al máximo tamaño.
            if(i == current_size)
            {
                current_size = i+len_max;
                if(!(pStr = realloc(pStr, current_size))){

                    fprintf( stderr, "Realloc falló.");
                    exit(1);

                }
            }
        }

        pStr[i] = '\0';
        *size = current_size;
        
    } else {
        fprintf( stderr, "Malloc falló.");
        exit(1);
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

                fprintf( stderr, "Caracter inválido para un valor de la matriz:%s.\n", p);
                exit(1);
            
            }
        }

        if((iterator) != n) {
            fprintf( stderr, "Tamaño inválido para la matriz. Solo se permiten matrices cuadradas.\n" );
            exit(1);
        }

    } else {
        fprintf( stderr, "Caracter inválido para el tamaño de la matriz:%s.\n", p);
        exit(1);
    }

    return matrixes;

}


double* extract_matrix(double* array_matrixes, size_t matrix_size, size_t matrix_num) {
    
    int i;
    
    if(matrix_num > 1) {
        fprintf( stderr, "La cantidad de matrices permitidas son 2.\n");
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
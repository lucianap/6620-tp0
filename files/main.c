#include <stdio.h>
#include <string.h>
#include <stdlib.h>
//Utilizo header, por problema de deficiones multiples
#include "matrix.h" 

//Lee del standar input una cadena de longitud variable y la devuelve.
//Almacena el tamaño total del buffer de la cadena en size.
char* readFromStdIn(size_t* size);

//Devuelve las matrices como un array de doubles, pone el tamaño de las matrices en la variable matrixSize.
//Formato esperado: TamañoMatriz a11 .... ann b11 .... bnn
//Ejemplo: 2 1.1 2.7 3 4.3 1.23 6 12 1
//Casos de error:
//  1: tamaño de las matrices inválido: se pone un número no entero como tamaño
//  2: valores inválidos: solo se aceptan floats en notación científica.
//  3: tamaño de la matrix inválido: alguna de las matrices no tiene el tamaño especificado.
//Si ocurre alguno de los casos mencionados se termina la ejecución del programa.
double* parse(char* stringMatrixes, size_t* matrixSize);

//Extrae la matriz [matrixNum] del array parseado.
//Solo se admite matrixNum = 0 (primera matriz) o matrixNum = 1 (segunda matriz)
double* extractMatrix(double* arrayMatrixes, size_t matrixSize, size_t matrixNum);

int main()
{
    size_t size;
    char* stringRead = readFromStdIn(&size);
    
    size_t matrixSize;
    double* matrixes = parse(stringRead, &matrixSize);
    
    double* matrix1 = extractMatrix(matrixes, matrixSize, 0);
    double* matrix2 = extractMatrix(matrixes, matrixSize, 1);

    printf("\nSize de las matrices:%ld \n\n",matrixSize);

    printf("\nSe imprime la matriz 1 \n\n");
    int i;
    for(i = 0; i < (matrixSize*matrixSize); i++){
        printf("matrix1[%i]=%f \n", i, matrix1[i]);
    }

    printf("\nSe imprime la matriz 2 \n\n");
    for(i = 0; i < (matrixSize*matrixSize); i++){
        printf("matrix2[%i]=%f \n", i, matrix2[i]);
    }


    free(matrixes);
    free(matrix1);
    free(matrix2);    
    free(stringRead);
    return 0;

}

char* readFromStdIn(size_t* size)
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

double* parse(char* stringRead, size_t* matrixSize) {

    //cantidad de matrices en el string.
    //TODO - evaluar si tal vez este dato podría venir esto por param.
    int matrixCount = 2;

    //Puntero en el que se almacena cada caracter leído.
    char *p;
    p = strtok(stringRead, " ");

    double* matrixes = NULL;

    //Primer caracter: tamaño de las matrices
    if((*matrixSize) = atoi(p)){

        //aloco memoria para las matrices
        int n = (*matrixSize)*(*matrixSize)*matrixCount;
        matrixes = malloc(n*sizeof(double));

        //declaro un iterador entero para significar los índices del array de resultado.
        int iterator = 0;

        while ( (p = strtok(NULL, " ")) != NULL)
        {

            //valor parseado del string
            double matrixValueij;

            if(matrixValueij = atof(p)){
                matrixes[iterator] = matrixValueij;
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


double* extractMatrix(double* arrayMatrixes, size_t matrixSize, size_t matrixNum) {
    
    int i;
    
    if(matrixNum > 1) {
        fprintf( stderr, "La cantidad de matrices permitidas son 2.\n");
    }
    
    double* matrixN = malloc(matrixSize*matrixSize*sizeof(double));
    int matrixIndex = 0;
   
    for(i = 0; i < matrixNum; i++ ) {
        //Se avanza el indicador de a una matriz.
        matrixIndex+=(matrixSize*matrixSize);
    }

    for(i = 0; i<(matrixSize*matrixSize); i++, matrixIndex++) {
        matrixN[i] = arrayMatrixes[matrixIndex];
    }

    return matrixN;
}
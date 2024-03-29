#ifndef __MATRIX__H
#define __MATRIX__H

#include <stdio.h>
#include <stdlib.h>

typedef struct matrix {
    size_t rows;
    size_t cols;
    double* array;
} matrix_t;

// Constructor de matrix_t
// PRE: Recibe un la cantidad (size_t) 
// de filas y de columnas de la matriz.
// POST: Devuelve un puntero a una matriz
// (matrix_t *) segun los parametros recibidos,
// reservada en memoria dinamica. 
// Queda a responsabilidad del usuario destruir 
// la matriz por medio de su destructor
// Si la puntero devuelto es NULL, implica que 
// ocurrio un error.
matrix_t* create_matrix(size_t rows, size_t cols);

// Destructor de matrix_t
// PRE: Recibe un puntero a una matriz (matrix_t) 
// creada por su constructor.
// POST: Destruye la matriz recibida.
void destroy_matrix(matrix_t* m);

// Imprime matrix_t sobre el file pointer fp 
// en el formato solicitado por el enunciado
// PRE: Recibe un flujo de salida (FILE *), y 
// un matriz (matrix_t *).
// POST: Imprime la matriz recibida de la forma:
// N C_11 C_12 ... C_nn \n
// Donde N es la cantidad de filas
// Devuelve un numero (int), menor a cero en caso 
// de error, o cero en caso de exito. 
int print_matrix(FILE* fp, matrix_t* m);

// Multiplica las matrices en m1 y m2
/*
PRE: Recibe dos punteros a matrices (matrix_t *)
POST: Multiplica las matrices recibidas, y devuelve 
una nueva matriz, almacenada en memoria dinamica.
Queda a responsabilidad del usuario liberar esta 
memoria por medio de sus destructor.
Devuelve NULL en caso de error.
*/
matrix_t* matrix_multiply(matrix_t* m1, matrix_t* m2);

// Devuelve un arreglo de con los elementos en 
// orden de la fila n
/*
PRE: Recibe un puntero a una matriz (matrix_t *), 
y el indice de una fila en la misma. 
POST: Devuelve un arreglo dinamico con los elementos 
de la fila n (double *), de la matriz recibida.
*/
double * matrix_get_row(matrix_t* m,size_t row_n);

// Devuelve un arreglo de con los elementos en 
// orden de la columna n
/*
PRE: Recibe un puntero a una matriz (matrix_t *), 
y el indice de una columna en la misma. 
POST: Devuelve un arreglo dinamico con los elementos 
de la columnas n (double *), de la matriz recibida.
*/
double * matrix_get_col(matrix_t* m,size_t col_n);

#endif // __MATRIX_H


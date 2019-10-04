#include "matrix.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Imprime matrix_t sobre el file pointer fp 
// en el formato solicitado por el enunciado
// PRE: Recibe un flujo de salida (FILE *), y 
// un matriz (matrix_t *).
// POST: Imprime la matriz recibida de la forma:
// N C_11 C_12 ... C_nn \n
// Donde N es la cantidad de filas
// Devuelve un numero (int), menor a cero en caso 
// de error, o cero en caso de exito. 
int print_matrix(FILE* fp, matrix_t* m){
	if (m->array == NULL){
		return -1;
	}
	fprintf(fp, "%d ", (int)m->rows); //N / Matriz cuadrada (NxN)
	size_t len_matriz = m->rows * m->cols;
	size_t i = 0;
	for (; i < len_matriz; ++i) {
		fprintf(fp, "%g ", m->array[i]);
	}
	fprintf(fp, "\n");
	return 0;
}

// Devuelve un arreglo de con los elementos en
// orden de la fila n
/*
PRE: Recibe un puntero a una matriz (matrix_t *),
y el indice de una fila en la misma.
POST: Devuelve un arreglo dinamico con los elementos
de la fila n (double *), de la matriz recibida.
*/
double * matrix_get_row(matrix_t* m,size_t row_n){
    double* l_row = malloc(sizeof(double) * m->rows);
    size_t i = 0;
    for (; i < m->rows;++i){
        l_row[i] = m->array[i + (row_n * m->rows)];
    }
    return l_row;
}

// Devuelve un arreglo de con los elementos en 
// orden de la columna n
/*
PRE: Recibe un puntero a una matriz (matrix_t *), 
y el indice de una columna en la misma. 
POST: Devuelve un arreglo dinamico con los elementos 
de la columnas n (double *), de la matriz recibida.
*/
double * matrix_get_col(matrix_t* m,size_t col_n){
    double* l_col= malloc(sizeof(double) * m->cols);
    size_t pos = col_n;
    size_t i = 0;
    for (; i < m->cols;++i){
        l_col[i] = m->array[pos];
        pos = pos + m->cols;
    }
    return l_col;
}



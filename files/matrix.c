#include "matrix.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

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
matrix_t* create_matrix(size_t rows, size_t cols) {
	matrix_t * new_matrix = malloc(sizeof(matrix_t));
	if (new_matrix == NULL){
		return NULL;
	}
	new_matrix->rows = rows;
	new_matrix->cols = cols;
	new_matrix->array = NULL;
	return new_matrix;
}

// Destructor de matrix_t
// PRE: Recibe un puntero a una matriz (matrix_t) 
// creada por su constructor.
// POST: Destruye la matriz recibida.
void destroy_matrix(matrix_t* m) {
	if (m->array != NULL){
		free(m->array);
	}
	free(m);
}

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
	fprintf(fp, "%d ", (int)m->rows); //N - Matriz cuadrada
	size_t len_matriz = m->rows * m->cols;
	size_t i = 0;
	for (; i < len_matriz; ++i) {
		fprintf(fp, "%g ", m->array[i]);
	}
	fprintf(fp, "\n");
	return 0;
}

double * matrix_get_row(matrix_t* m,size_t row_n){
    double* l_row = malloc(sizeof(double) * m->rows);
    for (size_t i = 0; i < m->rows;++i){
        l_row[i] = m->array[i + (row_n * m->rows)];
    }
    return l_row;
}

double * matrix_get_col(matrix_t* m,size_t col_n){
    double* l_col= malloc(sizeof(double) * m->cols);
    size_t pos = col_n;
    for (size_t i = 0; i < m->cols;++i){
        l_col[i] = m->array[pos];
        pos = pos + m->cols;
    }
    return l_col;
}

matrix_t* matrix_multiply(matrix_t* m1, matrix_t* m2){

    if (m1 == NULL || m2 == NULL){
        return NULL;
    }

    size_t rows_m1 = m1->rows;
    size_t rows_m2 = m2->rows;

    //Deben ser de igual tamano y ambas deben ser cuadradas.
    if (rows_m1 != rows_m2 ) {
        return NULL;
    }
    double* array_m1 = m1->array;
    double* array_m2 = m2->array;

    if (array_m1 == NULL || array_m2 == NULL) {
        return NULL;
    }

    matrix_t * new_matrix = create_matrix(rows_m1,rows_m1);

    if (new_matrix == NULL) {
        return NULL;
    }

    double * array_nm = malloc(sizeof(double)*rows_m1*rows_m1);
    size_t position = 0;

    for(size_t i = 0; i < rows_m1;++i){
        double * actual_row = matrix_get_row(m1,i);
        for(size_t j = 0; j < rows_m1; ++j){
            double * actual_col = matrix_get_col(m2,j);
            double aux = 0;
            for(size_t x = 0; x < rows_m1; ++x){
                aux = aux + actual_col[x] * actual_row[x];
            }
            array_nm[position] = aux;
            position++;
            free(actual_col);
        }
        free(actual_row);
    }

    new_matrix->array = array_nm;
    return new_matrix;
}


#include "matrix.h"

#include <stdio.h>
#include <stdlib.h>

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


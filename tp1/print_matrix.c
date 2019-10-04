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



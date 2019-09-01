#include "matrix.h"

#include <stdio.h>
#include <assert.h>
#include <stdbool.h>

// PRE: Recibe las descripcion de un test, 
// y un valor booleano que indique el 
// resultado del test.
// POST: Imprime la descripcion del test, 
// seguido del resultado tal que si:
// assertion == True entonces se imprime 'OK'
// assertion == False entonces se imprime 'ERROR'
void print_test(const char * test_description, bool assertion) {
	if (assertion) {
		fprintf(stderr, "Test: %s : OK.\n", test_description);
	} else {
		fprintf(stderr, "Test: %s : ERROR.\n", test_description);
	}
	
}

// PRE : Recibe una descripcion de la prueba.
// POST: Imprime la prueba por stderr, junto a 
// indicacion de cheaquear valgrind.
void print_test_valgrind(const char * test_description) {
	fprintf(stderr, "Test : %s : CHECK VALGRIND.\n", test_description);
}

// Al construir una matriz, el array interno 
// inicializa nulo
void test_create_matrix_internal_array_is_null() {
	fprintf(
		stderr, 
		"PRUEBA : AL CREAR UNA MATRIZ SU ARREGLO INTERNO ES UN PUNTERO A NULL\n"
	);
	
	matrix_t * ptr_matrix = create_matrix(0, 0);
	print_test("Crear matriz", ptr_matrix != NULL);
	if (ptr_matrix == NULL) {
		fprintf(stderr, "Error al crear matriz.\n");
		return;
	}

	print_test(
		"Al crear una matriz, su arreglo interno se inicializa en NULL", 
		ptr_matrix->array == NULL
	
	);
	
	destroy_matrix(ptr_matrix);
	print_test_valgrind("Destruir matriz");

	fprintf(stderr, "\n");
}


// La cantidad de filas y de columnas de la matriz, 
// viene definido por los parametros de su constructor.
void test_create_matrix_internal_rows_and_cols_are_parameter_values() {
	fprintf(
		stderr, 
		"PRUEBA : AL CREAR UNA MATRIZ, LA CANTIDAD DE FILAS Y COLUMNAS ESTA DEFINIDA POR PARAMETRO\n"
	);
	
	size_t two_rows = 2;
	size_t three_cols = 3;

	matrix_t * ptr_matrix = create_matrix(two_rows, three_cols);
	print_test(
		"Crear matriz con 2 filas y 3 columnas", 
		ptr_matrix != NULL
	);
	if (ptr_matrix == NULL){
		fprintf(stderr, "Error al crear matriz.\n");
		return;
	}

	print_test(
		"Al crear una matriz, la cantidad de fila y columnas viene definido por parametro", 
		(
		 	(ptr_matrix->rows == two_rows) 
		 	&& 
		 	(ptr_matrix->cols == three_cols)
		)
	);
	
	destroy_matrix(ptr_matrix);
	print_test_valgrind("Destruir matriz");
	
	fprintf(stderr, "\n");
}

// Imprimir la matriz, imprime la cantidad de filas
// seguido de un listado de los valores de la matriz 
// (por fila)
void test_print_matrix_print_rows_count_and_list_of_values() {
	fprintf(
		stderr, 
		"PRUEBA : IMPRIMIR MATRIZ IMPRIME LA CANTIDAD DE FILAS SEGUIDO DE UN LISTA DE LOS VALORES DE LA MATRIZ POR FILA\n"
	);
	
	matrix_t * ptr_matrix = create_matrix(2,2);
	print_test("Crear matriz", ptr_matrix != NULL);
	if (ptr_matrix == NULL){
		fprintf(stderr, "Error al crear matriz");
		return;
	}
	double array[] = {1,2,3,4};
	ptr_matrix->array = array;
	print_test("Asignar arreglo estatico a la matriz : {1,2,3,4}", ptr_matrix->array != NULL);
	print_test(
		"Imprimir matriz imprime la cantidad de filas, seguido de los valores de la matriz, separados por espacios : 2 1 2 3 4", 
		print_matrix(stderr, ptr_matrix) == 0
	); // A OJO <o> 

	ptr_matrix->array = NULL; 
	// Para evitar un free en memoria no dinamica
	print_test("Asignar arreglo de la matriz a NULL (desasignar arreglo estatico)", ptr_matrix->array == NULL);

	destroy_matrix(ptr_matrix);
	print_test_valgrind("Destruir matriz no genera free's invalidos");
	
	fprintf(stderr, "\n");
}

// Al asignar un array reservado en memoria 
// dinamica al atributo array de la matriz,
// luego al destruir la matriz, tambien se
// libera la memoria reservada
void test_asign_dynamic_array_to_matrix_and_destroy_also_free_array() {
	fprintf(
		stderr, 
		"PRUEBA : AL ASIGNAR UN ARREGLO RESERVADA EN MEMORIA DINAMICA A UNA MATRIZ, Y DESTRUIRLA, TAMBIEN LIBERA AL ARREGLO");
	matrix_t * ptr_matrix = create_matrix(2,2);
	print_test("Crear matriz", ptr_matrix != NULL);
	if (ptr_matrix == NULL){
		return;
	}
	size_t many_doubles = 4;
	double * array = (double *) malloc(sizeof(double) * many_doubles);
	print_test("Crear array dinamico", array != NULL);
	if (array == NULL) {
		destroy_matrix(ptr_matrix);
		return;
	}
	int i = 0;
	for (; i < many_doubles; ++i) {
		array[i] = (double)i + 0.001;
	}
	print_test("Definir contenido del array com {0.001,1.001,2.001,3.001}", true);
	ptr_matrix->array = array;
	print_test("Imprimir array imprime : 2 0.001 1.001 2.001 3.001", print_matrix(stderr, ptr_matrix) == 0);
	destroy_matrix(ptr_matrix);
	print_test_valgrind("Destruir matrix tambien libera la memoria del almacenada en el array");
	fprintf(stderr, "\n");
}
		
// Corre todas las pruebas
void run_all_tests() {
	fprintf(stderr, "\n");
	test_create_matrix_internal_array_is_null();
	test_create_matrix_internal_rows_and_cols_are_parameter_values();
	test_print_matrix_print_rows_count_and_list_of_values();
	test_asign_dynamic_array_to_matrix_and_destroy_also_free_array();
}

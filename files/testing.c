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
		"TEST : AL CREAR UNA MATRIZ SU ARREGLO INTERNO ES UN PUNTERO A NULL\n"
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
		"TEST : AL CREAR UNA MATRIZ, LA CANTIDAD DE FILAS Y COLUMNAS ESTA DEFINIDA POR PARAMETRO\n"
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
		"Al crear una matriz, la cantidad de filas y columnas viene definido por parametro", 
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
		"TEST : IMPRIMIR MATRIZ IMPRIME LA CANTIDAD DE FILAS SEGUIDO DE UN LISTA DE LOS VALORES DE LA MATRIZ POR FILA\n"
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
	fprintf(stderr, "Imprimo matrix : "); // Se imprime a continuacion en la prueba
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
		"TEST : AL ASIGNAR UN ARREGLO RESERVADA EN MEMORIA DINAMICA A UNA MATRIZ, Y DESTRUIRLA, TAMBIEN LIBERA AL ARREGLO\n");
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
	print_test("Definir contenido del arreglo com {0.001,1.001,2.001,3.001}", true);
	ptr_matrix->array = array;
	print_test("Imprimir arreglo imprime : 2 0.001 1.001 2.001 3.001", print_matrix(stderr, ptr_matrix) == 0);
	destroy_matrix(ptr_matrix);
	print_test_valgrind("Destruir matrix tambien libera la memoria del almacenada en el array");
	fprintf(stderr, "\n");
}

// Crea 2 matrices con sus respectivos arrays
// dinamicos, realiza la multiplcacion entre ambas matrices
// y compara el resultado. finalmente destruye las matrices
// y libera la memoria utilizada
void test_multiply_two_matrixs(){
	fprintf(stderr, "TEST : MULTIPLICAR DOS MATRICES DE IGUAL DIMESION\n");
    matrix_t * m1 = create_matrix(3,3);
    print_test("Crear la primera matriz", m1 != NULL);
    if (m1 == NULL){
        return;
    }
    double * array1 = malloc(sizeof(double) * 9);
	size_t i = 0;
    for(; i < 9; ++i){
        array1[i] = i;
    }
    print_test("Crear arreglo dinamico para la primera matriz", array1 != NULL);
    if (array1 == NULL) {
        destroy_matrix(m1);
        return;
    }
    m1->array = array1;
    fprintf(stderr, "Matriz 1 : ");
    print_matrix(stderr, m1);

    matrix_t * m2 = create_matrix(3,3);

    print_test("Crear la segunda matriz", m2 != NULL);
    if (m2 == NULL){
        destroy_matrix(m1);
        return;
    }

    double * array2 = malloc(sizeof(double) * 9);
    i = 0;
	for(; i < 9; ++i){
        array2[i] = i + 9;
    }
    m2->array = array2;

    print_test("Crear arreglo dinamico para la segunda matriz", array2 != NULL);
    if (array2 == NULL) {
        destroy_matrix(m1);
        destroy_matrix(m2);
        return;
    }
    fprintf(stderr, "Matriz 2 : ");
    print_matrix(stderr, m2);

    matrix_t * result = matrix_multiply(m1,m2);

    double true_result[9] = {42,45,48,150,162,174,258,279,300};
    bool is_ok = true;
    i = 0;
	for(; i < 9; ++i){
        if(result->array[i] != true_result[i]){
            is_ok = false;
            break;
        }
    }
	fprintf(stderr, "Matriz resultado esperada : 3 ");
	i = 0;
	for (; i < 9; ++i){
		fprintf(stderr, "%g ", true_result[i]);
	}
	fprintf(stderr, "\n");
	fprintf(stderr, "Matriz obtenida : ");
	print_matrix(stderr, result);
    print_test("La multiplicacion retorno el valor esperado", is_ok);
	fprintf(stderr, "Este resultado pueda dar ERROR, dependiendo de la precision de la componente de calculo de numeros en punto flotante con la que se cuenta.\n");
    destroy_matrix(m1);
    destroy_matrix(m2);
    destroy_matrix(result);
    fprintf(stderr, "\n");
}

// Crea 2 matrices con sus respectivos arrays
// dinamicos, estas tienen tamaños distintos (como requisito deben tener el mismo tamaño)
// realiza la multiplcacion entre ambas matrices
// y retorna NULL por la pre condicion.
// finalmente destruye las matrices
// y libera la memoria utilizada
void test_multiply_two_matrix_different_sizes(){
	fprintf(stderr, "TEST : MULTIPLICAR DOS MATRICES DE DISTINTA DIMNESION DEVUELVE NULL\n");
    matrix_t * m1 = create_matrix(2,2);
    print_test("Crear la primera matriz", m1 != NULL);
    if (m1 == NULL){
        return;
    }
    double * array1 = malloc(sizeof(double) * 4);
    size_t i = 0;
	for(; i < 4; ++i){
        array1[i] = i;
    }
    print_test("Crear arreglo dinamico para la primera matriz", array1 != NULL);
    if (array1 == NULL) {
        destroy_matrix(m1);
        return;
    }
    m1->array = array1;

    matrix_t * m2 = create_matrix(3,3);

    print_test("Crear la segunda matriz", m2 != NULL);
    if (m2 == NULL){
        destroy_matrix(m1);
        return;
    }

    double * array2 = malloc(sizeof(double) * 9);
    i = 0;
	for(; i < 9; ++i){
        array2[i] = i + 9;
    }
    m2->array = array2;

    print_test("Crear arreglo dinamico para la segunda matriz", array2 != NULL);
    if (array2 == NULL) {
        destroy_matrix(m1);
        destroy_matrix(m2);
        return;
    }

    matrix_t * result = matrix_multiply(m1,m2);

    print_test("Los tamaños eran distintos, la matriz resultado debe ser NULL", result == NULL );

    destroy_matrix(m1);
    destroy_matrix(m2);
    fprintf(stderr, "\n");
}

// Crea una matriz con el array lleno de cero y se
// crea otra matriz con su array con numeros
// realiza la multiplcacion entre ambas matrices
// y compara si el resultado el array esta completo con cero.
// finalmente destruye las matrices
// y libera la memoria utilizada
void test_multiply_with_zero_matrix(){
	fprintf(stderr, "TEST : MULTIPLICAR DOS MATRICES DONDE UNA DE ELLAS ES LA MATRIZ NULA, DEVUELVE LA MATRIZ LA NULA\n");
    matrix_t * m1 = create_matrix(3,3);
    print_test("Crear la primera matriz", m1 != NULL);
    if (m1 == NULL){
        return;
    }
    double * array1 = malloc(sizeof(double) * 9);
    size_t i = 0;
	for(; i < 9; ++i){
        array1[i] = i;
    }
    print_test("Crear arreglo dinamico para la primera matriz", array1 != NULL);
    if (array1 == NULL) {
        destroy_matrix(m1);
        return;
    }
    m1->array = array1;

	fprintf(stderr, "Matriz 1 : ");
    print_matrix(stderr,m1);

    matrix_t * m2 = create_matrix(3,3);

    print_test("Crear la segunda matriz", m2 != NULL);
    if (m2 == NULL){
        destroy_matrix(m1);
        return;
    }
    double * array2 = malloc(sizeof(double) * 9);
    i = 0;
    for(; i < 9; ++i){
        array2[i] = 0;
    }
    m2->array = array2;

    print_test("Crear array dinamico para la segunda matriz", array2 != NULL);
    if (array2 == NULL) {
        destroy_matrix(m1);
        destroy_matrix(m2);
        return;
    }
	fprintf(stderr, "Matriz 2 : ");
    print_matrix(stderr,m2);

    matrix_t * result = matrix_multiply(m1,m2);
    bool is_ok = true;
    i = 0;
    for(; i < 9; ++i){
        if(result->array[i] != 0){
			fprintf(stderr, "result->array[%ld] = %g", i, result->array[i]);
			is_ok = false;
            break;
        }
    }
	fprintf(stderr, "Matriz obtenida : ");
	print_matrix(stderr, result);
    print_test("La multiplicacion retorno una matriz con ceros", is_ok);
    fprintf(stderr, "Este resultado pueda dar ERROR, dependiendo de la precision de la componente de calculo de numeros en punto flotante con la que se cuenta.\n");
    destroy_matrix(m1);
    destroy_matrix(m2);
    destroy_matrix(result);
    fprintf(stderr, "\n");
}

// Corre todas las pruebas
void run_all_tests() {
	fprintf(stderr, "\n");
	test_create_matrix_internal_array_is_null();
	test_create_matrix_internal_rows_and_cols_are_parameter_values();
	test_print_matrix_print_rows_count_and_list_of_values();
	test_asign_dynamic_array_to_matrix_and_destroy_also_free_array();
	test_multiply_two_matrixs();
    test_multiply_two_matrix_different_sizes();
    test_multiply_with_zero_matrix();
}

#ifndef __TESTING__H
#define __TESTING__H

#include <stdbool.h>

// PRE: Recibe las descripcion de un test, 
// y un valor booleano que indique el 
// resultado del test.
// POST: Imprime la descripcion del test, 
// seguido del resultado tal que si:
// assertion == True entonces se imprime 'OK'
// assertion == False entonces se imprime 'ERROR'
void print_test(const char * test_description, bool assertion);

// PRE : Recibe una descripcion de la prueba.
// POST: Imprime la prueba por stderr, junto a 
// indicacion de cheaquear valgrind.
void print_test_valgrind(const char * test_description);

// Al construir una matriz, el array interno 
// inicializa nulo
void test_create_matrix_internal_array_is_null();

// Imprimir la matriz, imprime la cantidad de filas
// seguido de un listado de los valores de la matriz 
// (por fila)
void test_print_matrix_print_rows_count_and_list_of_values();

// Al asignar un array reservado en memoria 
// dinamica al atributo array de la matriz,
// luego al destruir la matriz, tambien se
// libera la memoria reservada
void test_asign_dynamic_array_to_matrix_and_destroy_also_free_array();

// Corre todas las pruebas
void run_all_tests();

#endif // __TESTING__H


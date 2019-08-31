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

// Al construir una matriz, el array interno 
// inicializa nulo
void test_create_matrix_internal_array_is_null();

void test_print_matrix_print_rows_count_and_list_of_values();

// Corre todas las pruebas
void run_all_tests();

#endif // __TESTING__H


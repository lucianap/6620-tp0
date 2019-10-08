CC=gcc
CFLAGS=-Wall -g
c_common: main.c print_matrix.o c_matrix.o mymalloc_2.o
	$(CC) $(CFLAGS) -o tp1 main.c print_matrix.o c_matrix.o mymalloc_2.o

mips_malloc_c: main.c print_matrix.o matrix_multiply.o mips_destroy_matrix.o mips_create_matrix.o mips_matrix_get_row.o mips_matrix_get_col.o mymalloc_2.o
	$(CC) $(CFLAGS) -o tp1 main.c print_matrix.o matrix_multiply.o mips_destroy_matrix.o mips_create_matrix.o mips_matrix_get_row.o mips_matrix_get_col.o mymalloc_2.o

mips_malloc_catedra: main.c print_matrix.o matrix_multiply.o mips_destroy_matrix.o mips_create_matrix.o mips_matrix_get_row.o mips_matrix_get_col.o mymalloc.o
	$(CC) $(CFLAGS) -o tp1 main.c print_matrix.o matrix_multiply.o mips_destroy_matrix.o mips_create_matrix.o mips_matrix_get_row.o mips_matrix_get_col.o mymalloc.o

mips_malloc_c_assembly: main.c print_matrix.c matrix.h matrix_multiply.S mips_destroy_matrix.S mips_create_matrix.S mips_matrix_get_row.S mips_matrix_get_col.S mymalloc_2.c mymalloc.h
	$(CC) $(CFLAGS) -O0 -S -mrnames tp1 main.c print_matrix.c matrix_multiply.S mips_destroy_matrix.S mips_create_matrix.S mips_matrix_get_row.S mips_matrix_get_col.S mymalloc_2.c

print_matrix.o: print_matrix.c matrix.h
	$(CC) $(CFLAGS) -c print_matrix.c

c_matrix.o: c_matrix.c matrix.h
	$(CC) $(CFLAGS) -c c_matrix.c

matrix_multiply.o:
	$(CC) $(CFLAGS) -c matrix_multiply.S 

mips_create_matrix.o:
	$(CC) $(CFLAGS) -c mips_create_matrix.S 

mips_destroy_matrix.o:
	$(CC) $(CFLAGS) -c mips_destroy_matrix.S 
	
mips_matrix_get_row.o:
	$(CC) $(CFLAGS) -c mips_matrix_get_row.S 

mips_matrix_get_col.o:
	$(CC) $(CFLAGS) -c mips_matrix_get_col.S 

mymalloc.o:
	$(CC) $(CFLAGS) -c mymalloc.S

mymalloc_2.o: mymalloc_2.c mymalloc.h
	$(CC) $(CFLAGS) -c mymalloc_2.c

.PHONY: clean
clean:
	rm -rf *.o

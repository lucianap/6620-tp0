CC=gcc
CFLAGS=-Wall -g
c_common: main.c print_matrix.o c_matrix.o matrix_
	$(CC) $(CFLAGS) -o tp1_c main.c print_matrix.o c_matrix.o

mips: main.c print_matrix.o matrix_multiply.o mips_destroy_matrix.o mips_create_matrix.o mymalloc.o mips_matrix_get_row.o multiply.o mips_matrix_get_col.o
	$(CC) $(CFLAGS) -o tp1_mips main.c print_matrix.o matrix_multiply.o mips_destroy_matrix.o mips_create_matrix.o mips_matrix_get_row.o mymalloc.o multiply.o mips_matrix_get_col.o

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

.PHONY: clean
clean:
	rm -rf *.o

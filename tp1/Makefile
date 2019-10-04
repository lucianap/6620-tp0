CC=gcc
CFLAGS=-Wall -g
tp1: main.c matrix.o matrix_multiply.o mips_destroy_matrix.o mymalloc.o
	$(CC) $(CFLAGS) -o tp1 main.c matrix.o matrix_multiply.o mips_destroy_matrix.o mymalloc.o

matrix.o: matrix.c matrix.h 
	$(CC) $(CFLAGS) -c matrix.c

matrix_multiply.o:
	$(CC) $(CFLAGS) -c matrix_multiply.S 

mips_destroy_matrix.o:
	$(CC) $(CFLAGS) -c mips_destroy_matrix.S 

mymalloc.o:
	$(CC) $(CFLAGS) -c mymalloc.S

.PHONY: clean
clean:
	rm -rf *.o
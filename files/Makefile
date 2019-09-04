tp0: main.c matrix.c
	gcc -o tp0 main.c matrix.c testing.c -I. 
clean: 
	rm -f *.o tp0
test-sources: main.c matrix.c testing.c
	gcc -o test mainTest.c matrix.c testing.c -I.
tests: 
	./test

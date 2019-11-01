#include <mips/regdef.h>
#include <sys/syscall.h>
#define TAM_STACK_FRAME 32
#define OFFSET_GP 16
#define OFFSET_FP 20
#define OFFSET_RA 24
	.text
	.abicalls
	.align 2

	# PRE: Recibe un puntero a matrix_t y 
	# un numero de fila valido en la matriz
	# POST: Devuelve un arreglo de doubles con 
	# elementos de la fila seleccionada 
	# almacenados en el heap
	# Queda a responsabilidad del usuario, liberar
	# dicha memoria mediante la rutina myfree

	.global matrix_get_row
	.ent matrix_get_row
matrix_get_row:
	.frame $fp,TAM_STACK_FRAME,ra
	.set	noreorder
	.cpload	t9
	.set	reorder
	subu sp,sp,TAM_STACK_FRAME
	.cprestore OFFSET_GP
	sw $fp,OFFSET_FP(sp)
	sw ra,OFFSET_RA(sp)
	move $fp,sp
	
	sw a0,TAM_STACK_FRAME($fp) 	
	# Guardo el primer 
	# parametro (la matriz)
	sw a1,(TAM_STACK_FRAME + 4)($fp) 	
	# Guardo el segundo 
	# parametro (numero # de fila)
	
	lw a0, 4(a0)	# a0 = matrix->cols
	sll a0, a0, 3	# a0 = cantidad bytes necesito
	la t9, mymalloc
	jal ra, t9
	beq v0, -1, array_malloc_error
	sw v0, (TAM_STACK_FRAME + 8)($fp)	# v0 = array_reservado
	
	li t0, 0	# indice array_reservado
	lw t1, TAM_STACK_FRAME ($fp) # t1 = ptr matriz
	lw t2, (t1) 	# t2 = cantidad de filas = cant. cols
	lw t3, (TAM_STACK_FRAME + 4)($fp) # nro de fila (row_n)
	lw t6, 8(t1) 	# t6 = matrix->array
	mul t4, t3, t2 	# matrix->rows * row_n	
	move a2, v0		# a2 = array_reservado

loop:
	bge t0, t2, exit
	addu t5, t4, t0 # (matrix->rows * row_n) + i
	sll t5, t5, 3
	addu t7, t6, t5 # t7 = & matriz[(m->rows * row_n) + i]
	l.d $f0, (t7)  	# matriz[(m->rows * row_n) + i]
	sll t8, t0, 3  	# Aumento 8 bits al index del array
	addu t5, a2, t8 # t5 = & array_reservado[k]
	s.d $f0, (t5)	# array_reservado[k] = matriz[(m->rows * row_n) + i]
	addu t0, t0, 1
	b loop

array_malloc_error:
	li v0,0
	b exit

exit:
	lw gp, OFFSET_GP(sp)
	lw $fp, OFFSET_FP(sp)
	lw ra, OFFSET_RA(sp)
	addu sp, sp, TAM_STACK_FRAME
	jr ra
	
.end matrix_get_row

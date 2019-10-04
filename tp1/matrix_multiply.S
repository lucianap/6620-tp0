#include <mips/regdef.h>
#include <sys/syscall.h>
#define TAM_STACK_FRAME 40
#define OFFSET_F0 16
#define OFFSET_GP 24
#define OFFSET_FP 28
#define OFFSET_RA 32

	.text	# texto a continuacion
	.abicalls	# Vamos a respetar las convenciones
	.align 2	# Alinea (solamente) la siguiente instruccion a 2 bytes

	# Declaro y defino mi funcion
	.globl matrix_multiply	
	.ent matrix_multiply
matrix_multiply:
    # Inicio Receta
	
    .frame $fp, TAM_STACK_FRAME, ra
	.set noreorder
	.cpload t9
	.set reorder
	subu sp, sp, TAM_STACK_FRAME
	.cprestore OFFSET_GP
	sw $fp, OFFSET_FP(sp)
	sw ra, OFFSET_RA(sp)
	s.d $f0, OFFSET_F0(sp)
	move $fp, sp
	sw a0, TAM_STACK_FRAME($fp)	# ptr matrix_1
	sw a1, (TAM_STACK_FRAME + 4)($fp) # ptr matrix_2
	
    # Fin receta

	# Inicio codigo de la funcion

	# Queremos devolver una matriz llena de 10s, 
	# para probar el correcto funcionamiento 
	# de myalloc y myfree

	# Creamos matriz nueva
	# Reservamos memoria para la estructura matrix_t
	li a0, 12	# 4 (rows, size_t) + 4 (cols, size_t) + 4 (array, ptr)	
	la t9, mymalloc
	jal ra, t9
	move a2, v0		# a2 = v0 = new_matrix (ptr)
	beq a2, -1, matrix_multiply_error
	sw a2, (TAM_STACK_FRAME + 8)($fp)		# ptr new_matrix

	# Recuperamos registros que pudieran perderse
	lw a0, (TAM_STACK_FRAME)($fp)
	lw a1, (TAM_STACK_FRAME + 4)($fp)

	# Inicializamos new_matrix 
	lw t0, (a0)		# t0 = matrix_1->rows
	sw t0, 0(a2)	# new_matrix->rows = t0 = matrix_1->rows
	sw t0, 4(a2)	# new_matrix->cols = t0 = matrix_1->rows
	addi t1, zero, -1	# t1 = -1
	sw t1, 8(a2)	# new_matrix->array = t1 = -1 (por defecto)

	# Reservamos memoria para new_matrix->array
	mul t2, t0, t0	# t2 = t0 * t0 = matrix_1->rows * matrix_1->rows = cantidad posiciones array
	sll t2, t2, 3		# Multiplico por 8 = 2^3, pues son doubles => cantidad bytes en array
	move a0, t2
	la t9, mymalloc
	jal ra, t9
	move a3, v0		# a3 = v0 = ptr array
	beq a3, -1, array_malloc_error
	sw a3, (TAM_STACK_FRAME + 12)($fp)		# ptr array 

	# Recuperamos registros que pudieran perderse
	lw a0, (TAM_STACK_FRAME)($fp)
	lw a1, (TAM_STACK_FRAME + 4)($fp)
	lw a2, (TAM_STACK_FRAME + 8)($fp)
	move v0, a2			# v0 = a2 = ptr new_matrix (guardo valor retorno)

	# Asignamos array a new_matrix
	sw a3, 8(a2)	# new_matrix->array = a3 = ptr array
	
	# Queremos llenar la matriz con 10s (dieces) 
	lw t0, (a0)			# t0 = matrix_1->rows
	mul t2, t0, t0	 	# t2 = t1 * t1 = matrix_1->rows * matrix_1->rows = cantidad posiciones array
	sll t2, t2, 3		# Multiplico por 8, pues son doubles => cantidad bytes en array
	addu t2, t2, a3		# t2 = byte siguiente al ultimo byte de new_matrix->array
	move t3, a3			# t3 = ptr new_matrix->array = primer byte de new_matrix->array
fill_loop:
	beq t2, t3, end_matrix_multiply
	li.d $f0, 10			# t4 = 10
	s.d $f0, (t3)		# new_matrix->array[i] = (t2) = t3 = 1
	addiu t3, t3, 8		# t2 = t2 + mips_sizeof(double) = t2 + 8 = byte inicial al siguiente double
	b fill_loop

array_malloc_error:
	lw a0, (TAM_STACK_FRAME + 8)($fp)	# ptr new_matrix
	la t9, myfree
	jal ra, t9
	b matrix_multiply_error

matrix_multiply_error:
	li v0, -1		# Codigo error
	b end_matrix_multiply

# Fin codigo de la funcion

# Finalizo la rutina
end_matrix_multiply:
	# Restauro registros ABI
	lw gp, OFFSET_GP(sp)
	lw $fp, OFFSET_FP(sp)
	lw ra, OFFSET_RA(sp)
	l.d $f0, OFFSET_F0(sp)

	# Destruyo Stack Frame
	addu sp, sp, TAM_STACK_FRAME

	# Devuelvo control al SO, o a la Caller
	jr ra

	.end matrix_multiply



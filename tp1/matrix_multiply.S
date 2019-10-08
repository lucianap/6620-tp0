#include <mips/regdef.h>
#include <sys/syscall.h>
#define TAM_STACK_FRAME 48
#define OFFSET_GP 32
#define OFFSET_FP 36
#define OFFSET_RA 40
#define OFFSET_S1 44
#define OFFSET_T0 16
#define OFFSET_T1 20
#define OFFSET_T3 24
#define OFFSET_T4 28

	.text	    # texto a continuacion
	.abicalls	# Vamos a respetar las convenciones
	.align 2	# Alinea (solamente) la siguiente 
				# instruccion a 2 bytes

	# PRE: Recibe dos matrices a traves de los 
	# registros a0 y a1.
	# POST: Devuelve un nueva matriz, que es el 
	# producto de la multiplicacion de las dos 
	# anteriores
	# Queda a responsabilidad del usuario destruir
	# la matriz mediante la funcion destroy_matrix

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
	move $fp, sp
	sw a0, TAM_STACK_FRAME($fp)	# ptr matrix_1
	sw a1, (TAM_STACK_FRAME + 4)($fp) # ptr matrix_2
	sw s1, OFFSET_S1($fp) # Guardo este registro 
						  # por convención
	
    # Fin receta

	# Inicio codigo de la funcion

	# Creamos matriz nueva
	move t0, a0		# t0 = a0 = matrix_1 
	lw a0, (t0)		# a0 = matrix_1->rows
	lw a1, 4(t0)	# a1 = matrix_1->cols
	la t9, create_matrix
	jal ra, t9
	move a2, v0		# a2 = v0 = new_matrix (ptr)
	beq a2, 0, matrix_multiply_error		# new_matrix == NULL
	sw a2, (TAM_STACK_FRAME + 8)($fp)		# ptr new_matrix 
	# (Guardo pues utilizare mas adelante)

	# Recuperamos registros que pudieran perderse
	lw a0, (TAM_STACK_FRAME)($fp)		# a0 = matrix_1
	lw a1, (TAM_STACK_FRAME + 4)($fp)	# a1 = matrix_2

	# Reservamos memoria para new_matrix->array
	lw t0, (a2)		# t0 = new_matrix->rows
	mul t2, t0, t0	# t2 = t0 * t0  
					#	 = new_matrix->rows * new_matrix->rows
					# 	 = cantidad posiciones array
	sll t2, t2, 3	# Multiplico por 8 = 2^3, pues son doubles 
					# => cantidad bytes en array
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
	move v0, a2	 	# v0 = a2 = ptr new_matrix 
				 	# (guardo valor retorno)

	# Asignamos array a new_matrix
	sw a3, 8(a2)	# new_matrix->array = a3 = ptr array
	 
	lw t0, (a0)		# t0 = matrix_1->rows

	#Construyo iteradores
	and t3, t3, zero
	and s1, s1, zero 	# iterador de posición 
						# dentro de la matriz.
	

i_loop:
	beq t0, t3, end_matrix_multiply # t3 = i

	#Guardo el estado de los ts en el stack
	sw t0, OFFSET_T0($fp)
	sw t3, OFFSET_T3($fp)
	
	move a0, a0
	move a1, t3 
	la t9, matrix_get_row	# get_row(m1, i)
	jal t9
						
	# Recuperamos registros que pudieran perderse
	lw a0, (TAM_STACK_FRAME)($fp)		# a0 = ptr matrix_1
	lw a1, (TAM_STACK_FRAME + 4)($fp)	# a1 = ptr matrix_2
	lw a2, (TAM_STACK_FRAME + 8)($fp)	# a2 = ptr new_matrix
	lw a3, (TAM_STACK_FRAME + 12)($fp)	# a3 = new_matrix->array
	lw t0, OFFSET_T0($fp)	# new_matrix->rows
	lw t3, OFFSET_T3($fp)	# nro fila actual

	move t1, v0		# Salvo el resultado de get_row	
					# t1 = fila actual (array de doubles)

	and t4, t4, zero	# Iterador t4
	
j_loop:
	beq t0, t4, end_j_loop	# t4 = j
	
	sw t0, OFFSET_T0($fp)
	sw t1, OFFSET_T1($fp)
	sw t3, OFFSET_T3($fp)
	sw t4, OFFSET_T4($fp)
	
	#preparo argumentos y llamo a funcion
	move a0, a1		# a0 = a1 = ptr matrix_2
	move a1, t4 	# a1 = nro columna actual
	la t9, matrix_get_col
	jal t9

	# Recuperamos registros que pudieran perderse
	lw a0, (TAM_STACK_FRAME)($fp) 		# a0 = ptr matrix_1
	lw a1, (TAM_STACK_FRAME + 4)($fp)	# a1 = ptr matrix_2
	lw a2, (TAM_STACK_FRAME + 8)($fp)	# a2 = ptr new_matrix
	lw a3, (TAM_STACK_FRAME + 12)($fp)	# a3 = new_matrix->array
	lw t0, OFFSET_T0($fp)	# new_matrix->rows
	lw t1, OFFSET_T1($fp)	# fila actual (array de doubles)
	lw t3, OFFSET_T3($fp)	# t3 = i (indice i)
	lw t4, OFFSET_T4($fp)	# t4 = j (indice j)

	move t2, v0					# Salvo el resultado de get_col
								# t2 = columna actual (array de doubles)

	and t5, t5, zero			# iterador t5

k_loop:
	beq t0, t5, end_k_loop # t5 = k

	# Obtengo actual_row[k]
	sll t6, t5, 3
	addu t6, t6, t1
	l.d $f0, (t6)

	# Obtengo actual_col[k]
	sll t6, t5, 3
	addu t6, t6, t2
	l.d $f2, (t6)

	# Sumo y acumulo
	mul.d $f6, $f0, $f2
	add.d $f4, $f4, $f6		# Acumulo en f4 

	addiu t5, t5, 1		# Avanzo t5
	b k_loop

end_k_loop:	

	#Coloco el numero calculado en su posicion final en la matriz a3
	sll t7, s1, 3	 # Escalo el iterador i a tamanio de double
	move t8, a3		 # t8 = a3 = ptr new matrix
	addu t7, t7, t8	 # Avanzo t7 bytes de t8 y lo guardo en t7
	s.d $f4, (t7) 	 # Store del resultado en new matrix
	li.d $f4, 0 	 # Reset del acumulador
	addiu s1, s1, 1
	addiu t4, t4, 1

	# Guarda registros que quiero mantener
	sw t0, OFFSET_T0($fp)
	sw t1, OFFSET_T1($fp)
	sw t3, OFFSET_T3($fp)
	sw t4, OFFSET_T4($fp)

	# Libero arreglo de elementos en columna actual
	move a0, t2
	la t9, myfree
	jal ra, t9

	# Recuperamos registros que pudieran perderse
	lw a0, (TAM_STACK_FRAME)($fp) 		# a0 = ptr matrix_1
	lw a1, (TAM_STACK_FRAME + 4)($fp)	# a1 = ptr matrix_2
	lw a2, (TAM_STACK_FRAME + 8)($fp)	# a2 = ptr new_matrix
	lw a3, (TAM_STACK_FRAME + 12)($fp)	# a3 = new_matrix->array
	lw t0, OFFSET_T0($fp)	# new_matrix->rows
	lw t1, OFFSET_T1($fp)	# fila actual (array de doubles)
	lw t3, OFFSET_T3($fp)	# t3 = i (indice i)
	lw t4, OFFSET_T4($fp)	# t4 = j (indice j)

	b j_loop

end_j_loop:
	addiu t3, t3, 1		# Avanzo t3 una posición

	# Guardo registros que quiero mantener
	sw t0, OFFSET_T0($fp)
	sw t3, OFFSET_T3($fp)

	# Libero arreglo de elementos en fila actual
	move a0, t1
	la t9, myfree
	jal ra, t9

	# Recuperamos registros que pudieran perderse
	lw a0, (TAM_STACK_FRAME)($fp)		# a0 = ptr matrix_1
	lw a1, (TAM_STACK_FRAME + 4)($fp)	# a1 = ptr matrix_2
	lw a2, (TAM_STACK_FRAME + 8)($fp)	# a2 = ptr new_matrix
	lw a3, (TAM_STACK_FRAME + 12)($fp)	# a3 = new_matrix->array
	lw t0, OFFSET_T0($fp)	# new_matrix->rows
	lw t3, OFFSET_T3($fp)	# nro fila actual

	b i_loop

array_malloc_error:
	lw a0, (TAM_STACK_FRAME + 8)($fp) # a0 = ptr new_matrix
	la t9, destroy_matrix 	# destroy_matrix ya considera 
						  	# el caso de matrix_t sin array
	jal ra, t9
	b matrix_multiply_error

matrix_multiply_error:
	li v0, 0		# Codigo error
	b end_matrix_multiply

# Fin codigo de la funcion

# Finalizo la rutina
end_matrix_multiply:
	# Coloco el resultado en v0
	move v0, a2 

	# Restauro registros ABI
	lw gp, OFFSET_GP(sp)
	lw $fp, OFFSET_FP(sp)
	lw ra, OFFSET_RA(sp)
	lw s1, OFFSET_S1(sp)

	# Destruyo Stack Frame
	addu sp, sp, TAM_STACK_FRAME

	# Devuelvo control al SO, 
	# o a la Caller
	jr ra

	.end matrix_multiply

#include <mips/regdef.h>
#include <sys/syscall.h>
#define TAM_STACK_FRAME 32
#define OFFSET_GP 16
#define OFFSET_FP 20
#define OFFSET_RA 24

	.text	# texto a continuacion
	.abicalls	# Vamos a respetar las convenciones
	.align 2	# Alinea (solamente) la siguiente 
				# instruccion a 2 bytes

	# PRE: Recibe un ptr a matrix_t creado por 
	# create_matrix, cuyo arreglo de elementos 
	# puede estar almacenado en el heap a traves 
	# de la funcion mymalloc, o ser nulo (0)
	# POST: Destruye la matrix y libera el su 
	# arreglo si es que existe

	# Declaro y defino mi funcion
	.globl destroy_matrix	
	.ent destroy_matrix
destroy_matrix:
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
	sw a0, TAM_STACK_FRAME($fp)	# ptr matrix_t 
	
    # Fin receta

	# Inicio codigo de la funcion
	# Libero matrix->array
	lw a0, 8(a0)	# a0 = matrix->array
	ble a0, 0, continuar_destruir	# a0 <= 0 ?
	la t9, myfree
	jal ra, t9
continuar_destruir:
	# Recupero registros perdidos
	lw a0, TAM_STACK_FRAME($fp)	# a0 = ptr matrix

	# Libero matrix
	la t9, myfree
	jal ra, t9

	# Fin codigo de la funcion

	# Finalizo la rutina

	# Restauro registros ABI
	lw gp, OFFSET_GP(sp)
	lw $fp, OFFSET_FP(sp)
	lw ra, OFFSET_RA(sp)

	# Destruyo Stack Frame
	addu sp, sp, TAM_STACK_FRAME

	# Devuelvo control al SO, 
	# o a la Caller
	jr ra

	.end destroy_matrix

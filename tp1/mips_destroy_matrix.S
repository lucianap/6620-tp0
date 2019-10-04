#include <mips/regdef.h>
#include <sys/syscall.h>
#define TAM_STACK_FRAME 32
#define OFFSET_GP 16
#define OFFSET_FP 20
#define OFFSET_RA 24

	.text	# texto a continuacion
	.abicalls	# Vamos a respetar las convenciones
	.align 2	# Alinea (solamente) la siguiente instruccion a 2 bytes

	# Declaro y defino mi funcion
	.globl mips_matrix_destroy	
	.ent mips_matrix_destroy
mips_matrix_destroy:
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
	sw a0, TAM_STACK_FRAME($fp)	# ptr matrix_t creada en mips por matrix_multiply
	
    # Fin receta

	# Inicio codigo de la funcion
	# Libero matrix->array
	addiu a0, a0, 8		# a0 = matrix->array
	la t9, myfree
	jal ra, t9

	# Recupero registros perdidos
	lw a0, TAM_STACK_FRAME($fp)

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

	# Devuelvo control al SO, o a la Caller
	jr ra

	.end mips_matrix_destroy



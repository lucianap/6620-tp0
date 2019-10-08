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

	# Declaro y defino mi funcion
	.globl create_matrix	
	.ent create_matrix
create_matrix:
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
	sw a0, TAM_STACK_FRAME($fp)	# rows
	sw a1, (TAM_STACK_FRAME + 4)($fp) # cols
	
    # Fin receta

	# Inicio codigo de la funcion

	# Creamos matriz nueva
	# Reservamos memoria para la estructura matrix_t
	li a0, 12	# 4 (rows, size_t) 
				# + 4 (cols, size_t) 
				# + 4 (array, ptr)	
	la t9, mymalloc
	jal ra, t9
	move a2, v0		# a2 = v0 = new_matrix (ptr)
	beq a2, -1, create_matrix_error			
	sw a2, (TAM_STACK_FRAME + 8)($fp) # ptr new_matrix

	# Recuperamos registros que pudieran perderse
	lw a0, (TAM_STACK_FRAME)($fp)
	lw a1, (TAM_STACK_FRAME + 4)($fp)

	# Inicializamos new_matrix 
	sw a0, 0(a2)	# new_matrix->rows = a0 = rows
	sw a1, 4(a2)	# new_matrix->cols = a1 = cols
	li t0, 0		# t0 = 0
	sw t0, 8(a2)	# new_matrix->array = t0 = 0 
					# (por defecto)

	# Retornamos matrix creada
	move v0, a2			# v0 = a2 = new_matrix (ptr) 
						# (guardo valor en registro 
						# retorno)
	b end_create_matrix

create_matrix_error:
	li v0, -1		# Codigo error
	b end_create_matrix

# Fin codigo de la funcion

# Finalizo la rutina
end_create_matrix:
	# Restauro registros ABI
	lw gp, OFFSET_GP(sp)
	lw $fp, OFFSET_FP(sp)
	lw ra, OFFSET_RA(sp)

	# Destruyo Stack Frame
	addu sp, sp, TAM_STACK_FRAME

	# Devuelvo control al SO, 
	# o a la Caller
	jr ra

	.end create_matrix

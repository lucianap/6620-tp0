#include <mips/regdef.h>
#include <sys/syscall.h>
#define TAM_STACK_FRAME 40
#define OFFSET_F0 16
#define OFFSET_GP 24
#define OFFSET_FP 28
#define OFFSET_RA 32
	.text
	.abicalls
	.align 2

	.globl matrix_get_col
	.ent matrix_get_col
matrix_get_col:
	.frame $fp, TAM_STACK_FRAME, ra
	.set	noreorder
	.cpload	t9
	.set	reorder
	subu sp,sp,TAM_STACK_FRAME
	.cprestore OFFSET_GP
	sw $fp,OFFSET_FP(sp)
	sw ra,OFFSET_RA(sp)
	s.d $f0,OFFSET_F0(sp)
	move $fp,sp
	
	sw a0,TAM_STACK_FRAME($fp) # a0 = ptr matriz
	sw a1,(TAM_STACK_FRAME + 4)($fp) # a1 = nro columna
	
	lw a0, 4(a0)	# a0 = matriz->cols
	sll a0, a0, 3	# a0 = matriz->cols * sizeof(double)
	la t9, mymalloc	
	jal ra,t9
	beq v0, -1, array_malloc_error
	sw v0,(TAM_STACK_FRAME + 8)($fp)
	
	li t0, 0
	lw t1, TAM_STACK_FRAME($fp) 	# t1 = ptr matriz
	lw t2, 4(t1) 	# t2 = matriz->cols = cant de cols 
	lw t3,TAM_STACK_FRAME + 4($fp) # t3 = nro columna
	lw t4, 8(t1) 	# t4 = matrix->array
	move a2,v0		# a2 = array_nro_col

loop:
	bgt t0, t2, exit
	sll t5, t3, 3	# t3 = nro_columna * sizeof(double)
	addu t6, t4, t5 # * matriz[pos] = ptr matrix[pos]
	l.d $f0, (t6)  # matriz[pos]
	sll t7, t0, 3  # Aumento 8 bites al index del array
	addu t8, a2, t7
	s.d $f0, (t8)
	addu t3, t3, t2
	addu t0, t0, 1
	b loop

array_malloc_error:
	li v0,0
	b exit

exit:
	lw gp, OFFSET_GP(sp)
	lw $fp, OFFSET_FP(sp)
	lw ra, OFFSET_RA(sp)
	l.d $f0, OFFSET_F0(sp)
	addu sp, sp, TAM_STACK_FRAME
	jr ra
	
.end matrix_get_col

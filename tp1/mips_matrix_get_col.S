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
.global matrix_get_col
.ent matrix_get_col
matrix_get_row:
	.frame $fp,TAM_STACK_FRAME,ra
	.set	noreorder
	.cpload	t9
	.set	reorder
	subu sp,sp,TAM_STACK_FRAME
	.cprestore OFFSET_GP
	sw $fp,OFFSET_FP(sp)
	sw ra,OFFSET_RA(sp)
	s.d $f0,OFFSET_F0(sp)
	move $fp,sp
	
	sw a0,TAM_STACK_FRAME($fp) #guardo el primer parametro (la matriz)
	sw a1,(TAM_STACK_FRAME + 4)($fp) #guardo el segundo parametro (numero de columna)
	
	lw a0,4(a0)
	sll a0,a0,3
	la t9,mymalloc
	jal ra,t9
	beq v0, -1, array_malloc_error
	sw v0,(TAM_STACK_FRAME + 8)($fp)
	
	li t0,0
	lw t1,TAM_STACK_FRAME ($fp) # t1 = struct matriz
	lw t2,4(t1) # t2 = cant de cols
	lw t3,TAM_STACK_FRAME + 4($fp) #Obtengo numero de col
	lw t4,8(t1) #t4 = array matrix
	move a2,v0

loop:
	bgt t0,t2,exit
	sll t3,t3,3
	addu t6,t4,t5 # * matriz[pos]
	l.d $f0,(t6)  # matriz[pos]
	sll t7,t0,3  # Aumento 8 bites al index del array
	addu t8,a2,t7
	s.d $f0,(t8)
	addu t3,t3,t2
	addu t0,t0,1
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

	.file	1 "../matrix.c"
	.section .mdebug.abi32
	.previous
	.abicalls
	.text
	.align	2
	.globl	create_matrix
	.ent	create_matrix
create_matrix:
	.frame	$fp,48,$ra		# vars= 8, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,48
	.cprestore 16
	sw	$ra,40($sp)
	sw	$fp,36($sp)
	sw	$gp,32($sp)
	move	$fp,$sp
	sw	$a0,48($fp)
	sw	$a1,52($fp)
	li	$a0,12			# 0xc
	la	$t9,malloc
	jal	$ra,$t9
	sw	$v0,24($fp)
	lw	$v0,24($fp)
	bne	$v0,$zero,$L18
	sw	$zero,28($fp)
	b	$L17
$L18:
	lw	$v1,24($fp)
	lw	$v0,48($fp)
	sw	$v0,0($v1)
	lw	$v1,24($fp)
	lw	$v0,52($fp)
	sw	$v0,4($v1)
	lw	$v0,24($fp)
	sw	$zero,8($v0)
	lw	$v0,24($fp)
	sw	$v0,28($fp)
$L17:
	lw	$v0,28($fp)
	move	$sp,$fp
	lw	$ra,40($sp)
	lw	$fp,36($sp)
	addu	$sp,$sp,48
	j	$ra
	.end	create_matrix
	.size	create_matrix, .-create_matrix
	.align	2
	.globl	destroy_matrix
	.ent	destroy_matrix
destroy_matrix:
	.frame	$fp,40,$ra		# vars= 0, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,40
	.cprestore 16
	sw	$ra,32($sp)
	sw	$fp,28($sp)
	sw	$gp,24($sp)
	move	$fp,$sp
	sw	$a0,40($fp)
	lw	$v0,40($fp)
	lw	$v0,8($v0)
	beq	$v0,$zero,$L20
	lw	$v0,40($fp)
	lw	$a0,8($v0)
	la	$t9,free
	jal	$ra,$t9
$L20:
	lw	$a0,40($fp)
	la	$t9,free
	jal	$ra,$t9
	move	$sp,$fp
	lw	$ra,32($sp)
	lw	$fp,28($sp)
	addu	$sp,$sp,40
	j	$ra
	.end	destroy_matrix
	.size	destroy_matrix, .-destroy_matrix
	.rdata
	.align	2
$LC0:
	.ascii	"%d \000"
	.align	2
$LC1:
	.ascii	"%g \000"
	.align	2
$LC2:
	.ascii	"\n\000"
	.text
	.align	2
	.globl	print_matrix
	.ent	print_matrix
print_matrix:
	.frame	$fp,56,$ra		# vars= 16, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,56
	.cprestore 16
	sw	$ra,48($sp)
	sw	$fp,44($sp)
	sw	$gp,40($sp)
	move	$fp,$sp
	sw	$a0,56($fp)
	sw	$a1,60($fp)
	lw	$v0,60($fp)
	lw	$v0,8($v0)
	bne	$v0,$zero,$L22
	li	$v0,-1			# 0xffffffffffffffff
	sw	$v0,32($fp)
	b	$L21
$L22:
	lw	$v0,60($fp)
	lw	$a0,56($fp)
	la	$a1,$LC0
	lw	$a2,0($v0)
	la	$t9,fprintf
	jal	$ra,$t9
	lw	$v0,60($fp)
	lw	$v1,60($fp)
	lw	$a0,0($v0)
	lw	$v0,4($v1)
	mult	$a0,$v0
	mflo	$v0
	sw	$v0,24($fp)
	sw	$zero,28($fp)
$L23:
	lw	$v0,28($fp)
	lw	$v1,24($fp)
	sltu	$v0,$v0,$v1
	bne	$v0,$zero,$L26
	b	$L24
$L26:
	lw	$a0,60($fp)
	lw	$v0,28($fp)
	sll	$v1,$v0,3
	lw	$v0,8($a0)
	addu	$v0,$v1,$v0
	lw	$a0,56($fp)
	la	$a1,$LC1
	lw	$a2,0($v0)
	lw	$a3,4($v0)
	la	$t9,fprintf
	jal	$ra,$t9
	lw	$v0,28($fp)
	addu	$v0,$v0,1
	sw	$v0,28($fp)
	b	$L23
$L24:
	lw	$a0,56($fp)
	la	$a1,$LC2
	la	$t9,fprintf
	jal	$ra,$t9
	sw	$zero,32($fp)
$L21:
	lw	$v0,32($fp)
	move	$sp,$fp
	lw	$ra,48($sp)
	lw	$fp,44($sp)
	addu	$sp,$sp,56
	j	$ra
	.end	print_matrix
	.size	print_matrix, .-print_matrix
	.align	2
	.globl	matrix_get_row
	.ent	matrix_get_row
matrix_get_row:
	.frame	$fp,48,$ra		# vars= 8, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,48
	.cprestore 16
	sw	$ra,40($sp)
	sw	$fp,36($sp)
	sw	$gp,32($sp)
	move	$fp,$sp
	sw	$a0,48($fp)
	sw	$a1,52($fp)
	lw	$v0,48($fp)
	lw	$v0,0($v0)
	sll	$v0,$v0,3
	move	$a0,$v0
	la	$t9,malloc
	jal	$ra,$t9
	sw	$v0,24($fp)
	sw	$zero,28($fp)
$L28:
	lw	$v0,48($fp)
	lw	$v1,28($fp)
	lw	$v0,0($v0)
	sltu	$v0,$v1,$v0
	bne	$v0,$zero,$L31
	b	$L29
$L31:
	lw	$v0,28($fp)
	sll	$v1,$v0,3
	lw	$v0,24($fp)
	addu	$a1,$v1,$v0
	lw	$a0,48($fp)
	lw	$v0,48($fp)
	lw	$v1,52($fp)
	lw	$v0,0($v0)
	mult	$v1,$v0
	mflo	$v1
	lw	$v0,28($fp)
	addu	$v0,$v1,$v0
	sll	$v1,$v0,3
	lw	$v0,8($a0)
	addu	$v0,$v1,$v0
	l.d	$f0,0($v0)
	s.d	$f0,0($a1)
	lw	$v0,28($fp)
	addu	$v0,$v0,1
	sw	$v0,28($fp)
	b	$L28
$L29:
	lw	$v0,24($fp)
	move	$sp,$fp
	lw	$ra,40($sp)
	lw	$fp,36($sp)
	addu	$sp,$sp,48
	j	$ra
	.end	matrix_get_row
	.size	matrix_get_row, .-matrix_get_row
	.align	2
	.globl	matrix_get_col
	.ent	matrix_get_col
matrix_get_col:
	.frame	$fp,56,$ra		# vars= 16, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,56
	.cprestore 16
	sw	$ra,48($sp)
	sw	$fp,44($sp)
	sw	$gp,40($sp)
	move	$fp,$sp
	sw	$a0,56($fp)
	sw	$a1,60($fp)
	lw	$v0,56($fp)
	lw	$v0,4($v0)
	sll	$v0,$v0,3
	move	$a0,$v0
	la	$t9,malloc
	jal	$ra,$t9
	sw	$v0,24($fp)
	lw	$v0,60($fp)
	sw	$v0,28($fp)
	sw	$zero,32($fp)
$L33:
	lw	$v0,56($fp)
	lw	$v1,32($fp)
	lw	$v0,4($v0)
	sltu	$v0,$v1,$v0
	bne	$v0,$zero,$L36
	b	$L34
$L36:
	lw	$v0,32($fp)
	sll	$v1,$v0,3
	lw	$v0,24($fp)
	addu	$a1,$v1,$v0
	lw	$a0,56($fp)
	lw	$v0,28($fp)
	sll	$v1,$v0,3
	lw	$v0,8($a0)
	addu	$v0,$v1,$v0
	l.d	$f0,0($v0)
	s.d	$f0,0($a1)
	lw	$v0,56($fp)
	lw	$v1,28($fp)
	lw	$v0,4($v0)
	addu	$v0,$v1,$v0
	sw	$v0,28($fp)
	lw	$v0,32($fp)
	addu	$v0,$v0,1
	sw	$v0,32($fp)
	b	$L33
$L34:
	lw	$v0,24($fp)
	move	$sp,$fp
	lw	$ra,48($sp)
	lw	$fp,44($sp)
	addu	$sp,$sp,56
	j	$ra
	.end	matrix_get_col
	.size	matrix_get_col, .-matrix_get_col
	.align	2
	.globl	matrix_multiply
	.ent	matrix_multiply
matrix_multiply:
	.frame	$fp,104,$ra		# vars= 64, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,104
	.cprestore 16
	sw	$ra,96($sp)
	sw	$fp,92($sp)
	sw	$gp,88($sp)
	move	$fp,$sp
	sw	$a0,104($fp)
	sw	$a1,108($fp)
	lw	$v0,104($fp)
	beq	$v0,$zero,$L39
	lw	$v0,108($fp)
	bne	$v0,$zero,$L38
$L39:
	sw	$zero,84($fp)
	b	$L37
$L38:
	lw	$v0,104($fp)
	lw	$v0,0($v0)
	sw	$v0,24($fp)
	lw	$v0,108($fp)
	lw	$v0,0($v0)
	sw	$v0,28($fp)
	lw	$v1,24($fp)
	lw	$v0,28($fp)
	beq	$v1,$v0,$L40
	sw	$zero,84($fp)
	b	$L37
$L40:
	lw	$v0,104($fp)
	lw	$v0,8($v0)
	sw	$v0,32($fp)
	lw	$v0,108($fp)
	lw	$v0,8($v0)
	sw	$v0,36($fp)
	lw	$v0,32($fp)
	beq	$v0,$zero,$L42
	lw	$v0,36($fp)
	bne	$v0,$zero,$L41
$L42:
	sw	$zero,84($fp)
	b	$L37
$L41:
	lw	$a0,24($fp)
	lw	$a1,24($fp)
	la	$t9,create_matrix
	jal	$ra,$t9
	sw	$v0,40($fp)
	lw	$v0,40($fp)
	bne	$v0,$zero,$L43
	sw	$zero,84($fp)
	b	$L37
$L43:
	lw	$v1,24($fp)
	lw	$v0,24($fp)
	mult	$v1,$v0
	mflo	$v0
	sll	$v0,$v0,3
	move	$a0,$v0
	la	$t9,malloc
	jal	$ra,$t9
	sw	$v0,44($fp)
	sw	$zero,48($fp)
	sw	$zero,52($fp)
$L44:
	lw	$v0,52($fp)
	lw	$v1,24($fp)
	sltu	$v0,$v0,$v1
	bne	$v0,$zero,$L47
	b	$L45
$L47:
	lw	$a0,104($fp)
	lw	$a1,52($fp)
	la	$t9,matrix_get_row
	jal	$ra,$t9
	sw	$v0,56($fp)
	sw	$zero,60($fp)
$L48:
	lw	$v0,60($fp)
	lw	$v1,24($fp)
	sltu	$v0,$v0,$v1
	bne	$v0,$zero,$L51
	b	$L49
$L51:
	lw	$a0,108($fp)
	lw	$a1,60($fp)
	la	$t9,matrix_get_col
	jal	$ra,$t9
	sw	$v0,64($fp)
	sw	$zero,72($fp)
	sw	$zero,76($fp)
	sw	$zero,80($fp)
$L52:
	lw	$v0,80($fp)
	lw	$v1,24($fp)
	sltu	$v0,$v0,$v1
	bne	$v0,$zero,$L55
	b	$L53
$L55:
	lw	$v0,80($fp)
	sll	$v1,$v0,3
	lw	$v0,64($fp)
	addu	$a0,$v1,$v0
	lw	$v0,80($fp)
	sll	$v1,$v0,3
	lw	$v0,56($fp)
	addu	$v0,$v1,$v0
	l.d	$f2,0($a0)
	l.d	$f0,0($v0)
	mul.d	$f2,$f2,$f0
	l.d	$f0,72($fp)
	add.d	$f0,$f0,$f2
	s.d	$f0,72($fp)
	lw	$v0,80($fp)
	addu	$v0,$v0,1
	sw	$v0,80($fp)
	b	$L52
$L53:
	lw	$v0,48($fp)
	sll	$v1,$v0,3
	lw	$v0,44($fp)
	addu	$v0,$v1,$v0
	l.d	$f0,72($fp)
	s.d	$f0,0($v0)
	lw	$v0,48($fp)
	addu	$v0,$v0,1
	sw	$v0,48($fp)
	lw	$a0,64($fp)
	la	$t9,free
	jal	$ra,$t9
	lw	$v0,60($fp)
	addu	$v0,$v0,1
	sw	$v0,60($fp)
	b	$L48
$L49:
	lw	$a0,56($fp)
	la	$t9,free
	jal	$ra,$t9
	lw	$v0,52($fp)
	addu	$v0,$v0,1
	sw	$v0,52($fp)
	b	$L44
$L45:
	lw	$v0,40($fp)
	lw	$v1,44($fp)
	sw	$v1,8($v0)
	lw	$v0,40($fp)
	sw	$v0,84($fp)
$L37:
	lw	$v0,84($fp)
	move	$sp,$fp
	lw	$ra,96($sp)
	lw	$fp,92($sp)
	addu	$sp,$sp,104
	j	$ra
	.end	matrix_multiply
	.size	matrix_multiply, .-matrix_multiply
	.ident	"GCC: (GNU) 3.3.3 (NetBSD nb3 20040520)"

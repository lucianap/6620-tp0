	.file	1 "../main.c"
	.section .mdebug.abi32
	.previous
	.abicalls
	.rdata
	.align	2
$LC0:
	.ascii	"%s\000"
	.align	2
$LC1:
	.ascii	"\tUsage: \n"
	.ascii	"\t\t./tp0 -h \n"
	.ascii	"\t\t./tp0 -V \n"
	.ascii	"\t\t./tp0 < in_file > out_file\n"
	.ascii	"\ttp0 [options] \n"
	.ascii	"\tOptions: \n"
	.ascii	"\t\t-V, --version \tPrint version and quit.\n"
	.ascii	"\t\t-h, --help \tPrint this information.\n"
	.ascii	"\tExamples:\n"
	.ascii	"\t\t./tp0 < in.txt > out.txt\n"
	.ascii	"\t\tcat in.txt | ./tp0 > out.txt\n\000"
	.align	2
$LC2:
	.ascii	"%s\r\n\000"
	.text
	.align	2
	.globl	show_help
	.ent	show_help
show_help:
	.frame	$fp,552,$ra		# vars= 512, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,552
	.cprestore 16
	sw	$ra,544($sp)
	sw	$fp,540($sp)
	sw	$gp,536($sp)
	move	$fp,$sp
	addu	$a0,$fp,24
	li	$a1,512			# 0x200
	la	$a2,$LC0
	la	$a3,$LC1
	la	$t9,snprintf
	jal	$ra,$t9
	la	$a0,$LC2
	addu	$a1,$fp,24
	la	$t9,printf
	jal	$ra,$t9
	move	$sp,$fp
	lw	$ra,544($sp)
	lw	$fp,540($sp)
	addu	$sp,$sp,552
	j	$ra
	.end	show_help
	.size	show_help, .-show_help
	.rdata
	.align	2
$LC3:
	.ascii	"tp0 version 1.0\n\000"
	.text
	.align	2
	.globl	version
	.ent	version
version:
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
	la	$a0,$LC0
	la	$a1,$LC3
	la	$t9,printf
	jal	$ra,$t9
	move	$sp,$fp
	lw	$ra,32($sp)
	lw	$fp,28($sp)
	addu	$sp,$sp,40
	j	$ra
	.end	version
	.size	version, .-version
	.rdata
	.align	2
$LC4:
	.ascii	"--help\000"
	.align	2
$LC5:
	.ascii	"--version\000"
	.align	2
$LC6:
	.ascii	"Argument not recognized.\n\000"
	.text
	.align	2
	.globl	main
	.ent	main
main:
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
	slt	$v0,$v0,2
	bne	$v0,$zero,$L20
	li	$v0,1			# 0x1
	sw	$v0,24($fp)
$L21:
	lw	$v0,24($fp)
	lw	$v1,48($fp)
	slt	$v0,$v0,$v1
	bne	$v0,$zero,$L24
	b	$L31
$L24:
	lw	$v0,24($fp)
	sll	$v1,$v0,2
	lw	$v0,52($fp)
	addu	$v0,$v1,$v0
	lw	$v0,0($v0)
	addu	$v0,$v0,1
	lb	$v1,0($v0)
	li	$v0,104			# 0x68
	beq	$v1,$v0,$L26
	lw	$v0,24($fp)
	sll	$v1,$v0,2
	lw	$v0,52($fp)
	addu	$v0,$v1,$v0
	lw	$a0,0($v0)
	la	$a1,$LC4
	la	$t9,strcmp
	jal	$ra,$t9
	bne	$v0,$zero,$L25
$L26:
	la	$t9,show_help
	jal	$ra,$t9
	b	$L23
$L25:
	lw	$v0,24($fp)
	sll	$v1,$v0,2
	lw	$v0,52($fp)
	addu	$v0,$v1,$v0
	lw	$v0,0($v0)
	addu	$v0,$v0,1
	lb	$v1,0($v0)
	li	$v0,86			# 0x56
	beq	$v1,$v0,$L29
	lw	$v0,24($fp)
	sll	$v1,$v0,2
	lw	$v0,52($fp)
	addu	$v0,$v1,$v0
	lw	$a0,0($v0)
	la	$a1,$LC5
	la	$t9,strcmp
	jal	$ra,$t9
	bne	$v0,$zero,$L28
$L29:
	la	$t9,version
	jal	$ra,$t9
	b	$L23
$L28:
	la	$a0,$LC6
	la	$t9,printf
	jal	$ra,$t9
$L23:
	lw	$v0,24($fp)
	addu	$v0,$v0,1
	sw	$v0,24($fp)
	b	$L21
$L20:
	la	$t9,exec_program
	jal	$ra,$t9
$L31:
	move	$v0,$zero
	move	$sp,$fp
	lw	$ra,40($sp)
	lw	$fp,36($sp)
	addu	$sp,$sp,48
	j	$ra
	.end	main
	.size	main, .-main
	.align	2
	.globl	exec_program
	.ent	exec_program
exec_program:
	.frame	$fp,64,$ra		# vars= 24, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,64
	.cprestore 16
	sw	$ra,56($sp)
	sw	$fp,52($sp)
	sw	$gp,48($sp)
	move	$fp,$sp
	addu	$a0,$fp,24
	la	$t9,read_from_stdin
	jal	$ra,$t9
	sw	$v0,28($fp)
	lw	$v0,28($fp)
	sw	$v0,32($fp)
$L33:
	lw	$v0,32($fp)
	bne	$v0,$zero,$L35
	b	$L34
$L35:
	lw	$a0,32($fp)
	li	$a1,10			# 0xa
	la	$t9,strchr
	jal	$ra,$t9
	sw	$v0,36($fp)
	lw	$v0,36($fp)
	beq	$v0,$zero,$L36
	lw	$v0,36($fp)
	sb	$zero,0($v0)
$L36:
	lw	$v0,32($fp)
	lb	$v0,0($v0)
	beq	$v0,$zero,$L37
	lw	$a0,32($fp)
	la	$t9,process_line
	jal	$ra,$t9
$L37:
	lw	$v0,36($fp)
	beq	$v0,$zero,$L38
	lw	$v1,36($fp)
	li	$v0,10			# 0xa
	sb	$v0,0($v1)
$L38:
	lw	$v0,36($fp)
	beq	$v0,$zero,$L39
	lw	$v0,36($fp)
	addu	$v0,$v0,1
	sw	$v0,40($fp)
	b	$L40
$L39:
	sw	$zero,40($fp)
$L40:
	lw	$v0,40($fp)
	sw	$v0,32($fp)
	b	$L33
$L34:
	lw	$a0,28($fp)
	la	$t9,free
	jal	$ra,$t9
	move	$sp,$fp
	lw	$ra,56($sp)
	lw	$fp,52($sp)
	addu	$sp,$sp,64
	j	$ra
	.end	exec_program
	.size	exec_program, .-exec_program
	.align	2
	.globl	process_line
	.ent	process_line
process_line:
	.frame	$fp,72,$ra		# vars= 32, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,72
	.cprestore 16
	sw	$ra,64($sp)
	sw	$fp,60($sp)
	sw	$gp,56($sp)
	move	$fp,$sp
	sw	$a0,72($fp)
	lw	$a0,72($fp)
	addu	$a1,$fp,24
	la	$t9,parse
	jal	$ra,$t9
	sw	$v0,28($fp)
	lw	$a0,28($fp)
	lw	$a1,24($fp)
	move	$a2,$zero
	la	$t9,extract_matrix
	jal	$ra,$t9
	sw	$v0,32($fp)
	lw	$a0,28($fp)
	lw	$a1,24($fp)
	li	$a2,1			# 0x1
	la	$t9,extract_matrix
	jal	$ra,$t9
	sw	$v0,36($fp)
	lw	$a0,24($fp)
	lw	$a1,24($fp)
	la	$t9,create_matrix
	jal	$ra,$t9
	sw	$v0,40($fp)
	lw	$v1,40($fp)
	lw	$v0,32($fp)
	sw	$v0,8($v1)
	lw	$a0,24($fp)
	lw	$a1,24($fp)
	la	$t9,create_matrix
	jal	$ra,$t9
	sw	$v0,44($fp)
	lw	$v1,44($fp)
	lw	$v0,36($fp)
	sw	$v0,8($v1)
	lw	$a0,40($fp)
	lw	$a1,44($fp)
	la	$t9,matrix_multiply
	jal	$ra,$t9
	sw	$v0,48($fp)
	la	$a0,__sF+88
	lw	$a1,48($fp)
	la	$t9,print_matrix
	jal	$ra,$t9
	lw	$a0,40($fp)
	la	$t9,destroy_matrix
	jal	$ra,$t9
	lw	$a0,44($fp)
	la	$t9,destroy_matrix
	jal	$ra,$t9
	lw	$a0,28($fp)
	la	$t9,free
	jal	$ra,$t9
	move	$sp,$fp
	lw	$ra,64($sp)
	lw	$fp,60($sp)
	addu	$sp,$sp,72
	j	$ra
	.end	process_line
	.size	process_line, .-process_line
	.align	2
	.globl	read_from_stdin
	.ent	read_from_stdin
read_from_stdin:
	.frame	$fp,64,$ra		# vars= 24, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,64
	.cprestore 16
	sw	$ra,56($sp)
	sw	$fp,52($sp)
	sw	$gp,48($sp)
	move	$fp,$sp
	sw	$a0,64($fp)
	li	$v0,128			# 0x80
	sw	$v0,24($fp)
	sw	$zero,28($fp)
	lw	$a0,24($fp)
	la	$t9,malloc
	jal	$ra,$t9
	sw	$v0,32($fp)
	lw	$v0,24($fp)
	sw	$v0,28($fp)
	lw	$v0,32($fp)
	beq	$v0,$zero,$L43
	li	$v0,-1			# 0xffffffffffffffff
	sw	$v0,36($fp)
	sw	$zero,40($fp)
$L44:
	lw	$v0,__sF+4
	addu	$v0,$v0,-1
	sw	$v0,__sF+4
	bgez	$v0,$L48
	la	$a0,__sF
	la	$t9,__srget
	jal	$ra,$t9
	sw	$v0,44($fp)
	b	$L49
$L48:
	la	$v0,__sF
	lw	$v1,0($v0)
	move	$a0,$v1
	lbu	$a0,0($a0)
	sw	$a0,44($fp)
	addu	$v1,$v1,1
	sw	$v1,0($v0)
$L49:
	lw	$v0,44($fp)
	sw	$v0,36($fp)
	beq	$v0,$zero,$L45
	lw	$v1,36($fp)
	li	$v0,-1			# 0xffffffffffffffff
	bne	$v1,$v0,$L46
	b	$L45
$L46:
	addu	$a1,$fp,40
	lw	$v1,0($a1)
	move	$a0,$v1
	lw	$v0,32($fp)
	addu	$a0,$a0,$v0
	lbu	$v0,36($fp)
	sb	$v0,0($a0)
	addu	$v1,$v1,1
	sw	$v1,0($a1)
	lw	$v1,40($fp)
	lw	$v0,28($fp)
	bne	$v1,$v0,$L44
	lw	$v1,40($fp)
	lw	$v0,24($fp)
	addu	$v0,$v1,$v0
	sw	$v0,28($fp)
	lw	$a0,32($fp)
	lw	$a1,28($fp)
	la	$t9,realloc
	jal	$ra,$t9
	sw	$v0,32($fp)
	lw	$v0,32($fp)
	bne	$v0,$zero,$L44
	li	$a0,6			# 0x6
	la	$t9,logAndExit
	jal	$ra,$t9
	b	$L44
$L45:
	lw	$v1,32($fp)
	lw	$v0,40($fp)
	addu	$v0,$v1,$v0
	sb	$zero,0($v0)
	lw	$v1,64($fp)
	lw	$v0,28($fp)
	sw	$v0,0($v1)
	b	$L52
$L43:
	li	$a0,5			# 0x5
	la	$t9,logAndExit
	jal	$ra,$t9
$L52:
	lw	$v0,32($fp)
	move	$sp,$fp
	lw	$ra,56($sp)
	lw	$fp,52($sp)
	addu	$sp,$sp,64
	j	$ra
	.end	read_from_stdin
	.size	read_from_stdin, .-read_from_stdin
	.rdata
	.align	2
$LC7:
	.ascii	" \000"
	.align	2
$LC8:
	.ascii	"0\000"
	.text
	.align	2
	.globl	parse
	.ent	parse
parse:
	.frame	$fp,72,$ra		# vars= 32, regs= 4/0, args= 16, extra= 8
	.mask	0xd0010000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,72
	.cprestore 16
	sw	$ra,68($sp)
	sw	$fp,64($sp)
	sw	$gp,60($sp)
	sw	$s0,56($sp)
	move	$fp,$sp
	sw	$a0,72($fp)
	sw	$a1,76($fp)
	li	$v0,2			# 0x2
	sw	$v0,24($fp)
	lw	$a0,72($fp)
	la	$a1,$LC7
	la	$t9,strtok
	jal	$ra,$t9
	sw	$v0,28($fp)
	sw	$zero,32($fp)
	lw	$s0,76($fp)
	lw	$a0,28($fp)
	la	$t9,atoi
	jal	$ra,$t9
	sw	$v0,0($s0)
	lw	$v0,0($s0)
	beq	$v0,$zero,$L54
	lw	$v0,76($fp)
	lw	$v1,76($fp)
	lw	$a0,0($v0)
	lw	$v0,0($v1)
	mult	$a0,$v0
	mflo	$v1
	lw	$v0,24($fp)
	mult	$v1,$v0
	mflo	$v0
	sw	$v0,36($fp)
	lw	$v0,36($fp)
	sll	$v0,$v0,3
	move	$a0,$v0
	la	$t9,malloc
	jal	$ra,$t9
	sw	$v0,32($fp)
	sw	$zero,40($fp)
$L55:
	move	$a0,$zero
	la	$a1,$LC7
	la	$t9,strtok
	jal	$ra,$t9
	sw	$v0,28($fp)
	lw	$v0,28($fp)
	bne	$v0,$zero,$L57
	b	$L56
$L57:
	lw	$a0,28($fp)
	la	$t9,atof
	jal	$ra,$t9
	s.d	$f0,48($fp)
	l.d	$f2,48($fp)
	mtc1	$zero,$f0
	mtc1	$zero,$f1
	c.eq.d	$f2,$f0
	bc1f	$L59
	b	$L58
$L59:
	lw	$v0,40($fp)
	sll	$v1,$v0,3
	lw	$v0,32($fp)
	addu	$v0,$v1,$v0
	l.d	$f0,48($fp)
	s.d	$f0,0($v0)
	lw	$v0,40($fp)
	addu	$v0,$v0,1
	sw	$v0,40($fp)
	b	$L55
$L58:
	lw	$a0,28($fp)
	la	$a1,$LC8
	la	$t9,strcmp
	jal	$ra,$t9
	bne	$v0,$zero,$L61
	lw	$v0,40($fp)
	sll	$v1,$v0,3
	lw	$v0,32($fp)
	addu	$v0,$v1,$v0
	l.d	$f0,48($fp)
	s.d	$f0,0($v0)
	lw	$v0,40($fp)
	addu	$v0,$v0,1
	sw	$v0,40($fp)
	b	$L55
$L61:
	li	$a0,4			# 0x4
	la	$t9,logAndExit
	jal	$ra,$t9
	b	$L55
$L56:
	lw	$v1,40($fp)
	lw	$v0,36($fp)
	beq	$v1,$v0,$L64
	li	$a0,3			# 0x3
	la	$t9,logAndExit
	jal	$ra,$t9
	b	$L64
$L54:
	li	$a0,2			# 0x2
	la	$t9,logAndExit
	jal	$ra,$t9
$L64:
	lw	$v0,32($fp)
	move	$sp,$fp
	lw	$ra,68($sp)
	lw	$fp,64($sp)
	lw	$s0,56($sp)
	addu	$sp,$sp,72
	j	$ra
	.end	parse
	.size	parse, .-parse
	.align	2
	.globl	extract_matrix
	.ent	extract_matrix
extract_matrix:
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
	sw	$a2,64($fp)
	lw	$v0,64($fp)
	sltu	$v0,$v0,2
	bne	$v0,$zero,$L66
	li	$a0,1			# 0x1
	la	$t9,logAndExit
	jal	$ra,$t9
$L66:
	lw	$v1,60($fp)
	lw	$v0,60($fp)
	mult	$v1,$v0
	mflo	$v0
	sll	$v0,$v0,3
	move	$a0,$v0
	la	$t9,malloc
	jal	$ra,$t9
	sw	$v0,28($fp)
	sw	$zero,32($fp)
	sw	$zero,24($fp)
$L67:
	lw	$v0,24($fp)
	lw	$v1,64($fp)
	sltu	$v0,$v0,$v1
	bne	$v0,$zero,$L70
	b	$L68
$L70:
	lw	$v1,60($fp)
	lw	$v0,60($fp)
	mult	$v1,$v0
	mflo	$v1
	lw	$v0,32($fp)
	addu	$v0,$v0,$v1
	sw	$v0,32($fp)
	lw	$v0,24($fp)
	addu	$v0,$v0,1
	sw	$v0,24($fp)
	b	$L67
$L68:
	sw	$zero,24($fp)
$L71:
	lw	$v1,60($fp)
	lw	$v0,60($fp)
	mult	$v1,$v0
	mflo	$v1
	lw	$v0,24($fp)
	sltu	$v0,$v0,$v1
	bne	$v0,$zero,$L74
	b	$L72
$L74:
	lw	$v0,24($fp)
	sll	$v1,$v0,3
	lw	$v0,28($fp)
	addu	$a0,$v1,$v0
	lw	$v0,32($fp)
	sll	$v1,$v0,3
	lw	$v0,56($fp)
	addu	$v0,$v1,$v0
	l.d	$f0,0($v0)
	s.d	$f0,0($a0)
	lw	$v0,24($fp)
	addu	$v0,$v0,1
	sw	$v0,24($fp)
	lw	$v0,32($fp)
	addu	$v0,$v0,1
	sw	$v0,32($fp)
	b	$L71
$L72:
	lw	$v0,28($fp)
	move	$sp,$fp
	lw	$ra,48($sp)
	lw	$fp,44($sp)
	addu	$sp,$sp,56
	j	$ra
	.end	extract_matrix
	.size	extract_matrix, .-extract_matrix
	.rdata
	.align	2
$LC9:
	.ascii	"La cantidad de matrices permitidas son 2.\n\000"
	.align	2
$LC10:
	.ascii	"Caracter inv\303\241lido para el tama\303\261o de la mat"
	.ascii	"riz.\n\000"
	.align	2
$LC11:
	.ascii	"Tama\303\261o inv\303\241lido para la matriz. Solo se pe"
	.ascii	"rmiten matrices cuadradas.\n\000"
	.align	2
$LC12:
	.ascii	"Caracter inv\303\241lido para un valor de la matriz.\n\000"
	.align	2
$LC13:
	.ascii	"Malloc fall\303\263 adquiriendo memoria.\000"
	.align	2
$LC14:
	.ascii	"Realloc fall\303\263 realocando memoria.\000"
	.text
	.align	2
	.globl	logAndExit
	.ent	logAndExit
logAndExit:
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
	sltu	$v0,$v0,7
	beq	$v0,$zero,$L76
	lw	$v0,40($fp)
	sll	$v1,$v0,2
	la	$v0,$L83
	addu	$v0,$v1,$v0
	lw	$v0,0($v0)
	.cpadd	$v0
	j	$v0
	.rdata
	.align	2
$L83:
	.gpword	$L76
	.gpword	$L77
	.gpword	$L78
	.gpword	$L79
	.gpword	$L80
	.gpword	$L81
	.gpword	$L82
	.text
$L77:
	la	$a0,__sF+176
	la	$a1,$LC9
	la	$t9,fprintf
	jal	$ra,$t9
	b	$L76
$L78:
	la	$a0,__sF+176
	la	$a1,$LC10
	la	$t9,fprintf
	jal	$ra,$t9
	b	$L76
$L79:
	la	$a0,__sF+176
	la	$a1,$LC11
	la	$t9,fprintf
	jal	$ra,$t9
	b	$L76
$L80:
	la	$a0,__sF+176
	la	$a1,$LC12
	la	$t9,fprintf
	jal	$ra,$t9
	b	$L76
$L81:
	la	$a0,__sF+176
	la	$a1,$LC13
	la	$t9,fprintf
	jal	$ra,$t9
$L82:
	la	$a0,__sF+176
	la	$a1,$LC14
	la	$t9,fprintf
	jal	$ra,$t9
$L76:
	li	$a0,1			# 0x1
	la	$t9,exit
	jal	$ra,$t9
	.end	logAndExit
	.size	logAndExit, .-logAndExit
	.ident	"GCC: (GNU) 3.3.3 (NetBSD nb3 20040520)"

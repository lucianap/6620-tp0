	.section .mdebug.abi32
	.previous
	.abicalls
	.file 1 "main.c"
	.section	.debug_abbrev,"",@progbits
$Ldebug_abbrev0:
	.section	.debug_info,"",@progbits
$Ldebug_info0:
	.section	.debug_line,"",@progbits
$Ldebug_line0:
	.text
$Ltext0:
	.file 2 "/usr/include/mips/int_types.h"
	.file 3 "/usr/include/sys/ansi.h"
	.file 4 "/usr/include/mips/ansi.h"
	.file 5 "/usr/include/stdio.h"
	.file 6 "/usr/include/mips/types.h"
	.file 7 "/usr/include/sys/types.h"
	.file 8 "/usr/include/sys/endian.h"
	.file 9 "/usr/include/pthread_types.h"
	.file 10 "/usr/include/stdlib.h"
	.file 11 "matrix.h"
	.rdata
	.align	2
$LC0:
	.ascii	"%s\000"
	.align	2
$LC1:
	.ascii	"\tUsage: \n"
	.ascii	"\t\t./tp1 -h \n"
	.ascii	"\t\t./tp1 -V \n"
	.ascii	"\t\t./tp1 < in_file > out_file\n"
	.ascii	"\ttp1 [options] \n"
	.ascii	"\tOptions: \n"
	.ascii	"\t\t-V, --version \tPrint version and quit.\n"
	.ascii	"\t\t-h, --help \tPrint this information.\n"
	.ascii	"\tExamples:\n"
	.ascii	"\t\t./tp1 < in.txt > out.txt\n"
	.ascii	"\t\tcat in.txt | ./tp1 > out.txt\n\000"
	.align	2
$LC2:
	.ascii	"%s\r\n\000"
	.text
	.align	2
	.globl	show_help
$LFB29:
	.loc 1 83 0
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
$LCFI0:
	sw	$ra,544($sp)
$LCFI1:
	sw	$fp,540($sp)
$LCFI2:
	sw	$gp,536($sp)
$LCFI3:
	move	$fp,$sp
$LCFI4:
	.loc 1 86 0
$LBB2:
	addu	$a0,$fp,24
	li	$a1,512			# 0x200
	la	$a2,$LC0
	la	$a3,$LC1
	la	$t9,snprintf
	jal	$ra,$t9
	.loc 1 100 0
	la	$a0,$LC2
	addu	$a1,$fp,24
	la	$t9,printf
	jal	$ra,$t9
	.loc 1 102 0
	move	$sp,$fp
	lw	$ra,544($sp)
	lw	$fp,540($sp)
	addu	$sp,$sp,552
	j	$ra
$LBE2:
	.end	show_help
$LFE29:
	.size	show_help, .-show_help
	.rdata
	.align	2
$LC3:
	.ascii	"tp1 version 1.0\n\000"
	.text
	.align	2
	.globl	version
$LFB31:
	.loc 1 105 0
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
$LCFI5:
	sw	$ra,32($sp)
$LCFI6:
	sw	$fp,28($sp)
$LCFI7:
	sw	$gp,24($sp)
$LCFI8:
	move	$fp,$sp
$LCFI9:
	.loc 1 106 0
	la	$a0,$LC0
	la	$a1,$LC3
	la	$t9,printf
	jal	$ra,$t9
	.loc 1 107 0
	move	$sp,$fp
	lw	$ra,32($sp)
	lw	$fp,28($sp)
	addu	$sp,$sp,40
	j	$ra
	.end	version
$LFE31:
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
$LFB33:
	.loc 1 112 0
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
$LCFI10:
	sw	$ra,40($sp)
$LCFI11:
	sw	$fp,36($sp)
$LCFI12:
	sw	$gp,32($sp)
$LCFI13:
	move	$fp,$sp
$LCFI14:
	sw	$a0,48($fp)
	sw	$a1,52($fp)
	.loc 1 113 0
$LBB3:
	lw	$v0,48($fp)
	slt	$v0,$v0,2
	bne	$v0,$zero,$L20
	.loc 1 115 0
$LBB4:
	li	$v0,1			# 0x1
	sw	$v0,24($fp)
$L21:
	lw	$v0,24($fp)
	lw	$v1,48($fp)
	slt	$v0,$v0,$v1
	bne	$v0,$zero,$L24
	b	$L31
$L24:
	.loc 1 116 0
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
	.loc 1 117 0
	la	$t9,show_help
	jal	$ra,$t9
	b	$L23
$L25:
	.loc 1 118 0
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
	.loc 1 119 0
	la	$t9,version
	jal	$ra,$t9
	b	$L23
$L28:
	.loc 1 121 0
	la	$a0,$LC6
	la	$t9,printf
	jal	$ra,$t9
	.loc 1 115 0
$L23:
	lw	$v0,24($fp)
	addu	$v0,$v0,1
	sw	$v0,24($fp)
	b	$L21
$L20:
	.loc 1 126 0
$LBE4:
	la	$t9,exec_program
	jal	$ra,$t9
$L31:
	.loc 1 130 0
	move	$v0,$zero
	.loc 1 131 0
	move	$sp,$fp
	lw	$ra,40($sp)
	lw	$fp,36($sp)
	addu	$sp,$sp,48
	j	$ra
$LBE3:
	.end	main
$LFE33:
	.size	main, .-main
	.align	2
	.globl	exec_program
$LFB35:
	.loc 1 138 0
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
$LCFI15:
	sw	$ra,56($sp)
$LCFI16:
	sw	$fp,52($sp)
$LCFI17:
	sw	$gp,48($sp)
$LCFI18:
	move	$fp,$sp
$LCFI19:
	.loc 1 142 0
$LBB5:
	addu	$a0,$fp,24
	la	$t9,read_from_stdin
	jal	$ra,$t9
	sw	$v0,28($fp)
	.loc 1 146 0
	lw	$v0,28($fp)
	sw	$v0,32($fp)
	.loc 1 147 0
$L33:
	lw	$v0,32($fp)
	bne	$v0,$zero,$L35
	b	$L34
$L35:
	.loc 1 149 0
$LBB6:
	lw	$a0,32($fp)
	li	$a1,10			# 0xa
	la	$t9,strchr
	jal	$ra,$t9
	sw	$v0,36($fp)
	.loc 1 150 0
	lw	$v0,36($fp)
	beq	$v0,$zero,$L36
	lw	$v0,36($fp)
	sb	$zero,0($v0)
$L36:
	.loc 1 153 0
	lw	$v0,32($fp)
	lb	$v0,0($v0)
	beq	$v0,$zero,$L37
	.loc 1 154 0
	lw	$a0,32($fp)
	la	$t9,process_line
	jal	$ra,$t9
$L37:
	.loc 1 157 0
	lw	$v0,36($fp)
	beq	$v0,$zero,$L38
	lw	$v1,36($fp)
	li	$v0,10			# 0xa
	sb	$v0,0($v1)
$L38:
	.loc 1 161 0
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
$LBE6:
	b	$L33
$L34:
	.loc 1 165 0
	lw	$a0,28($fp)
	la	$t9,free
	jal	$ra,$t9
	.loc 1 167 0
	move	$sp,$fp
	lw	$ra,56($sp)
	lw	$fp,52($sp)
	addu	$sp,$sp,64
	j	$ra
$LBE5:
	.end	exec_program
$LFE35:
	.size	exec_program, .-exec_program
	.align	2
	.globl	process_line
$LFB37:
	.loc 1 169 0
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
$LCFI20:
	sw	$ra,64($sp)
$LCFI21:
	sw	$fp,60($sp)
$LCFI22:
	sw	$gp,56($sp)
$LCFI23:
	move	$fp,$sp
$LCFI24:
	sw	$a0,72($fp)
	.loc 1 175 0
$LBB7:
	lw	$a0,72($fp)
	addu	$a1,$fp,24
	la	$t9,parse
	jal	$ra,$t9
	sw	$v0,28($fp)
	.loc 1 179 0
	lw	$a0,28($fp)
	lw	$a1,24($fp)
	move	$a2,$zero
	la	$t9,extract_matrix
	jal	$ra,$t9
	sw	$v0,32($fp)
	.loc 1 180 0
	lw	$a0,28($fp)
	lw	$a1,24($fp)
	li	$a2,1			# 0x1
	la	$t9,extract_matrix
	jal	$ra,$t9
	sw	$v0,36($fp)
	.loc 1 183 0
	lw	$a0,24($fp)
	lw	$a1,24($fp)
	la	$t9,create_matrix
	jal	$ra,$t9
	sw	$v0,40($fp)
	.loc 1 184 0
	lw	$v1,40($fp)
	lw	$v0,32($fp)
	sw	$v0,8($v1)
	.loc 1 187 0
	lw	$a0,24($fp)
	lw	$a1,24($fp)
	la	$t9,create_matrix
	jal	$ra,$t9
	sw	$v0,44($fp)
	.loc 1 188 0
	lw	$v1,44($fp)
	lw	$v0,36($fp)
	sw	$v0,8($v1)
	.loc 1 190 0
	lw	$a0,40($fp)
	lw	$a1,44($fp)
	la	$t9,matrix_multiply
	jal	$ra,$t9
	sw	$v0,48($fp)
	.loc 1 192 0
	la	$a0,__sF+88
	lw	$a1,48($fp)
	la	$t9,print_matrix
	jal	$ra,$t9
	.loc 1 194 0
	lw	$a0,40($fp)
	la	$t9,destroy_matrix
	jal	$ra,$t9
	.loc 1 195 0
	lw	$a0,44($fp)
	la	$t9,destroy_matrix
	jal	$ra,$t9
	.loc 1 196 0
	lw	$a0,48($fp)
	la	$t9,destroy_matrix
	jal	$ra,$t9
	.loc 1 197 0
	lw	$a0,28($fp)
	la	$t9,myfree
	jal	$ra,$t9
	.loc 1 198 0
	move	$sp,$fp
	lw	$ra,64($sp)
	lw	$fp,60($sp)
	addu	$sp,$sp,72
	j	$ra
$LBE7:
	.end	process_line
$LFE37:
	.size	process_line, .-process_line
	.align	2
	.globl	read_from_stdin
$LFB39:
	.loc 1 201 0
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
$LCFI25:
	sw	$ra,56($sp)
$LCFI26:
	sw	$fp,52($sp)
$LCFI27:
	sw	$gp,48($sp)
$LCFI28:
	move	$fp,$sp
$LCFI29:
	sw	$a0,64($fp)
	.loc 1 202 0
$LBB8:
	li	$v0,128			# 0x80
	sw	$v0,24($fp)
	.loc 1 203 0
	sw	$zero,28($fp)
	.loc 1 205 0
	lw	$a0,24($fp)
	la	$t9,malloc
	jal	$ra,$t9
	sw	$v0,32($fp)
	.loc 1 206 0
	lw	$v0,24($fp)
	sw	$v0,28($fp)
	.loc 1 208 0
	lw	$v0,32($fp)
	beq	$v0,$zero,$L43
	.loc 1 210 0
$LBB9:
	li	$v0,-1			# 0xffffffffffffffff
	sw	$v0,36($fp)
	.loc 1 211 0
	sw	$zero,40($fp)
	.loc 1 212 0
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
	.loc 1 214 0
	addu	$a1,$fp,40
	lw	$v1,0($a1)
	move	$a0,$v1
	lw	$v0,32($fp)
	addu	$a0,$a0,$v0
	lbu	$v0,36($fp)
	sb	$v0,0($a0)
	addu	$v1,$v1,1
	sw	$v1,0($a1)
	.loc 1 217 0
	lw	$v1,40($fp)
	lw	$v0,28($fp)
	bne	$v1,$v0,$L44
	.loc 1 219 0
	lw	$v1,40($fp)
	lw	$v0,24($fp)
	addu	$v0,$v1,$v0
	sw	$v0,28($fp)
	.loc 1 220 0
	lw	$a0,32($fp)
	lw	$a1,28($fp)
	la	$t9,realloc
	jal	$ra,$t9
	sw	$v0,32($fp)
	lw	$v0,32($fp)
	bne	$v0,$zero,$L44
	.loc 1 221 0
	li	$a0,6			# 0x6
	la	$t9,logAndExit
	jal	$ra,$t9
	b	$L44
$L45:
	.loc 1 226 0
	lw	$v1,32($fp)
	lw	$v0,40($fp)
	addu	$v0,$v1,$v0
	sb	$zero,0($v0)
	.loc 1 227 0
	lw	$v1,64($fp)
	lw	$v0,28($fp)
	sw	$v0,0($v1)
$LBE9:
	b	$L52
$L43:
	.loc 1 230 0
	li	$a0,5			# 0x5
	la	$t9,logAndExit
	jal	$ra,$t9
$L52:
	.loc 1 233 0
	lw	$v0,32($fp)
	.loc 1 235 0
	move	$sp,$fp
	lw	$ra,56($sp)
	lw	$fp,52($sp)
	addu	$sp,$sp,64
	j	$ra
$LBE8:
	.end	read_from_stdin
$LFE39:
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
$LFB41:
	.loc 1 237 0
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
$LCFI30:
	sw	$ra,68($sp)
$LCFI31:
	sw	$fp,64($sp)
$LCFI32:
	sw	$gp,60($sp)
$LCFI33:
	sw	$s0,56($sp)
$LCFI34:
	move	$fp,$sp
$LCFI35:
	sw	$a0,72($fp)
	sw	$a1,76($fp)
	.loc 1 240 0
$LBB10:
	li	$v0,2			# 0x2
	sw	$v0,24($fp)
	.loc 1 244 0
	lw	$a0,72($fp)
	la	$a1,$LC7
	la	$t9,strtok
	jal	$ra,$t9
	sw	$v0,28($fp)
	.loc 1 246 0
	sw	$zero,32($fp)
	.loc 1 249 0
	lw	$s0,76($fp)
	lw	$a0,28($fp)
	la	$t9,atoi
	jal	$ra,$t9
	sw	$v0,0($s0)
	lw	$v0,0($s0)
	beq	$v0,$zero,$L54
	.loc 1 252 0
$LBB11:
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
	.loc 1 253 0
	lw	$v0,36($fp)
	sll	$v0,$v0,3
	move	$a0,$v0
	la	$t9,mymalloc
	jal	$ra,$t9
	sw	$v0,32($fp)
	.loc 1 257 0
	sw	$zero,40($fp)
	.loc 1 259 0
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
	.loc 1 265 0
$LBB12:
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
	.loc 1 266 0
	lw	$v0,40($fp)
	sll	$v1,$v0,3
	lw	$v0,32($fp)
	addu	$v0,$v1,$v0
	l.d	$f0,48($fp)
	s.d	$f0,0($v0)
	.loc 1 267 0
	lw	$v0,40($fp)
	addu	$v0,$v0,1
	sw	$v0,40($fp)
	b	$L55
$L58:
	.loc 1 269 0
	lw	$a0,28($fp)
	la	$a1,$LC8
	la	$t9,strcmp
	jal	$ra,$t9
	bne	$v0,$zero,$L61
	.loc 1 270 0
	lw	$v0,40($fp)
	sll	$v1,$v0,3
	lw	$v0,32($fp)
	addu	$v0,$v1,$v0
	l.d	$f0,48($fp)
	s.d	$f0,0($v0)
	.loc 1 271 0
	lw	$v0,40($fp)
	addu	$v0,$v0,1
	sw	$v0,40($fp)
	b	$L55
$L61:
	.loc 1 273 0
	li	$a0,4			# 0x4
	la	$t9,logAndExit
	jal	$ra,$t9
$LBE12:
	b	$L55
$L56:
	.loc 1 279 0
	lw	$v1,40($fp)
	lw	$v0,36($fp)
	beq	$v1,$v0,$L64
	.loc 1 280 0
	li	$a0,3			# 0x3
	la	$t9,logAndExit
	jal	$ra,$t9
$LBE11:
	b	$L64
$L54:
	.loc 1 284 0
	li	$a0,2			# 0x2
	la	$t9,logAndExit
	jal	$ra,$t9
$L64:
	.loc 1 287 0
	lw	$v0,32($fp)
	.loc 1 289 0
	move	$sp,$fp
	lw	$ra,68($sp)
	lw	$fp,64($sp)
	lw	$s0,56($sp)
	addu	$sp,$sp,72
	j	$ra
$LBE10:
	.end	parse
$LFE41:
	.size	parse, .-parse
	.align	2
	.globl	extract_matrix
$LFB43:
	.loc 1 295 0
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
$LCFI36:
	sw	$ra,48($sp)
$LCFI37:
	sw	$fp,44($sp)
$LCFI38:
	sw	$gp,40($sp)
$LCFI39:
	move	$fp,$sp
$LCFI40:
	sw	$a0,56($fp)
	sw	$a1,60($fp)
	sw	$a2,64($fp)
	.loc 1 299 0
$LBB13:
	lw	$v0,64($fp)
	sltu	$v0,$v0,2
	bne	$v0,$zero,$L66
	.loc 1 300 0
	li	$a0,1			# 0x1
	la	$t9,logAndExit
	jal	$ra,$t9
$L66:
	.loc 1 303 0
	lw	$v1,60($fp)
	lw	$v0,60($fp)
	mult	$v1,$v0
	mflo	$v0
	sll	$v0,$v0,3
	move	$a0,$v0
	la	$t9,mymalloc
	jal	$ra,$t9
	sw	$v0,28($fp)
	.loc 1 304 0
	sw	$zero,32($fp)
	.loc 1 306 0
	sw	$zero,24($fp)
$L67:
	lw	$v0,24($fp)
	lw	$v1,64($fp)
	sltu	$v0,$v0,$v1
	bne	$v0,$zero,$L70
	b	$L68
$L70:
	.loc 1 308 0
	lw	$v1,60($fp)
	lw	$v0,60($fp)
	mult	$v1,$v0
	mflo	$v1
	lw	$v0,32($fp)
	addu	$v0,$v0,$v1
	sw	$v0,32($fp)
	.loc 1 306 0
	lw	$v0,24($fp)
	addu	$v0,$v0,1
	sw	$v0,24($fp)
	b	$L67
$L68:
	.loc 1 311 0
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
	.loc 1 312 0
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
	.loc 1 311 0
	lw	$v0,24($fp)
	addu	$v0,$v0,1
	sw	$v0,24($fp)
	lw	$v0,32($fp)
	addu	$v0,$v0,1
	sw	$v0,32($fp)
	b	$L71
$L72:
	.loc 1 315 0
	lw	$v0,28($fp)
	.loc 1 316 0
	move	$sp,$fp
	lw	$ra,48($sp)
	lw	$fp,44($sp)
	addu	$sp,$sp,56
	j	$ra
$LBE13:
	.end	extract_matrix
$LFE43:
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
$LFB45:
	.loc 1 318 0
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
$LCFI41:
	sw	$ra,32($sp)
$LCFI42:
	sw	$fp,28($sp)
$LCFI43:
	sw	$gp,24($sp)
$LCFI44:
	move	$fp,$sp
$LCFI45:
	sw	$a0,40($fp)
	.loc 1 319 0
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
	.loc 1 321 0
	la	$a0,__sF+176
	la	$a1,$LC9
	la	$t9,fprintf
	jal	$ra,$t9
	.loc 1 322 0
	b	$L76
$L78:
	.loc 1 324 0
	la	$a0,__sF+176
	la	$a1,$LC10
	la	$t9,fprintf
	jal	$ra,$t9
	.loc 1 325 0
	b	$L76
$L79:
	.loc 1 327 0
	la	$a0,__sF+176
	la	$a1,$LC11
	la	$t9,fprintf
	jal	$ra,$t9
	.loc 1 328 0
	b	$L76
$L80:
	.loc 1 330 0
	la	$a0,__sF+176
	la	$a1,$LC12
	la	$t9,fprintf
	jal	$ra,$t9
	.loc 1 331 0
	b	$L76
$L81:
	.loc 1 333 0
	la	$a0,__sF+176
	la	$a1,$LC13
	la	$t9,fprintf
	jal	$ra,$t9
$L82:
	.loc 1 335 0
	la	$a0,__sF+176
	la	$a1,$LC14
	la	$t9,fprintf
	jal	$ra,$t9
$L76:
	.loc 1 339 0
	li	$a0,1			# 0x1
	la	$t9,exit
	jal	$ra,$t9
	.loc 1 340 0
	.end	logAndExit
$LFE45:
	.size	logAndExit, .-logAndExit
	.section	.debug_frame,"",@progbits
$Lframe0:
	.4byte	$LECIE0-$LSCIE0
$LSCIE0:
	.4byte	0xffffffff
	.byte	0x1
	.ascii	"\000"
	.uleb128 0x1
	.sleb128 4
	.byte	0x40
	.byte	0xc
	.uleb128 0x1d
	.uleb128 0x0
	.align	2
$LECIE0:
$LSFDE0:
	.4byte	$LEFDE0-$LASFDE0
$LASFDE0:
	.4byte	$Lframe0
	.4byte	$LFB29
	.4byte	$LFE29-$LFB29
	.byte	0x4
	.4byte	$LCFI0-$LFB29
	.byte	0xe
	.uleb128 0x228
	.byte	0x4
	.4byte	$LCFI3-$LCFI0
	.byte	0x11
	.uleb128 0x1c
	.sleb128 -4
	.byte	0x11
	.uleb128 0x1e
	.sleb128 -3
	.byte	0x11
	.uleb128 0x40
	.sleb128 -2
	.byte	0x4
	.4byte	$LCFI4-$LCFI3
	.byte	0xc
	.uleb128 0x1e
	.uleb128 0x228
	.align	2
$LEFDE0:
$LSFDE2:
	.4byte	$LEFDE2-$LASFDE2
$LASFDE2:
	.4byte	$Lframe0
	.4byte	$LFB31
	.4byte	$LFE31-$LFB31
	.byte	0x4
	.4byte	$LCFI5-$LFB31
	.byte	0xe
	.uleb128 0x28
	.byte	0x4
	.4byte	$LCFI8-$LCFI5
	.byte	0x11
	.uleb128 0x1c
	.sleb128 -4
	.byte	0x11
	.uleb128 0x1e
	.sleb128 -3
	.byte	0x11
	.uleb128 0x40
	.sleb128 -2
	.byte	0x4
	.4byte	$LCFI9-$LCFI8
	.byte	0xc
	.uleb128 0x1e
	.uleb128 0x28
	.align	2
$LEFDE2:
$LSFDE4:
	.4byte	$LEFDE4-$LASFDE4
$LASFDE4:
	.4byte	$Lframe0
	.4byte	$LFB33
	.4byte	$LFE33-$LFB33
	.byte	0x4
	.4byte	$LCFI10-$LFB33
	.byte	0xe
	.uleb128 0x30
	.byte	0x4
	.4byte	$LCFI13-$LCFI10
	.byte	0x11
	.uleb128 0x1c
	.sleb128 -4
	.byte	0x11
	.uleb128 0x1e
	.sleb128 -3
	.byte	0x11
	.uleb128 0x40
	.sleb128 -2
	.byte	0x4
	.4byte	$LCFI14-$LCFI13
	.byte	0xc
	.uleb128 0x1e
	.uleb128 0x30
	.align	2
$LEFDE4:
$LSFDE6:
	.4byte	$LEFDE6-$LASFDE6
$LASFDE6:
	.4byte	$Lframe0
	.4byte	$LFB35
	.4byte	$LFE35-$LFB35
	.byte	0x4
	.4byte	$LCFI15-$LFB35
	.byte	0xe
	.uleb128 0x40
	.byte	0x4
	.4byte	$LCFI18-$LCFI15
	.byte	0x11
	.uleb128 0x1c
	.sleb128 -4
	.byte	0x11
	.uleb128 0x1e
	.sleb128 -3
	.byte	0x11
	.uleb128 0x40
	.sleb128 -2
	.byte	0x4
	.4byte	$LCFI19-$LCFI18
	.byte	0xc
	.uleb128 0x1e
	.uleb128 0x40
	.align	2
$LEFDE6:
$LSFDE8:
	.4byte	$LEFDE8-$LASFDE8
$LASFDE8:
	.4byte	$Lframe0
	.4byte	$LFB37
	.4byte	$LFE37-$LFB37
	.byte	0x4
	.4byte	$LCFI20-$LFB37
	.byte	0xe
	.uleb128 0x48
	.byte	0x4
	.4byte	$LCFI23-$LCFI20
	.byte	0x11
	.uleb128 0x1c
	.sleb128 -4
	.byte	0x11
	.uleb128 0x1e
	.sleb128 -3
	.byte	0x11
	.uleb128 0x40
	.sleb128 -2
	.byte	0x4
	.4byte	$LCFI24-$LCFI23
	.byte	0xc
	.uleb128 0x1e
	.uleb128 0x48
	.align	2
$LEFDE8:
$LSFDE10:
	.4byte	$LEFDE10-$LASFDE10
$LASFDE10:
	.4byte	$Lframe0
	.4byte	$LFB39
	.4byte	$LFE39-$LFB39
	.byte	0x4
	.4byte	$LCFI25-$LFB39
	.byte	0xe
	.uleb128 0x40
	.byte	0x4
	.4byte	$LCFI28-$LCFI25
	.byte	0x11
	.uleb128 0x1c
	.sleb128 -4
	.byte	0x11
	.uleb128 0x1e
	.sleb128 -3
	.byte	0x11
	.uleb128 0x40
	.sleb128 -2
	.byte	0x4
	.4byte	$LCFI29-$LCFI28
	.byte	0xc
	.uleb128 0x1e
	.uleb128 0x40
	.align	2
$LEFDE10:
$LSFDE12:
	.4byte	$LEFDE12-$LASFDE12
$LASFDE12:
	.4byte	$Lframe0
	.4byte	$LFB41
	.4byte	$LFE41-$LFB41
	.byte	0x4
	.4byte	$LCFI30-$LFB41
	.byte	0xe
	.uleb128 0x48
	.byte	0x4
	.4byte	$LCFI34-$LCFI30
	.byte	0x11
	.uleb128 0x10
	.sleb128 -4
	.byte	0x11
	.uleb128 0x1c
	.sleb128 -3
	.byte	0x11
	.uleb128 0x1e
	.sleb128 -2
	.byte	0x11
	.uleb128 0x40
	.sleb128 -1
	.byte	0x4
	.4byte	$LCFI35-$LCFI34
	.byte	0xc
	.uleb128 0x1e
	.uleb128 0x48
	.align	2
$LEFDE12:
$LSFDE14:
	.4byte	$LEFDE14-$LASFDE14
$LASFDE14:
	.4byte	$Lframe0
	.4byte	$LFB43
	.4byte	$LFE43-$LFB43
	.byte	0x4
	.4byte	$LCFI36-$LFB43
	.byte	0xe
	.uleb128 0x38
	.byte	0x4
	.4byte	$LCFI39-$LCFI36
	.byte	0x11
	.uleb128 0x1c
	.sleb128 -4
	.byte	0x11
	.uleb128 0x1e
	.sleb128 -3
	.byte	0x11
	.uleb128 0x40
	.sleb128 -2
	.byte	0x4
	.4byte	$LCFI40-$LCFI39
	.byte	0xc
	.uleb128 0x1e
	.uleb128 0x38
	.align	2
$LEFDE14:
$LSFDE16:
	.4byte	$LEFDE16-$LASFDE16
$LASFDE16:
	.4byte	$Lframe0
	.4byte	$LFB45
	.4byte	$LFE45-$LFB45
	.byte	0x4
	.4byte	$LCFI41-$LFB45
	.byte	0xe
	.uleb128 0x28
	.byte	0x4
	.4byte	$LCFI44-$LCFI41
	.byte	0x11
	.uleb128 0x1c
	.sleb128 -4
	.byte	0x11
	.uleb128 0x1e
	.sleb128 -3
	.byte	0x11
	.uleb128 0x40
	.sleb128 -2
	.byte	0x4
	.4byte	$LCFI45-$LCFI44
	.byte	0xc
	.uleb128 0x1e
	.uleb128 0x28
	.align	2
$LEFDE16:
	.align	0
	.text
$Letext0:
	.section	.debug_info
	.4byte	0xf28
	.2byte	0x2
	.4byte	$Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	$Ldebug_line0
	.4byte	$Letext0
	.4byte	$Ltext0
	.4byte	$LC257
	.4byte	$LC258
	.4byte	$LC259
	.byte	0x1
	.uleb128 0x2
	.4byte	$LC15
	.byte	0x2
	.byte	0x30
	.4byte	0x30
	.uleb128 0x3
	.4byte	$LC17
	.byte	0x1
	.byte	0x6
	.uleb128 0x2
	.4byte	$LC16
	.byte	0x2
	.byte	0x31
	.4byte	0x42
	.uleb128 0x3
	.4byte	$LC18
	.byte	0x1
	.byte	0x8
	.uleb128 0x2
	.4byte	$LC19
	.byte	0x2
	.byte	0x32
	.4byte	0x54
	.uleb128 0x3
	.4byte	$LC20
	.byte	0x2
	.byte	0x5
	.uleb128 0x2
	.4byte	$LC21
	.byte	0x2
	.byte	0x33
	.4byte	0x66
	.uleb128 0x3
	.4byte	$LC22
	.byte	0x2
	.byte	0x7
	.uleb128 0x2
	.4byte	$LC23
	.byte	0x2
	.byte	0x34
	.4byte	0x78
	.uleb128 0x4
	.ascii	"int\000"
	.byte	0x4
	.byte	0x5
	.uleb128 0x2
	.4byte	$LC24
	.byte	0x2
	.byte	0x35
	.4byte	0x8a
	.uleb128 0x3
	.4byte	$LC25
	.byte	0x4
	.byte	0x7
	.uleb128 0x2
	.4byte	$LC26
	.byte	0x2
	.byte	0x3e
	.4byte	0x9c
	.uleb128 0x3
	.4byte	$LC27
	.byte	0x8
	.byte	0x5
	.uleb128 0x2
	.4byte	$LC28
	.byte	0x2
	.byte	0x40
	.4byte	0xae
	.uleb128 0x3
	.4byte	$LC29
	.byte	0x8
	.byte	0x7
	.uleb128 0x2
	.4byte	$LC30
	.byte	0x2
	.byte	0x4b
	.4byte	0x78
	.uleb128 0x2
	.4byte	$LC31
	.byte	0x2
	.byte	0x4c
	.4byte	0x8a
	.uleb128 0x2
	.4byte	$LC32
	.byte	0x3
	.byte	0x2c
	.4byte	0xd6
	.uleb128 0x5
	.byte	0x4
	.4byte	0xdc
	.uleb128 0x3
	.4byte	$LC33
	.byte	0x1
	.byte	0x6
	.uleb128 0x2
	.4byte	$LC34
	.byte	0x3
	.byte	0x2d
	.4byte	0x7f
	.uleb128 0x2
	.4byte	$LC35
	.byte	0x3
	.byte	0x2e
	.4byte	0x7f
	.uleb128 0x2
	.4byte	$LC36
	.byte	0x3
	.byte	0x2f
	.4byte	0x5b
	.uleb128 0x2
	.4byte	$LC37
	.byte	0x3
	.byte	0x30
	.4byte	0x7f
	.uleb128 0x2
	.4byte	$LC38
	.byte	0x3
	.byte	0x31
	.4byte	0x91
	.uleb128 0x2
	.4byte	$LC39
	.byte	0x3
	.byte	0x32
	.4byte	0x6d
	.uleb128 0x2
	.4byte	$LC40
	.byte	0x3
	.byte	0x33
	.4byte	0x37
	.uleb128 0x2
	.4byte	$LC41
	.byte	0x3
	.byte	0x34
	.4byte	0x8a
	.uleb128 0x2
	.4byte	$LC42
	.byte	0x3
	.byte	0x35
	.4byte	0x7f
	.uleb128 0x2
	.4byte	$LC43
	.byte	0x3
	.byte	0x36
	.4byte	0xa3
	.uleb128 0x2
	.4byte	$LC44
	.byte	0x3
	.byte	0x37
	.4byte	0xa3
	.uleb128 0x6
	.4byte	0x17b
	.byte	0x80
	.byte	0x4
	.byte	0x65
	.uleb128 0x7
	.4byte	$LC45
	.byte	0x4
	.byte	0x63
	.4byte	0x17b
	.uleb128 0x7
	.4byte	$LC46
	.byte	0x4
	.byte	0x64
	.4byte	0x91
	.byte	0x0
	.uleb128 0x8
	.4byte	0x18b
	.4byte	0xdc
	.uleb128 0x9
	.4byte	0x18b
	.byte	0x7f
	.byte	0x0
	.uleb128 0x3
	.4byte	$LC25
	.byte	0x4
	.byte	0x7
	.uleb128 0x2
	.4byte	$LC47
	.byte	0x4
	.byte	0x65
	.4byte	0x15c
	.uleb128 0x2
	.4byte	$LC48
	.byte	0x5
	.byte	0x2e
	.4byte	0x8a
	.uleb128 0x2
	.4byte	$LC49
	.byte	0x5
	.byte	0x3a
	.4byte	0x10f
	.uleb128 0xa
	.4byte	0x1dc
	.4byte	$LC52
	.byte	0x8
	.byte	0x5
	.byte	0x4a
	.uleb128 0xb
	.4byte	$LC50
	.byte	0x5
	.byte	0x4b
	.4byte	0x1dc
	.byte	0x2
	.byte	0x10
	.uleb128 0x0
	.uleb128 0xb
	.4byte	$LC51
	.byte	0x5
	.byte	0x4c
	.4byte	0x78
	.byte	0x2
	.byte	0x10
	.uleb128 0x4
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.4byte	0x42
	.uleb128 0xa
	.4byte	0x304
	.4byte	$LC53
	.byte	0x58
	.byte	0x5
	.byte	0x69
	.uleb128 0xc
	.ascii	"_p\000"
	.byte	0x5
	.byte	0x6a
	.4byte	0x1dc
	.byte	0x2
	.byte	0x10
	.uleb128 0x0
	.uleb128 0xc
	.ascii	"_r\000"
	.byte	0x5
	.byte	0x6b
	.4byte	0x78
	.byte	0x2
	.byte	0x10
	.uleb128 0x4
	.uleb128 0xc
	.ascii	"_w\000"
	.byte	0x5
	.byte	0x6c
	.4byte	0x78
	.byte	0x2
	.byte	0x10
	.uleb128 0x8
	.uleb128 0xb
	.4byte	$LC54
	.byte	0x5
	.byte	0x6d
	.4byte	0x54
	.byte	0x2
	.byte	0x10
	.uleb128 0xc
	.uleb128 0xb
	.4byte	$LC55
	.byte	0x5
	.byte	0x6e
	.4byte	0x54
	.byte	0x2
	.byte	0x10
	.uleb128 0xe
	.uleb128 0xc
	.ascii	"_bf\000"
	.byte	0x5
	.byte	0x6f
	.4byte	0x1b3
	.byte	0x2
	.byte	0x10
	.uleb128 0x10
	.uleb128 0xb
	.4byte	$LC56
	.byte	0x5
	.byte	0x70
	.4byte	0x78
	.byte	0x2
	.byte	0x10
	.uleb128 0x18
	.uleb128 0xb
	.4byte	$LC57
	.byte	0x5
	.byte	0x73
	.4byte	0x304
	.byte	0x2
	.byte	0x10
	.uleb128 0x1c
	.uleb128 0xb
	.4byte	$LC58
	.byte	0x5
	.byte	0x74
	.4byte	0x316
	.byte	0x2
	.byte	0x10
	.uleb128 0x20
	.uleb128 0xb
	.4byte	$LC59
	.byte	0x5
	.byte	0x75
	.4byte	0x336
	.byte	0x2
	.byte	0x10
	.uleb128 0x24
	.uleb128 0xb
	.4byte	$LC60
	.byte	0x5
	.byte	0x76
	.4byte	0x356
	.byte	0x2
	.byte	0x10
	.uleb128 0x28
	.uleb128 0xb
	.4byte	$LC61
	.byte	0x5
	.byte	0x77
	.4byte	0x381
	.byte	0x2
	.byte	0x10
	.uleb128 0x2c
	.uleb128 0xb
	.4byte	$LC62
	.byte	0x5
	.byte	0x7a
	.4byte	0x1b3
	.byte	0x2
	.byte	0x10
	.uleb128 0x30
	.uleb128 0xc
	.ascii	"_up\000"
	.byte	0x5
	.byte	0x7d
	.4byte	0x1dc
	.byte	0x2
	.byte	0x10
	.uleb128 0x38
	.uleb128 0xc
	.ascii	"_ur\000"
	.byte	0x5
	.byte	0x7e
	.4byte	0x78
	.byte	0x2
	.byte	0x10
	.uleb128 0x3c
	.uleb128 0xb
	.4byte	$LC63
	.byte	0x5
	.byte	0x81
	.4byte	0x387
	.byte	0x2
	.byte	0x10
	.uleb128 0x40
	.uleb128 0xb
	.4byte	$LC64
	.byte	0x5
	.byte	0x82
	.4byte	0x397
	.byte	0x2
	.byte	0x10
	.uleb128 0x43
	.uleb128 0xc
	.ascii	"_lb\000"
	.byte	0x5
	.byte	0x85
	.4byte	0x1b3
	.byte	0x2
	.byte	0x10
	.uleb128 0x44
	.uleb128 0xb
	.4byte	$LC65
	.byte	0x5
	.byte	0x88
	.4byte	0x78
	.byte	0x2
	.byte	0x10
	.uleb128 0x4c
	.uleb128 0xb
	.4byte	$LC66
	.byte	0x5
	.byte	0x89
	.4byte	0x1a8
	.byte	0x2
	.byte	0x10
	.uleb128 0x50
	.byte	0x0
	.uleb128 0xd
	.byte	0x4
	.uleb128 0xe
	.4byte	0x316
	.byte	0x1
	.4byte	0x78
	.uleb128 0xf
	.4byte	0x304
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.4byte	0x306
	.uleb128 0xe
	.4byte	0x336
	.byte	0x1
	.4byte	0x78
	.uleb128 0xf
	.4byte	0x304
	.uleb128 0xf
	.4byte	0xd6
	.uleb128 0xf
	.4byte	0x78
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.4byte	0x31c
	.uleb128 0xe
	.4byte	0x356
	.byte	0x1
	.4byte	0x1a8
	.uleb128 0xf
	.4byte	0x304
	.uleb128 0xf
	.4byte	0x1a8
	.uleb128 0xf
	.4byte	0x78
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.4byte	0x33c
	.uleb128 0xe
	.4byte	0x376
	.byte	0x1
	.4byte	0x78
	.uleb128 0xf
	.4byte	0x304
	.uleb128 0xf
	.4byte	0x376
	.uleb128 0xf
	.4byte	0x78
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.4byte	0x37c
	.uleb128 0x10
	.4byte	0xdc
	.uleb128 0x5
	.byte	0x4
	.4byte	0x35c
	.uleb128 0x8
	.4byte	0x397
	.4byte	0x42
	.uleb128 0x9
	.4byte	0x18b
	.byte	0x2
	.byte	0x0
	.uleb128 0x8
	.4byte	0x3a7
	.4byte	0x42
	.uleb128 0x9
	.4byte	0x18b
	.byte	0x0
	.byte	0x0
	.uleb128 0x2
	.4byte	$LC67
	.byte	0x5
	.byte	0x8a
	.4byte	0x1e2
	.uleb128 0x11
	.4byte	$LC68
	.byte	0x5
	.2byte	0x160
	.4byte	0x10f
	.uleb128 0x2
	.4byte	$LC69
	.byte	0x6
	.byte	0x3b
	.4byte	0x3c9
	.uleb128 0x3
	.4byte	$LC70
	.byte	0x4
	.byte	0x5
	.uleb128 0x2
	.4byte	$LC71
	.byte	0x6
	.byte	0x3c
	.4byte	0x3db
	.uleb128 0x3
	.4byte	$LC72
	.byte	0x4
	.byte	0x7
	.uleb128 0x2
	.4byte	$LC73
	.byte	0x6
	.byte	0x3d
	.4byte	0x3c9
	.uleb128 0x2
	.4byte	$LC74
	.byte	0x6
	.byte	0x46
	.4byte	0x3db
	.uleb128 0x2
	.4byte	$LC75
	.byte	0x6
	.byte	0x47
	.4byte	0x3db
	.uleb128 0x2
	.4byte	$LC76
	.byte	0x6
	.byte	0x49
	.4byte	0x3db
	.uleb128 0x2
	.4byte	$LC77
	.byte	0x6
	.byte	0x4a
	.4byte	0x3db
	.uleb128 0x2
	.4byte	$LC78
	.byte	0x6
	.byte	0x51
	.4byte	0x3c9
	.uleb128 0x2
	.4byte	$LC79
	.byte	0x6
	.byte	0x5a
	.4byte	0x42f
	.uleb128 0x12
	.4byte	0x78
	.uleb128 0x2
	.4byte	$LC80
	.byte	0x7
	.byte	0x36
	.4byte	0x25
	.uleb128 0x2
	.4byte	$LC81
	.byte	0x7
	.byte	0x3b
	.4byte	0x37
	.uleb128 0x2
	.4byte	$LC82
	.byte	0x7
	.byte	0x40
	.4byte	0x49
	.uleb128 0x2
	.4byte	$LC83
	.byte	0x7
	.byte	0x45
	.4byte	0x5b
	.uleb128 0x2
	.4byte	$LC84
	.byte	0x7
	.byte	0x4a
	.4byte	0x6d
	.uleb128 0x2
	.4byte	$LC85
	.byte	0x7
	.byte	0x4f
	.4byte	0x7f
	.uleb128 0x2
	.4byte	$LC86
	.byte	0x7
	.byte	0x54
	.4byte	0x91
	.uleb128 0x2
	.4byte	$LC87
	.byte	0x7
	.byte	0x59
	.4byte	0xa3
	.uleb128 0x2
	.4byte	$LC88
	.byte	0x7
	.byte	0x5d
	.4byte	0x37
	.uleb128 0x2
	.4byte	$LC89
	.byte	0x7
	.byte	0x5e
	.4byte	0x5b
	.uleb128 0x2
	.4byte	$LC90
	.byte	0x7
	.byte	0x5f
	.4byte	0x7f
	.uleb128 0x2
	.4byte	$LC91
	.byte	0x7
	.byte	0x60
	.4byte	0xa3
	.uleb128 0x2
	.4byte	$LC92
	.byte	0x8
	.byte	0x3a
	.4byte	0xee
	.uleb128 0x2
	.4byte	$LC93
	.byte	0x8
	.byte	0x3f
	.4byte	0xf9
	.uleb128 0x2
	.4byte	$LC94
	.byte	0x7
	.byte	0x65
	.4byte	0x42
	.uleb128 0x2
	.4byte	$LC95
	.byte	0x7
	.byte	0x66
	.4byte	0x66
	.uleb128 0x2
	.4byte	$LC96
	.byte	0x7
	.byte	0x67
	.4byte	0x8a
	.uleb128 0x2
	.4byte	$LC97
	.byte	0x7
	.byte	0x68
	.4byte	0x3db
	.uleb128 0x2
	.4byte	$LC98
	.byte	0x7
	.byte	0x6a
	.4byte	0x42
	.uleb128 0x2
	.4byte	$LC99
	.byte	0x7
	.byte	0x6b
	.4byte	0x66
	.uleb128 0x2
	.4byte	$LC100
	.byte	0x7
	.byte	0x6c
	.4byte	0x8a
	.uleb128 0x2
	.4byte	$LC101
	.byte	0x7
	.byte	0x6d
	.4byte	0x3db
	.uleb128 0x2
	.4byte	$LC102
	.byte	0x7
	.byte	0x6f
	.4byte	0x4ef
	.uleb128 0x2
	.4byte	$LC103
	.byte	0x7
	.byte	0x72
	.4byte	0xa3
	.uleb128 0x2
	.4byte	$LC104
	.byte	0x7
	.byte	0x73
	.4byte	0x91
	.uleb128 0x2
	.4byte	$LC105
	.byte	0x7
	.byte	0x74
	.4byte	0x552
	.uleb128 0x5
	.byte	0x4
	.4byte	0x53c
	.uleb128 0x2
	.4byte	$LC106
	.byte	0x7
	.byte	0x80
	.4byte	0x91
	.uleb128 0x2
	.4byte	$LC107
	.byte	0x7
	.byte	0x81
	.4byte	0xa3
	.uleb128 0x2
	.4byte	$LC108
	.byte	0x7
	.byte	0x83
	.4byte	0x91
	.uleb128 0x2
	.4byte	$LC109
	.byte	0x7
	.byte	0x84
	.4byte	0x7f
	.uleb128 0x2
	.4byte	$LC110
	.byte	0x7
	.byte	0x87
	.4byte	0x146
	.uleb128 0x2
	.4byte	$LC111
	.byte	0x7
	.byte	0x8c
	.4byte	0x151
	.uleb128 0x2
	.4byte	$LC112
	.byte	0x7
	.byte	0x91
	.4byte	0xcb
	.uleb128 0x2
	.4byte	$LC113
	.byte	0x7
	.byte	0x99
	.4byte	0x91
	.uleb128 0x2
	.4byte	$LC114
	.byte	0x7
	.byte	0x9c
	.4byte	0x7f
	.uleb128 0x2
	.4byte	$LC115
	.byte	0x7
	.byte	0x9d
	.4byte	0x7f
	.uleb128 0x2
	.4byte	$LC116
	.byte	0x7
	.byte	0xa0
	.4byte	0xe3
	.uleb128 0x2
	.4byte	$LC117
	.byte	0x7
	.byte	0xa4
	.4byte	0x7f
	.uleb128 0x2
	.4byte	$LC118
	.byte	0x7
	.byte	0xa5
	.4byte	0x7f
	.uleb128 0x2
	.4byte	$LC119
	.byte	0x7
	.byte	0xa6
	.4byte	0x3c9
	.uleb128 0x2
	.4byte	$LC120
	.byte	0x7
	.byte	0xa9
	.4byte	0x104
	.uleb128 0x2
	.4byte	$LC121
	.byte	0x7
	.byte	0xad
	.4byte	0x7f
	.uleb128 0x2
	.4byte	$LC122
	.byte	0x7
	.byte	0xb5
	.4byte	0x11a
	.uleb128 0x2
	.4byte	$LC123
	.byte	0x7
	.byte	0xb8
	.4byte	0x6d
	.uleb128 0x2
	.4byte	$LC124
	.byte	0x7
	.byte	0xb9
	.4byte	0x53c
	.uleb128 0x2
	.4byte	$LC125
	.byte	0x7
	.byte	0xba
	.4byte	0x6d
	.uleb128 0x2
	.4byte	$LC126
	.byte	0x7
	.byte	0xbb
	.4byte	0x6d
	.uleb128 0x2
	.4byte	$LC127
	.byte	0x7
	.byte	0xbe
	.4byte	0x13b
	.uleb128 0x2
	.4byte	$LC128
	.byte	0x7
	.byte	0xc2
	.4byte	0x6d
	.uleb128 0x2
	.4byte	$LC129
	.byte	0x7
	.byte	0xfc
	.4byte	0x3db
	.uleb128 0x11
	.4byte	$LC130
	.byte	0x7
	.2byte	0x107
	.4byte	0x78
	.uleb128 0x11
	.4byte	$LC131
	.byte	0x7
	.2byte	0x10c
	.4byte	0x3c9
	.uleb128 0x11
	.4byte	$LC132
	.byte	0x7
	.2byte	0x111
	.4byte	0x78
	.uleb128 0x11
	.4byte	$LC133
	.byte	0x7
	.2byte	0x116
	.4byte	0x78
	.uleb128 0x11
	.4byte	$LC134
	.byte	0x7
	.2byte	0x11b
	.4byte	0x78
	.uleb128 0x11
	.4byte	$LC135
	.byte	0x7
	.2byte	0x120
	.4byte	0x8a
	.uleb128 0x11
	.4byte	$LC136
	.byte	0x7
	.2byte	0x12d
	.4byte	0x6d
	.uleb128 0x13
	.4byte	0x6d1
	.4byte	$LC137
	.byte	0x20
	.byte	0x7
	.2byte	0x142
	.uleb128 0x14
	.4byte	$LC138
	.byte	0x7
	.2byte	0x143
	.4byte	0x6d1
	.byte	0x2
	.byte	0x10
	.uleb128 0x0
	.byte	0x0
	.uleb128 0x8
	.4byte	0x6e1
	.4byte	0x6a8
	.uleb128 0x9
	.4byte	0x18b
	.byte	0x7
	.byte	0x0
	.uleb128 0x11
	.4byte	$LC137
	.byte	0x7
	.2byte	0x144
	.4byte	0x6b4
	.uleb128 0x2
	.4byte	$LC139
	.byte	0x9
	.byte	0x2e
	.4byte	0x42f
	.uleb128 0xa
	.4byte	0x721
	.4byte	$LC140
	.byte	0x8
	.byte	0x9
	.byte	0x39
	.uleb128 0xb
	.4byte	$LC141
	.byte	0x9
	.byte	0x39
	.4byte	0x727
	.byte	0x2
	.byte	0x10
	.uleb128 0x0
	.uleb128 0xb
	.4byte	$LC142
	.byte	0x9
	.byte	0x39
	.4byte	0x72d
	.byte	0x2
	.byte	0x10
	.uleb128 0x4
	.byte	0x0
	.uleb128 0x15
	.4byte	$LC255
	.byte	0x1
	.uleb128 0x5
	.byte	0x4
	.4byte	0x721
	.uleb128 0x5
	.byte	0x4
	.4byte	0x727
	.uleb128 0x2
	.4byte	$LC143
	.byte	0x9
	.byte	0x47
	.4byte	0x727
	.uleb128 0x2
	.4byte	$LC144
	.byte	0x9
	.byte	0x48
	.4byte	0x749
	.uleb128 0xa
	.4byte	0x780
	.4byte	$LC145
	.byte	0xc
	.byte	0x9
	.byte	0x3c
	.uleb128 0xb
	.4byte	$LC146
	.byte	0x9
	.byte	0x56
	.4byte	0x8a
	.byte	0x2
	.byte	0x10
	.uleb128 0x0
	.uleb128 0xb
	.4byte	$LC147
	.byte	0x9
	.byte	0x58
	.4byte	0x78
	.byte	0x2
	.byte	0x10
	.uleb128 0x4
	.uleb128 0xb
	.4byte	$LC148
	.byte	0x9
	.byte	0x59
	.4byte	0x304
	.byte	0x2
	.byte	0x10
	.uleb128 0x8
	.byte	0x0
	.uleb128 0x2
	.4byte	$LC149
	.byte	0x9
	.byte	0x49
	.4byte	0x78b
	.uleb128 0xa
	.4byte	0x7ec
	.4byte	$LC150
	.byte	0x1c
	.byte	0x9
	.byte	0x3d
	.uleb128 0xb
	.4byte	$LC151
	.byte	0x9
	.byte	0x5d
	.4byte	0x8a
	.byte	0x2
	.byte	0x10
	.uleb128 0x0
	.uleb128 0xb
	.4byte	$LC152
	.byte	0x9
	.byte	0x66
	.4byte	0x42f
	.byte	0x2
	.byte	0x10
	.uleb128 0x4
	.uleb128 0xb
	.4byte	$LC153
	.byte	0x9
	.byte	0x69
	.4byte	0x42f
	.byte	0x2
	.byte	0x10
	.uleb128 0x8
	.uleb128 0xb
	.4byte	$LC154
	.byte	0x9
	.byte	0x6a
	.4byte	0x733
	.byte	0x2
	.byte	0x10
	.uleb128 0xc
	.uleb128 0xb
	.4byte	$LC155
	.byte	0x9
	.byte	0x6b
	.4byte	0x6f8
	.byte	0x2
	.byte	0x10
	.uleb128 0x10
	.uleb128 0xb
	.4byte	$LC156
	.byte	0x9
	.byte	0x6c
	.4byte	0x304
	.byte	0x2
	.byte	0x10
	.uleb128 0x18
	.byte	0x0
	.uleb128 0x2
	.4byte	$LC157
	.byte	0x9
	.byte	0x4a
	.4byte	0x7f7
	.uleb128 0xa
	.4byte	0x820
	.4byte	$LC158
	.byte	0x8
	.byte	0x9
	.byte	0x3e
	.uleb128 0xb
	.4byte	$LC159
	.byte	0x9
	.byte	0x7c
	.4byte	0x8a
	.byte	0x2
	.byte	0x10
	.uleb128 0x0
	.uleb128 0xb
	.4byte	$LC160
	.byte	0x9
	.byte	0x7d
	.4byte	0x304
	.byte	0x2
	.byte	0x10
	.uleb128 0x4
	.byte	0x0
	.uleb128 0x2
	.4byte	$LC161
	.byte	0x9
	.byte	0x4b
	.4byte	0x82b
	.uleb128 0xa
	.4byte	0x87e
	.4byte	$LC162
	.byte	0x18
	.byte	0x9
	.byte	0x3f
	.uleb128 0xb
	.4byte	$LC163
	.byte	0x9
	.byte	0x85
	.4byte	0x8a
	.byte	0x2
	.byte	0x10
	.uleb128 0x0
	.uleb128 0xb
	.4byte	$LC164
	.byte	0x9
	.byte	0x88
	.4byte	0x42f
	.byte	0x2
	.byte	0x10
	.uleb128 0x4
	.uleb128 0xb
	.4byte	$LC165
	.byte	0x9
	.byte	0x89
	.4byte	0x6f8
	.byte	0x2
	.byte	0x10
	.uleb128 0x8
	.uleb128 0xb
	.4byte	$LC166
	.byte	0x9
	.byte	0x8b
	.4byte	0xa8f
	.byte	0x2
	.byte	0x10
	.uleb128 0x10
	.uleb128 0xb
	.4byte	$LC167
	.byte	0x9
	.byte	0x8c
	.4byte	0x304
	.byte	0x2
	.byte	0x10
	.uleb128 0x14
	.byte	0x0
	.uleb128 0x2
	.4byte	$LC168
	.byte	0x9
	.byte	0x4c
	.4byte	0x889
	.uleb128 0xa
	.4byte	0x8b2
	.4byte	$LC169
	.byte	0x8
	.byte	0x9
	.byte	0x40
	.uleb128 0xb
	.4byte	$LC170
	.byte	0x9
	.byte	0x9a
	.4byte	0x8a
	.byte	0x2
	.byte	0x10
	.uleb128 0x0
	.uleb128 0xb
	.4byte	$LC171
	.byte	0x9
	.byte	0x9b
	.4byte	0x304
	.byte	0x2
	.byte	0x10
	.uleb128 0x4
	.byte	0x0
	.uleb128 0x2
	.4byte	$LC172
	.byte	0x9
	.byte	0x4d
	.4byte	0x8bd
	.uleb128 0xa
	.4byte	0x8e6
	.4byte	$LC173
	.byte	0x20
	.byte	0x9
	.byte	0x4d
	.uleb128 0xb
	.4byte	$LC174
	.byte	0x9
	.byte	0xa2
	.4byte	0x780
	.byte	0x2
	.byte	0x10
	.uleb128 0x0
	.uleb128 0xb
	.4byte	$LC175
	.byte	0x9
	.byte	0xa3
	.4byte	0x78
	.byte	0x2
	.byte	0x10
	.uleb128 0x1c
	.byte	0x0
	.uleb128 0x2
	.4byte	$LC176
	.byte	0x9
	.byte	0x4e
	.4byte	0x8f1
	.uleb128 0xa
	.4byte	0x928
	.4byte	$LC177
	.byte	0xc
	.byte	0x9
	.byte	0x4e
	.uleb128 0xb
	.4byte	$LC178
	.byte	0x9
	.byte	0xa9
	.4byte	0x8a
	.byte	0x2
	.byte	0x10
	.uleb128 0x0
	.uleb128 0xb
	.4byte	$LC179
	.byte	0x9
	.byte	0xaa
	.4byte	0x42f
	.byte	0x2
	.byte	0x10
	.uleb128 0x4
	.uleb128 0xb
	.4byte	$LC180
	.byte	0x9
	.byte	0xab
	.4byte	0x78
	.byte	0x2
	.byte	0x10
	.uleb128 0x8
	.byte	0x0
	.uleb128 0x2
	.4byte	$LC181
	.byte	0x9
	.byte	0x4f
	.4byte	0x933
	.uleb128 0xa
	.4byte	0x9a2
	.4byte	$LC182
	.byte	0x24
	.byte	0x9
	.byte	0x42
	.uleb128 0xb
	.4byte	$LC183
	.byte	0x9
	.byte	0xb9
	.4byte	0x8a
	.byte	0x2
	.byte	0x10
	.uleb128 0x0
	.uleb128 0xb
	.4byte	$LC184
	.byte	0x9
	.byte	0xbc
	.4byte	0x42f
	.byte	0x2
	.byte	0x10
	.uleb128 0x4
	.uleb128 0xb
	.4byte	$LC185
	.byte	0x9
	.byte	0xbe
	.4byte	0x6f8
	.byte	0x2
	.byte	0x10
	.uleb128 0x8
	.uleb128 0xb
	.4byte	$LC186
	.byte	0x9
	.byte	0xbf
	.4byte	0x6f8
	.byte	0x2
	.byte	0x10
	.uleb128 0x10
	.uleb128 0xb
	.4byte	$LC187
	.byte	0x9
	.byte	0xc0
	.4byte	0x8a
	.byte	0x2
	.byte	0x10
	.uleb128 0x18
	.uleb128 0xb
	.4byte	$LC188
	.byte	0x9
	.byte	0xc1
	.4byte	0x733
	.byte	0x2
	.byte	0x10
	.uleb128 0x1c
	.uleb128 0xb
	.4byte	$LC189
	.byte	0x9
	.byte	0xc2
	.4byte	0x304
	.byte	0x2
	.byte	0x10
	.uleb128 0x20
	.byte	0x0
	.uleb128 0x2
	.4byte	$LC190
	.byte	0x9
	.byte	0x50
	.4byte	0x9ad
	.uleb128 0xa
	.4byte	0x9d6
	.4byte	$LC191
	.byte	0x8
	.byte	0x9
	.byte	0x43
	.uleb128 0xb
	.4byte	$LC192
	.byte	0x9
	.byte	0xd2
	.4byte	0x8a
	.byte	0x2
	.byte	0x10
	.uleb128 0x0
	.uleb128 0xb
	.4byte	$LC193
	.byte	0x9
	.byte	0xd3
	.4byte	0x304
	.byte	0x2
	.byte	0x10
	.uleb128 0x4
	.byte	0x0
	.uleb128 0x2
	.4byte	$LC194
	.byte	0x9
	.byte	0x51
	.4byte	0x9e1
	.uleb128 0xa
	.4byte	0xa50
	.4byte	$LC195
	.byte	0x20
	.byte	0x9
	.byte	0x44
	.uleb128 0xb
	.4byte	$LC196
	.byte	0x9
	.byte	0xda
	.4byte	0x8a
	.byte	0x2
	.byte	0x10
	.uleb128 0x0
	.uleb128 0xb
	.4byte	$LC197
	.byte	0x9
	.byte	0xdd
	.4byte	0x42f
	.byte	0x2
	.byte	0x10
	.uleb128 0x4
	.uleb128 0xb
	.4byte	$LC198
	.byte	0x9
	.byte	0xdf
	.4byte	0x6f8
	.byte	0x2
	.byte	0x10
	.uleb128 0x8
	.uleb128 0xb
	.4byte	$LC199
	.byte	0x9
	.byte	0xe0
	.4byte	0x8a
	.byte	0x2
	.byte	0x10
	.uleb128 0x10
	.uleb128 0xb
	.4byte	$LC200
	.byte	0x9
	.byte	0xe1
	.4byte	0x8a
	.byte	0x2
	.byte	0x10
	.uleb128 0x14
	.uleb128 0xb
	.4byte	$LC201
	.byte	0x9
	.byte	0xe2
	.4byte	0x8a
	.byte	0x2
	.byte	0x10
	.uleb128 0x18
	.uleb128 0xb
	.4byte	$LC202
	.byte	0x9
	.byte	0xe4
	.4byte	0x304
	.byte	0x2
	.byte	0x10
	.uleb128 0x1c
	.byte	0x0
	.uleb128 0x2
	.4byte	$LC203
	.byte	0x9
	.byte	0x52
	.4byte	0xa5b
	.uleb128 0xa
	.4byte	0xa84
	.4byte	$LC204
	.byte	0x8
	.byte	0x9
	.byte	0x45
	.uleb128 0xb
	.4byte	$LC205
	.byte	0x9
	.byte	0xeb
	.4byte	0x8a
	.byte	0x2
	.byte	0x10
	.uleb128 0x0
	.uleb128 0xb
	.4byte	$LC206
	.byte	0x9
	.byte	0xec
	.4byte	0x304
	.byte	0x2
	.byte	0x10
	.uleb128 0x4
	.byte	0x0
	.uleb128 0x2
	.4byte	$LC207
	.byte	0x9
	.byte	0x53
	.4byte	0x78
	.uleb128 0x5
	.byte	0x4
	.4byte	0x780
	.uleb128 0x2
	.4byte	$LC208
	.byte	0xa
	.byte	0x34
	.4byte	0x78
	.uleb128 0x16
	.4byte	0xac5
	.byte	0x8
	.byte	0xa
	.byte	0x3b
	.uleb128 0xb
	.4byte	$LC209
	.byte	0xa
	.byte	0x39
	.4byte	0x78
	.byte	0x2
	.byte	0x10
	.uleb128 0x0
	.uleb128 0xc
	.ascii	"rem\000"
	.byte	0xa
	.byte	0x3a
	.4byte	0x78
	.byte	0x2
	.byte	0x10
	.uleb128 0x4
	.byte	0x0
	.uleb128 0x2
	.4byte	$LC210
	.byte	0xa
	.byte	0x3b
	.4byte	0xaa0
	.uleb128 0x16
	.4byte	0xaf5
	.byte	0x8
	.byte	0xa
	.byte	0x40
	.uleb128 0xb
	.4byte	$LC209
	.byte	0xa
	.byte	0x3e
	.4byte	0x3c9
	.byte	0x2
	.byte	0x10
	.uleb128 0x0
	.uleb128 0xc
	.ascii	"rem\000"
	.byte	0xa
	.byte	0x3f
	.4byte	0x3c9
	.byte	0x2
	.byte	0x10
	.uleb128 0x4
	.byte	0x0
	.uleb128 0x2
	.4byte	$LC211
	.byte	0xa
	.byte	0x40
	.4byte	0xad0
	.uleb128 0x16
	.4byte	0xb25
	.byte	0x10
	.byte	0xa
	.byte	0x4a
	.uleb128 0xb
	.4byte	$LC209
	.byte	0xa
	.byte	0x47
	.4byte	0x9c
	.byte	0x2
	.byte	0x10
	.uleb128 0x0
	.uleb128 0xc
	.ascii	"rem\000"
	.byte	0xa
	.byte	0x49
	.4byte	0x9c
	.byte	0x2
	.byte	0x10
	.uleb128 0x8
	.byte	0x0
	.uleb128 0x2
	.4byte	$LC212
	.byte	0xa
	.byte	0x4a
	.4byte	0xb00
	.uleb128 0x16
	.4byte	0xb55
	.byte	0x10
	.byte	0xa
	.byte	0x51
	.uleb128 0xb
	.4byte	$LC209
	.byte	0xa
	.byte	0x4f
	.4byte	0x53c
	.byte	0x2
	.byte	0x10
	.uleb128 0x0
	.uleb128 0xc
	.ascii	"rem\000"
	.byte	0xa
	.byte	0x50
	.4byte	0x53c
	.byte	0x2
	.byte	0x10
	.uleb128 0x8
	.byte	0x0
	.uleb128 0x2
	.4byte	$LC213
	.byte	0xa
	.byte	0x51
	.4byte	0xb30
	.uleb128 0xa
	.4byte	0xb97
	.4byte	$LC214
	.byte	0xc
	.byte	0xb
	.byte	0x7
	.uleb128 0xb
	.4byte	$LC215
	.byte	0xb
	.byte	0x8
	.4byte	0x19d
	.byte	0x2
	.byte	0x10
	.uleb128 0x0
	.uleb128 0xb
	.4byte	$LC216
	.byte	0xb
	.byte	0x9
	.4byte	0x19d
	.byte	0x2
	.byte	0x10
	.uleb128 0x4
	.uleb128 0xb
	.4byte	$LC217
	.byte	0xb
	.byte	0xa
	.4byte	0xb97
	.byte	0x2
	.byte	0x10
	.uleb128 0x8
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.4byte	0xb9d
	.uleb128 0x3
	.4byte	$LC218
	.byte	0x8
	.byte	0x4
	.uleb128 0x2
	.4byte	$LC219
	.byte	0xb
	.byte	0xb
	.4byte	0xb60
	.uleb128 0x17
	.4byte	0xbd8
	.byte	0x1
	.4byte	$LC220
	.byte	0x1
	.byte	0x53
	.4byte	$LFB29
	.4byte	$LFE29
	.4byte	$LSFDE0
	.byte	0x1
	.byte	0x6e
	.uleb128 0x18
	.4byte	$LC224
	.byte	0x1
	.byte	0x55
	.4byte	0xbd8
	.byte	0x2
	.byte	0x91
	.sleb128 24
	.byte	0x0
	.uleb128 0x8
	.4byte	0xbe9
	.4byte	0xdc
	.uleb128 0x19
	.4byte	0x18b
	.2byte	0x1ff
	.byte	0x0
	.uleb128 0x1a
	.byte	0x1
	.4byte	$LC260
	.byte	0x1
	.byte	0x69
	.4byte	$LFB31
	.4byte	$LFE31
	.4byte	$LSFDE2
	.byte	0x1
	.byte	0x6e
	.uleb128 0x1b
	.4byte	0xc51
	.byte	0x1
	.4byte	$LC221
	.byte	0x1
	.byte	0x70
	.byte	0x1
	.4byte	0x78
	.4byte	$LFB33
	.4byte	$LFE33
	.4byte	$LSFDE4
	.byte	0x1
	.byte	0x6e
	.uleb128 0x1c
	.4byte	$LC222
	.byte	0x1
	.byte	0x70
	.4byte	0x78
	.byte	0x2
	.byte	0x91
	.sleb128 48
	.uleb128 0x1c
	.4byte	$LC223
	.byte	0x1
	.byte	0x70
	.4byte	0xc51
	.byte	0x2
	.byte	0x91
	.sleb128 52
	.uleb128 0x1d
	.4byte	$LBB4
	.4byte	$LBE4
	.uleb128 0x1e
	.ascii	"i\000"
	.byte	0x1
	.byte	0x72
	.4byte	0x78
	.byte	0x2
	.byte	0x91
	.sleb128 24
	.byte	0x0
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.4byte	0x376
	.uleb128 0x17
	.4byte	0xcb4
	.byte	0x1
	.4byte	$LC225
	.byte	0x1
	.byte	0x8a
	.4byte	$LFB35
	.4byte	$LFE35
	.4byte	$LSFDE6
	.byte	0x1
	.byte	0x6e
	.uleb128 0x18
	.4byte	$LC226
	.byte	0x1
	.byte	0x8d
	.4byte	0x19d
	.byte	0x2
	.byte	0x91
	.sleb128 24
	.uleb128 0x18
	.4byte	$LC227
	.byte	0x1
	.byte	0x8e
	.4byte	0xd6
	.byte	0x2
	.byte	0x91
	.sleb128 28
	.uleb128 0x18
	.4byte	$LC228
	.byte	0x1
	.byte	0x92
	.4byte	0xd6
	.byte	0x2
	.byte	0x91
	.sleb128 32
	.uleb128 0x1d
	.4byte	$LBB6
	.4byte	$LBE6
	.uleb128 0x18
	.4byte	$LC229
	.byte	0x1
	.byte	0x95
	.4byte	0xd6
	.byte	0x2
	.byte	0x91
	.sleb128 36
	.byte	0x0
	.byte	0x0
	.uleb128 0x1f
	.4byte	0xd41
	.byte	0x1
	.4byte	$LC230
	.byte	0x1
	.byte	0xa9
	.byte	0x1
	.4byte	$LFB37
	.4byte	$LFE37
	.4byte	$LSFDE8
	.byte	0x1
	.byte	0x6e
	.uleb128 0x1c
	.4byte	$LC231
	.byte	0x1
	.byte	0xa9
	.4byte	0xd6
	.byte	0x3
	.byte	0x91
	.sleb128 72
	.uleb128 0x18
	.4byte	$LC232
	.byte	0x1
	.byte	0xae
	.4byte	0x19d
	.byte	0x2
	.byte	0x91
	.sleb128 24
	.uleb128 0x18
	.4byte	$LC233
	.byte	0x1
	.byte	0xaf
	.4byte	0xb97
	.byte	0x2
	.byte	0x91
	.sleb128 28
	.uleb128 0x18
	.4byte	$LC234
	.byte	0x1
	.byte	0xb3
	.4byte	0xb97
	.byte	0x2
	.byte	0x91
	.sleb128 32
	.uleb128 0x18
	.4byte	$LC235
	.byte	0x1
	.byte	0xb4
	.4byte	0xb97
	.byte	0x2
	.byte	0x91
	.sleb128 36
	.uleb128 0x18
	.4byte	$LC236
	.byte	0x1
	.byte	0xb7
	.4byte	0xd41
	.byte	0x2
	.byte	0x91
	.sleb128 40
	.uleb128 0x18
	.4byte	$LC237
	.byte	0x1
	.byte	0xbb
	.4byte	0xd41
	.byte	0x2
	.byte	0x91
	.sleb128 44
	.uleb128 0x18
	.4byte	$LC238
	.byte	0x1
	.byte	0xbe
	.4byte	0xd41
	.byte	0x2
	.byte	0x91
	.sleb128 48
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.4byte	0xba4
	.uleb128 0x1b
	.4byte	0xdc2
	.byte	0x1
	.4byte	$LC239
	.byte	0x1
	.byte	0xc9
	.byte	0x1
	.4byte	0xd6
	.4byte	$LFB39
	.4byte	$LFE39
	.4byte	$LSFDE10
	.byte	0x1
	.byte	0x6e
	.uleb128 0x1c
	.4byte	$LC226
	.byte	0x1
	.byte	0xc8
	.4byte	0xdc2
	.byte	0x3
	.byte	0x91
	.sleb128 64
	.uleb128 0x18
	.4byte	$LC240
	.byte	0x1
	.byte	0xca
	.4byte	0x8a
	.byte	0x2
	.byte	0x91
	.sleb128 24
	.uleb128 0x18
	.4byte	$LC241
	.byte	0x1
	.byte	0xcb
	.4byte	0x8a
	.byte	0x2
	.byte	0x91
	.sleb128 28
	.uleb128 0x18
	.4byte	$LC242
	.byte	0x1
	.byte	0xcd
	.4byte	0xd6
	.byte	0x2
	.byte	0x91
	.sleb128 32
	.uleb128 0x1d
	.4byte	$LBB9
	.4byte	$LBE9
	.uleb128 0x1e
	.ascii	"c\000"
	.byte	0x1
	.byte	0xd2
	.4byte	0x78
	.byte	0x2
	.byte	0x91
	.sleb128 36
	.uleb128 0x1e
	.ascii	"i\000"
	.byte	0x1
	.byte	0xd3
	.4byte	0x8a
	.byte	0x2
	.byte	0x91
	.sleb128 40
	.byte	0x0
	.byte	0x0
	.uleb128 0x5
	.byte	0x4
	.4byte	0x19d
	.uleb128 0x1b
	.4byte	0xe6c
	.byte	0x1
	.4byte	$LC243
	.byte	0x1
	.byte	0xed
	.byte	0x1
	.4byte	0xb97
	.4byte	$LFB41
	.4byte	$LFE41
	.4byte	$LSFDE12
	.byte	0x1
	.byte	0x6e
	.uleb128 0x1c
	.4byte	$LC227
	.byte	0x1
	.byte	0xed
	.4byte	0xd6
	.byte	0x3
	.byte	0x91
	.sleb128 72
	.uleb128 0x1c
	.4byte	$LC232
	.byte	0x1
	.byte	0xed
	.4byte	0xdc2
	.byte	0x3
	.byte	0x91
	.sleb128 76
	.uleb128 0x18
	.4byte	$LC244
	.byte	0x1
	.byte	0xf0
	.4byte	0x78
	.byte	0x2
	.byte	0x91
	.sleb128 24
	.uleb128 0x1e
	.ascii	"p\000"
	.byte	0x1
	.byte	0xf3
	.4byte	0xd6
	.byte	0x2
	.byte	0x91
	.sleb128 28
	.uleb128 0x18
	.4byte	$LC233
	.byte	0x1
	.byte	0xf6
	.4byte	0xb97
	.byte	0x2
	.byte	0x91
	.sleb128 32
	.uleb128 0x1d
	.4byte	$LBB11
	.4byte	$LBE11
	.uleb128 0x1e
	.ascii	"n\000"
	.byte	0x1
	.byte	0xfc
	.4byte	0x78
	.byte	0x2
	.byte	0x91
	.sleb128 36
	.uleb128 0x20
	.4byte	$LC245
	.byte	0x1
	.2byte	0x101
	.4byte	0x78
	.byte	0x2
	.byte	0x91
	.sleb128 40
	.uleb128 0x1d
	.4byte	$LBB12
	.4byte	$LBE12
	.uleb128 0x20
	.4byte	$LC246
	.byte	0x1
	.2byte	0x107
	.4byte	0xb9d
	.byte	0x2
	.byte	0x91
	.sleb128 48
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x21
	.4byte	0xee6
	.byte	0x1
	.4byte	$LC247
	.byte	0x1
	.2byte	0x127
	.byte	0x1
	.4byte	0xb97
	.4byte	$LFB43
	.4byte	$LFE43
	.4byte	$LSFDE14
	.byte	0x1
	.byte	0x6e
	.uleb128 0x22
	.4byte	$LC248
	.byte	0x1
	.2byte	0x125
	.4byte	0xb97
	.byte	0x2
	.byte	0x91
	.sleb128 56
	.uleb128 0x22
	.4byte	$LC232
	.byte	0x1
	.2byte	0x126
	.4byte	0x19d
	.byte	0x2
	.byte	0x91
	.sleb128 60
	.uleb128 0x22
	.4byte	$LC249
	.byte	0x1
	.2byte	0x127
	.4byte	0x19d
	.byte	0x3
	.byte	0x91
	.sleb128 64
	.uleb128 0x23
	.ascii	"i\000"
	.byte	0x1
	.2byte	0x129
	.4byte	0x78
	.byte	0x2
	.byte	0x91
	.sleb128 24
	.uleb128 0x20
	.4byte	$LC250
	.byte	0x1
	.2byte	0x12f
	.4byte	0xb97
	.byte	0x2
	.byte	0x91
	.sleb128 28
	.uleb128 0x20
	.4byte	$LC251
	.byte	0x1
	.2byte	0x130
	.4byte	0x78
	.byte	0x2
	.byte	0x91
	.sleb128 32
	.byte	0x0
	.uleb128 0x24
	.4byte	0xf12
	.byte	0x1
	.4byte	$LC252
	.byte	0x1
	.2byte	0x13e
	.byte	0x1
	.4byte	$LFB45
	.4byte	$LFE45
	.4byte	$LSFDE16
	.byte	0x1
	.byte	0x6e
	.uleb128 0x22
	.4byte	$LC253
	.byte	0x1
	.2byte	0x13e
	.4byte	0x78
	.byte	0x2
	.byte	0x91
	.sleb128 40
	.byte	0x0
	.uleb128 0x25
	.byte	0x1
	.4byte	0x3a7
	.uleb128 0x26
	.4byte	$LC254
	.byte	0x5
	.byte	0x8d
	.4byte	0xf12
	.byte	0x1
	.byte	0x1
	.uleb128 0x15
	.4byte	$LC256
	.byte	0x1
	.byte	0x0
	.section	.debug_abbrev
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x10
	.uleb128 0x6
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x2
	.uleb128 0x16
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x4
	.uleb128 0x24
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x5
	.uleb128 0xf
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x6
	.uleb128 0x17
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x7
	.uleb128 0xd
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x8
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x9
	.uleb128 0x21
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0xa
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xd
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0xc
	.uleb128 0xd
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0xd
	.uleb128 0xf
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0xe
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0xf
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x10
	.uleb128 0x26
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x11
	.uleb128 0x16
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x12
	.uleb128 0x35
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x13
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.byte	0x0
	.byte	0x0
	.uleb128 0x14
	.uleb128 0xd
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x15
	.uleb128 0x13
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0x0
	.byte	0x0
	.uleb128 0x16
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x17
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x2001
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x18
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x19
	.uleb128 0x21
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0x0
	.byte	0x0
	.uleb128 0x1a
	.uleb128 0x2e
	.byte	0x0
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x2001
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x1b
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x2001
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x1c
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x1d
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.byte	0x0
	.byte	0x0
	.uleb128 0x1e
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x1f
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x2001
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x20
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x21
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x2001
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x22
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x23
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x24
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x2001
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x25
	.uleb128 0x1
	.byte	0x0
	.uleb128 0x3c
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x26
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.section	.debug_pubnames,"",@progbits
	.4byte	0x93
	.2byte	0x2
	.4byte	$Ldebug_info0
	.4byte	0xf2c
	.4byte	0xbaf
	.ascii	"show_help\000"
	.4byte	0xbe9
	.ascii	"version\000"
	.4byte	0xbff
	.ascii	"main\000"
	.4byte	0xc57
	.ascii	"exec_program\000"
	.4byte	0xcb4
	.ascii	"process_line\000"
	.4byte	0xd47
	.ascii	"read_from_stdin\000"
	.4byte	0xdc8
	.ascii	"parse\000"
	.4byte	0xe6c
	.ascii	"extract_matrix\000"
	.4byte	0xee6
	.ascii	"logAndExit\000"
	.4byte	0x0
	.section	.debug_aranges,"",@progbits
	.4byte	0x1c
	.2byte	0x2
	.4byte	$Ldebug_info0
	.byte	0x4
	.byte	0x0
	.2byte	0x0
	.2byte	0x0
	.4byte	$Ltext0
	.4byte	$Letext0-$Ltext0
	.4byte	0x0
	.4byte	0x0
	.section	.debug_str,"MS",@progbits,1
$LC62:
	.ascii	"_ext\000"
$LC51:
	.ascii	"_size\000"
$LC133:
	.ascii	"timer_t\000"
$LC149:
	.ascii	"pthread_mutex_t\000"
$LC191:
	.ascii	"__pthread_rwlockattr_st\000"
$LC145:
	.ascii	"__pthread_attr_st\000"
$LC85:
	.ascii	"uint32_t\000"
$LC153:
	.ascii	"ptm_interlock\000"
$LC75:
	.ascii	"psize_t\000"
$LC22:
	.ascii	"short unsigned int\000"
$LC56:
	.ascii	"_lbfsize\000"
$LC249:
	.ascii	"matrix_num\000"
$LC140:
	.ascii	"pthread_queue_t\000"
$LC18:
	.ascii	"unsigned char\000"
$LC173:
	.ascii	"__pthread_once_st\000"
$LC120:
	.ascii	"mode_t\000"
$LC135:
	.ascii	"useconds_t\000"
$LC198:
	.ascii	"ptb_waiters\000"
$LC193:
	.ascii	"ptra_private\000"
$LC160:
	.ascii	"ptma_private\000"
$LC68:
	.ascii	"off_t\000"
$LC187:
	.ascii	"ptr_nreaders\000"
$LC189:
	.ascii	"ptr_private\000"
$LC52:
	.ascii	"__sbuf\000"
$LC228:
	.ascii	"cur_line\000"
$LC60:
	.ascii	"_seek\000"
$LC36:
	.ascii	"__in_port_t\000"
$LC48:
	.ascii	"size_t\000"
$LC106:
	.ascii	"longlong_t\000"
$LC117:
	.ascii	"id_t\000"
$LC59:
	.ascii	"_read\000"
$LC107:
	.ascii	"u_longlong_t\000"
$LC38:
	.ascii	"__off_t\000"
$LC152:
	.ascii	"ptm_lock\000"
$LC229:
	.ascii	"next_line\000"
$LC183:
	.ascii	"ptr_magic\000"
$LC231:
	.ascii	"line\000"
$LC192:
	.ascii	"ptra_magic\000"
$LC175:
	.ascii	"pto_done\000"
$LC73:
	.ascii	"mips_fpreg_t\000"
$LC44:
	.ascii	"__fsfilcnt_t\000"
$LC134:
	.ascii	"suseconds_t\000"
$LC111:
	.ascii	"fsfilcnt_t\000"
$LC102:
	.ascii	"cpuid_t\000"
$LC53:
	.ascii	"__sFILE\000"
$LC45:
	.ascii	"__mbstate8\000"
$LC71:
	.ascii	"mips_ureg_t\000"
$LC141:
	.ascii	"ptqh_first\000"
$LC96:
	.ascii	"u_int\000"
$LC80:
	.ascii	"int8_t\000"
$LC136:
	.ascii	"__fd_mask\000"
$LC46:
	.ascii	"__mbstateL\000"
$LC179:
	.ascii	"pts_spin\000"
$LC224:
	.ascii	"buffer\000"
$LC230:
	.ascii	"process_line\000"
$LC98:
	.ascii	"unchar\000"
$LC109:
	.ascii	"blksize_t\000"
$LC161:
	.ascii	"pthread_cond_t\000"
$LC156:
	.ascii	"ptm_private\000"
$LC159:
	.ascii	"ptma_magic\000"
$LC243:
	.ascii	"parse\000"
$LC210:
	.ascii	"div_t\000"
$LC213:
	.ascii	"qdiv_t\000"
$LC232:
	.ascii	"matrix_size\000"
$LC257:
	.ascii	"main.c\000"
$LC197:
	.ascii	"ptb_lock\000"
$LC58:
	.ascii	"_close\000"
$LC186:
	.ascii	"ptr_wblocked\000"
$LC118:
	.ascii	"ino_t\000"
$LC49:
	.ascii	"fpos_t\000"
$LC28:
	.ascii	"__uint64_t\000"
$LC222:
	.ascii	"argc\000"
$LC122:
	.ascii	"pid_t\000"
$LC77:
	.ascii	"vsize_t\000"
$LC87:
	.ascii	"uint64_t\000"
$LC240:
	.ascii	"len_max\000"
$LC137:
	.ascii	"fd_set\000"
$LC223:
	.ascii	"argv\000"
$LC57:
	.ascii	"_cookie\000"
$LC212:
	.ascii	"lldiv_t\000"
$LC72:
	.ascii	"long unsigned int\000"
$LC171:
	.ascii	"ptca_private\000"
$LC254:
	.ascii	"__sF\000"
$LC39:
	.ascii	"__pid_t\000"
$LC215:
	.ascii	"rows\000"
$LC65:
	.ascii	"_blksize\000"
$LC50:
	.ascii	"_base\000"
$LC119:
	.ascii	"key_t\000"
$LC105:
	.ascii	"qaddr_t\000"
$LC217:
	.ascii	"array\000"
$LC24:
	.ascii	"__uint32_t\000"
$LC234:
	.ascii	"matrix1\000"
$LC235:
	.ascii	"matrix2\000"
$LC194:
	.ascii	"pthread_barrier_t\000"
$LC167:
	.ascii	"ptc_private\000"
$LC209:
	.ascii	"quot\000"
$LC114:
	.ascii	"dev_t\000"
$LC129:
	.ascii	"clock_t\000"
$LC123:
	.ascii	"lwpid_t\000"
$LC225:
	.ascii	"exec_program\000"
$LC248:
	.ascii	"array_matrixes\000"
$LC63:
	.ascii	"_ubuf\000"
$LC64:
	.ascii	"_nbuf\000"
$LC20:
	.ascii	"short int\000"
$LC88:
	.ascii	"u_int8_t\000"
$LC168:
	.ascii	"pthread_condattr_t\000"
$LC86:
	.ascii	"int64_t\000"
$LC127:
	.ascii	"uid_t\000"
$LC205:
	.ascii	"ptba_magic\000"
$LC27:
	.ascii	"long long int\000"
$LC204:
	.ascii	"__pthread_barrierattr_st\000"
$LC190:
	.ascii	"pthread_rwlockattr_t\000"
$LC115:
	.ascii	"fixpt_t\000"
$LC113:
	.ascii	"daddr_t\000"
$LC221:
	.ascii	"main\000"
$LC29:
	.ascii	"long long unsigned int\000"
$LC259:
	.ascii	"GNU C 3.3.3 (NetBSD nb3 20040520) -g\000"
$LC42:
	.ascii	"__uid_t\000"
$LC67:
	.ascii	"FILE\000"
$LC21:
	.ascii	"__uint16_t\000"
$LC121:
	.ascii	"nlink_t\000"
$LC126:
	.ascii	"swblk_t\000"
$LC139:
	.ascii	"pthread_spin_t\000"
$LC125:
	.ascii	"segsz_t\000"
$LC203:
	.ascii	"pthread_barrierattr_t\000"
$LC220:
	.ascii	"show_help\000"
$LC128:
	.ascii	"dtime_t\000"
$LC33:
	.ascii	"char\000"
$LC211:
	.ascii	"ldiv_t\000"
$LC170:
	.ascii	"ptca_magic\000"
$LC74:
	.ascii	"paddr_t\000"
$LC200:
	.ascii	"ptb_curcount\000"
$LC84:
	.ascii	"int32_t\000"
$LC172:
	.ascii	"pthread_once_t\000"
$LC76:
	.ascii	"vaddr_t\000"
$LC206:
	.ascii	"ptba_private\000"
$LC214:
	.ascii	"matrix\000"
$LC147:
	.ascii	"pta_flags\000"
$LC81:
	.ascii	"uint8_t\000"
$LC164:
	.ascii	"ptc_lock\000"
$LC69:
	.ascii	"mips_reg_t\000"
$LC185:
	.ascii	"ptr_rblocked\000"
$LC241:
	.ascii	"current_size\000"
$LC244:
	.ascii	"matrix_count\000"
$LC112:
	.ascii	"caddr_t\000"
$LC177:
	.ascii	"__pthread_spinlock_st\000"
$LC202:
	.ascii	"ptb_private\000"
$LC182:
	.ascii	"__pthread_rwlock_st\000"
$LC163:
	.ascii	"ptc_magic\000"
$LC100:
	.ascii	"uint\000"
$LC239:
	.ascii	"read_from_stdin\000"
$LC169:
	.ascii	"__pthread_condattr_st\000"
$LC219:
	.ascii	"matrix_t\000"
$LC237:
	.ascii	"matrix_two\000"
$LC180:
	.ascii	"pts_flags\000"
$LC166:
	.ascii	"ptc_mutex\000"
$LC255:
	.ascii	"__pthread_st\000"
$LC54:
	.ascii	"_flags\000"
$LC181:
	.ascii	"pthread_rwlock_t\000"
$LC30:
	.ascii	"__intptr_t\000"
$LC196:
	.ascii	"ptb_magic\000"
$LC82:
	.ascii	"int16_t\000"
$LC260:
	.ascii	"version\000"
$LC108:
	.ascii	"blkcnt_t\000"
$LC208:
	.ascii	"wchar_t\000"
$LC174:
	.ascii	"pto_mutex\000"
$LC176:
	.ascii	"pthread_spinlock_t\000"
$LC148:
	.ascii	"pta_private\000"
$LC17:
	.ascii	"signed char\000"
$LC252:
	.ascii	"logAndExit\000"
$LC150:
	.ascii	"__pthread_mutex_st\000"
$LC37:
	.ascii	"__mode_t\000"
$LC78:
	.ascii	"register_t\000"
$LC155:
	.ascii	"ptm_blocked\000"
$LC132:
	.ascii	"clockid_t\000"
$LC201:
	.ascii	"ptb_generation\000"
$LC25:
	.ascii	"unsigned int\000"
$LC251:
	.ascii	"matrix_index\000"
$LC104:
	.ascii	"quad_t\000"
$LC97:
	.ascii	"u_long\000"
$LC188:
	.ascii	"ptr_writer\000"
$LC184:
	.ascii	"ptr_interlock\000"
$LC91:
	.ascii	"u_int64_t\000"
$LC250:
	.ascii	"matrix_n\000"
$LC157:
	.ascii	"pthread_mutexattr_t\000"
$LC245:
	.ascii	"iterator\000"
$LC154:
	.ascii	"ptm_owner\000"
$LC207:
	.ascii	"pthread_key_t\000"
$LC101:
	.ascii	"ulong\000"
$LC94:
	.ascii	"u_char\000"
$LC41:
	.ascii	"__socklen_t\000"
$LC130:
	.ascii	"ssize_t\000"
$LC162:
	.ascii	"__pthread_cond_st\000"
$LC26:
	.ascii	"__int64_t\000"
$LC143:
	.ascii	"pthread_t\000"
$LC55:
	.ascii	"_file\000"
$LC92:
	.ascii	"in_addr_t\000"
$LC258:
	.ascii	"/root/tp1\000"
$LC15:
	.ascii	"__int8_t\000"
$LC43:
	.ascii	"__fsblkcnt_t\000"
$LC116:
	.ascii	"gid_t\000"
$LC110:
	.ascii	"fsblkcnt_t\000"
$LC79:
	.ascii	"__cpu_simple_lock_t\000"
$LC90:
	.ascii	"u_int32_t\000"
$LC66:
	.ascii	"_offset\000"
$LC47:
	.ascii	"__mbstate_t\000"
$LC142:
	.ascii	"ptqh_last\000"
$LC99:
	.ascii	"ushort\000"
$LC31:
	.ascii	"__uintptr_t\000"
$LC34:
	.ascii	"__gid_t\000"
$LC227:
	.ascii	"string_read\000"
$LC23:
	.ascii	"__int32_t\000"
$LC199:
	.ascii	"ptb_initcount\000"
$LC158:
	.ascii	"__pthread_mutexattr_st\000"
$LC253:
	.ascii	"error_code\000"
$LC61:
	.ascii	"_write\000"
$LC16:
	.ascii	"__uint8_t\000"
$LC216:
	.ascii	"cols\000"
$LC138:
	.ascii	"fds_bits\000"
$LC146:
	.ascii	"pta_magic\000"
$LC238:
	.ascii	"final_matrix\000"
$LC256:
	.ascii	"__pthread_spin_st\000"
$LC83:
	.ascii	"uint16_t\000"
$LC226:
	.ascii	"size\000"
$LC70:
	.ascii	"long int\000"
$LC144:
	.ascii	"pthread_attr_t\000"
$LC32:
	.ascii	"__caddr_t\000"
$LC93:
	.ascii	"in_port_t\000"
$LC195:
	.ascii	"__pthread_barrier_st\000"
$LC89:
	.ascii	"u_int16_t\000"
$LC218:
	.ascii	"double\000"
$LC131:
	.ascii	"time_t\000"
$LC151:
	.ascii	"ptm_magic\000"
$LC103:
	.ascii	"u_quad_t\000"
$LC242:
	.ascii	"pStr\000"
$LC247:
	.ascii	"extract_matrix\000"
$LC246:
	.ascii	"matrix_valueij\000"
$LC178:
	.ascii	"pts_magic\000"
$LC35:
	.ascii	"__in_addr_t\000"
$LC124:
	.ascii	"rlim_t\000"
$LC40:
	.ascii	"__sa_family_t\000"
$LC95:
	.ascii	"u_short\000"
$LC236:
	.ascii	"matrix_one\000"
$LC233:
	.ascii	"matrixes\000"
$LC19:
	.ascii	"__int16_t\000"
$LC165:
	.ascii	"ptc_waiters\000"
	.ident	"GCC: (GNU) 3.3.3 (NetBSD nb3 20040520)"

	.file	"main.c"
	.text
	.globl	matrix_new
	.type	matrix_new, @function
matrix_new:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$40, %rsp
	.cfi_offset 3, -24
	movl	%edi, -36(%rbp)
	movl	%esi, -40(%rbp)
	movl	$16, %edi
	call	malloc@PLT
	movq	%rax, -24(%rbp)
	movl	-36(%rbp), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, 8(%rax)
	movl	-36(%rbp), %eax
	imull	-40(%rbp), %eax
	cltq
	movq	-24(%rbp), %rdx
	movq	8(%rdx), %rbx
	movq	%rax, %rsi
	movl	$8, %edi
	call	calloc@PLT
	movq	%rax, (%rbx)
	movl	$0, -28(%rbp)
	jmp	.L2
.L3:
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	(%rax), %rdx
	movl	-40(%rbp), %eax
	imull	-28(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rsi
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movl	-28(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$3, %rcx
	addq	%rcx, %rax
	addq	%rsi, %rdx
	movq	%rdx, (%rax)
	addl	$1, -28(%rbp)
.L2:
	movl	-28(%rbp), %eax
	cmpl	-36(%rbp), %eax
	jl	.L3
	movq	-24(%rbp), %rax
	movl	-36(%rbp), %edx
	movl	%edx, (%rax)
	movq	-24(%rbp), %rax
	movl	-40(%rbp), %edx
	movl	%edx, 4(%rax)
	movq	-24(%rbp), %rax
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	matrix_new, .-matrix_new
	.globl	matrix_delete
	.type	matrix_delete, @function
matrix_delete:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	matrix_delete, .-matrix_delete
	.globl	matrix_transpose
	.type	matrix_transpose, @function
matrix_transpose:
.LFB8:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movl	$0, -16(%rbp)
	jmp	.L7
.L10:
	movl	$0, -12(%rbp)
	jmp	.L8
.L9:
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movl	-16(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-12(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movsd	(%rax), %xmm0
	movsd	%xmm0, -8(%rbp)
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movl	-12(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-16(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rax, %rdx
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movl	-16(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$3, %rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	movl	-12(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$3, %rcx
	addq	%rcx, %rax
	movsd	(%rdx), %xmm0
	movsd	%xmm0, (%rax)
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movl	-12(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-16(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movsd	-8(%rbp), %xmm0
	movsd	%xmm0, (%rax)
	addl	$1, -12(%rbp)
.L8:
	movl	-12(%rbp), %eax
	cmpl	-16(%rbp), %eax
	jl	.L9
	addl	$1, -16(%rbp)
.L7:
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	cmpl	%eax, -16(%rbp)
	jl	.L10
	nop
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	matrix_transpose, .-matrix_transpose
	.globl	matrix_copy
	.type	matrix_copy, @function
matrix_copy:
.LFB9:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movl	%edx, -32(%rbp)
	movl	-32(%rbp), %edx
	movl	-28(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	matrix_new
	movq	%rax, -8(%rbp)
	movl	$0, -16(%rbp)
	jmp	.L12
.L15:
	movl	$0, -12(%rbp)
	jmp	.L13
.L14:
	movl	-32(%rbp), %eax
	imull	-16(%rbp), %eax
	movslq	%eax, %rdx
	movl	-12(%rbp), %eax
	cltq
	addq	%rdx, %rax
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movl	-16(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$3, %rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	movl	-12(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$3, %rcx
	addq	%rcx, %rax
	movsd	(%rdx), %xmm0
	movsd	%xmm0, (%rax)
	addl	$1, -12(%rbp)
.L13:
	movl	-12(%rbp), %eax
	cmpl	-32(%rbp), %eax
	jl	.L14
	addl	$1, -16(%rbp)
.L12:
	movl	-16(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jl	.L15
	movq	-8(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	matrix_copy, .-matrix_copy
	.globl	matrix_mul
	.type	matrix_mul, @function
matrix_mul:
.LFB10:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movq	-40(%rbp), %rax
	movl	4(%rax), %edx
	movq	-48(%rbp), %rax
	movl	(%rax), %eax
	cmpl	%eax, %edx
	je	.L18
	movl	$0, %eax
	jmp	.L19
.L18:
	movq	-48(%rbp), %rax
	movl	4(%rax), %edx
	movq	-40(%rbp), %rax
	movl	(%rax), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	matrix_new
	movq	%rax, -8(%rbp)
	movl	$0, -20(%rbp)
	jmp	.L20
.L25:
	movl	$0, -16(%rbp)
	jmp	.L21
.L24:
	movl	$0, -12(%rbp)
	jmp	.L22
.L23:
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-16(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movsd	(%rax), %xmm1
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-12(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movsd	(%rax), %xmm2
	movq	-48(%rbp), %rax
	movq	8(%rax), %rax
	movl	-12(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-16(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movsd	(%rax), %xmm0
	mulsd	%xmm2, %xmm0
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-16(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	addsd	%xmm1, %xmm0
	movsd	%xmm0, (%rax)
	addl	$1, -12(%rbp)
.L22:
	movq	-40(%rbp), %rax
	movl	4(%rax), %eax
	cmpl	%eax, -12(%rbp)
	jl	.L23
	addl	$1, -16(%rbp)
.L21:
	movq	-48(%rbp), %rax
	movl	4(%rax), %eax
	cmpl	%eax, -16(%rbp)
	jl	.L24
	addl	$1, -20(%rbp)
.L20:
	movq	-40(%rbp), %rax
	movl	(%rax), %eax
	cmpl	%eax, -20(%rbp)
	jl	.L25
	movq	-8(%rbp), %rax
.L19:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	matrix_mul, .-matrix_mul
	.globl	matrix_minor
	.type	matrix_minor, @function
matrix_minor:
.LFB11:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	movl	%esi, -44(%rbp)
	movq	-40(%rbp), %rax
	movl	4(%rax), %edx
	movq	-40(%rbp), %rax
	movl	(%rax), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	matrix_new
	movq	%rax, -8(%rbp)
	movl	$0, -20(%rbp)
	jmp	.L27
.L28:
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movsd	.LC0(%rip), %xmm0
	movsd	%xmm0, (%rax)
	addl	$1, -20(%rbp)
.L27:
	movl	-20(%rbp), %eax
	cmpl	-44(%rbp), %eax
	jl	.L28
	movl	-44(%rbp), %eax
	movl	%eax, -16(%rbp)
	jmp	.L29
.L32:
	movl	-44(%rbp), %eax
	movl	%eax, -12(%rbp)
	jmp	.L30
.L31:
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	movl	-16(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-12(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movl	-16(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$3, %rcx
	addq	%rcx, %rax
	movq	(%rax), %rax
	movl	-12(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$3, %rcx
	addq	%rcx, %rax
	movsd	(%rdx), %xmm0
	movsd	%xmm0, (%rax)
	addl	$1, -12(%rbp)
.L30:
	movq	-40(%rbp), %rax
	movl	4(%rax), %eax
	cmpl	%eax, -12(%rbp)
	jl	.L31
	addl	$1, -16(%rbp)
.L29:
	movq	-40(%rbp), %rax
	movl	(%rax), %eax
	cmpl	%eax, -16(%rbp)
	jl	.L32
	movq	-8(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	matrix_minor, .-matrix_minor
	.globl	vmadd
	.type	vmadd, @function
vmadd:
.LFB12:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movsd	%xmm0, -40(%rbp)
	movq	%rdx, -48(%rbp)
	movl	%ecx, -52(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L35
.L36:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movsd	(%rax), %xmm1
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movsd	(%rax), %xmm0
	mulsd	-40(%rbp), %xmm0
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	addsd	%xmm1, %xmm0
	movsd	%xmm0, (%rax)
	addl	$1, -4(%rbp)
.L35:
	movl	-4(%rbp), %eax
	cmpl	-52(%rbp), %eax
	jl	.L36
	movq	-48(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	vmadd, .-vmadd
	.globl	vmul
	.type	vmul, @function
vmul:
.LFB13:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	movl	%esi, -44(%rbp)
	movl	-44(%rbp), %edx
	movl	-44(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	matrix_new
	movq	%rax, -8(%rbp)
	movl	$0, -20(%rbp)
	jmp	.L39
.L42:
	movl	$0, -16(%rbp)
	jmp	.L40
.L41:
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movsd	(%rax), %xmm1
	movsd	.LC1(%rip), %xmm0
	mulsd	%xmm0, %xmm1
	movl	-16(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movsd	(%rax), %xmm0
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movl	-20(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-16(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, (%rax)
	addl	$1, -16(%rbp)
.L40:
	movl	-16(%rbp), %eax
	cmpl	-44(%rbp), %eax
	jl	.L41
	addl	$1, -20(%rbp)
.L39:
	movl	-20(%rbp), %eax
	cmpl	-44(%rbp), %eax
	jl	.L42
	movl	$0, -12(%rbp)
	jmp	.L43
.L44:
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movl	-12(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-12(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movsd	(%rax), %xmm1
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movl	-12(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-12(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movsd	.LC0(%rip), %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, (%rax)
	addl	$1, -12(%rbp)
.L43:
	movl	-12(%rbp), %eax
	cmpl	-44(%rbp), %eax
	jl	.L44
	movq	-8(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	vmul, .-vmul
	.globl	vnorm
	.type	vnorm, @function
vnorm:
.LFB14:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -8(%rbp)
	movl	$0, -12(%rbp)
	jmp	.L47
.L48:
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movsd	(%rax), %xmm1
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movsd	(%rax), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	-8(%rbp), %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -8(%rbp)
	addl	$1, -12(%rbp)
.L47:
	movl	-12(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jl	.L48
	movq	-8(%rbp), %rax
	movq	%rax, %xmm0
	call	sqrt@PLT
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE14:
	.size	vnorm, .-vnorm
	.globl	vdiv
	.type	vdiv, @function
vdiv:
.LFB15:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movsd	%xmm0, -32(%rbp)
	movq	%rsi, -40(%rbp)
	movl	%edx, -44(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L51
.L52:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movsd	(%rax), %xmm0
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	divsd	-32(%rbp), %xmm0
	movsd	%xmm0, (%rax)
	addl	$1, -4(%rbp)
.L51:
	movl	-4(%rbp), %eax
	cmpl	-44(%rbp), %eax
	jl	.L52
	movq	-40(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE15:
	.size	vdiv, .-vdiv
	.globl	mcol
	.type	mcol, @function
mcol:
.LFB16:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movl	%edx, -36(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L55
.L56:
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-36(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rax, %rdx
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rcx
	movq	-32(%rbp), %rax
	addq	%rcx, %rax
	movsd	(%rdx), %xmm0
	movsd	%xmm0, (%rax)
	addl	$1, -4(%rbp)
.L55:
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	cmpl	%eax, -4(%rbp)
	jl	.L56
	movq	-32(%rbp), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE16:
	.size	mcol, .-mcol
	.section	.rodata
.LC3:
	.string	" %8.3f"
	.text
	.globl	matrix_show
	.type	matrix_show, @function
matrix_show:
.LFB17:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	$0, -8(%rbp)
	jmp	.L59
.L62:
	movl	$0, -4(%rbp)
	jmp	.L60
.L61:
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %xmm0
	leaq	.LC3(%rip), %rdi
	movl	$1, %eax
	call	printf@PLT
	addl	$1, -4(%rbp)
.L60:
	movq	-24(%rbp), %rax
	movl	4(%rax), %eax
	cmpl	%eax, -4(%rbp)
	jl	.L61
	movl	$10, %edi
	call	putchar@PLT
	addl	$1, -8(%rbp)
.L59:
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	cmpl	%eax, -8(%rbp)
	jl	.L62
	movl	$10, %edi
	call	putchar@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE17:
	.size	matrix_show, .-matrix_show
	.globl	householder
	.type	householder, @function
householder:
.LFB18:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$184, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movq	%rdi, -152(%rbp)
	movq	%rsi, -160(%rbp)
	movq	%rdx, -168(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	movq	%rsp, %rax
	movq	%rax, %r13
	movq	-152(%rbp), %rax
	movl	(%rax), %edx
	movslq	%edx, %rax
	subq	$1, %rax
	movq	%rax, -112(%rbp)
	movslq	%edx, %rax
	movq	%rax, %r8
	movl	$0, %r9d
	movslq	%edx, %rax
	movq	%rax, %rcx
	movl	$0, %ebx
	movslq	%edx, %rax
	leaq	0(,%rax,8), %rdx
	movl	$16, %eax
	subq	$1, %rax
	addq	%rdx, %rax
	movl	$16, %ebx
	movl	$0, %edx
	divq	%rbx
	imulq	$16, %rax, %rax
	movq	%rax, %rdx
	andq	$-4096, %rdx
	movq	%rsp, %rbx
	subq	%rdx, %rbx
	movq	%rbx, %rdx
.L64:
	cmpq	%rdx, %rsp
	je	.L65
	subq	$4096, %rsp
	orq	$0, 4088(%rsp)
	jmp	.L64
.L65:
	movq	%rax, %rdx
	andl	$4095, %edx
	subq	%rdx, %rsp
	movq	%rax, %rdx
	andl	$4095, %edx
	testq	%rdx, %rdx
	je	.L66
	andl	$4095, %eax
	subq	$8, %rax
	addq	%rsp, %rax
	orq	$0, (%rax)
.L66:
	movq	%rsp, %rax
	addq	$7, %rax
	shrq	$3, %rax
	salq	$3, %rax
	movq	%rax, -104(%rbp)
	movq	-152(%rbp), %rax
	movq	%rax, -120(%rbp)
	movl	$0, -132(%rbp)
	jmp	.L67
.L83:
	movq	%rsp, %rax
	movq	%rax, %r12
	movq	-152(%rbp), %rax
	movl	(%rax), %eax
	movslq	%eax, %rdx
	subq	$1, %rdx
	movq	%rdx, -96(%rbp)
	movslq	%eax, %rdx
	movq	%rdx, %r14
	movl	$0, %r15d
	movslq	%eax, %rdx
	movq	%rdx, -192(%rbp)
	movq	$0, -184(%rbp)
	cltq
	leaq	0(,%rax,8), %rdx
	movl	$16, %eax
	subq	$1, %rax
	addq	%rdx, %rax
	movl	$16, %ebx
	movl	$0, %edx
	divq	%rbx
	imulq	$16, %rax, %rax
	movq	%rax, %rdx
	andq	$-4096, %rdx
	movq	%rsp, %rbx
	subq	%rdx, %rbx
	movq	%rbx, %rdx
.L68:
	cmpq	%rdx, %rsp
	je	.L69
	subq	$4096, %rsp
	orq	$0, 4088(%rsp)
	jmp	.L68
.L69:
	movq	%rax, %rdx
	andl	$4095, %edx
	subq	%rdx, %rsp
	movq	%rax, %rdx
	andl	$4095, %edx
	testq	%rdx, %rdx
	je	.L70
	andl	$4095, %eax
	subq	$8, %rax
	addq	%rsp, %rax
	orq	$0, (%rax)
.L70:
	movq	%rsp, %rax
	addq	$7, %rax
	shrq	$3, %rax
	salq	$3, %rax
	movq	%rax, -88(%rbp)
	movq	-152(%rbp), %rax
	movl	(%rax), %eax
	movslq	%eax, %rdx
	subq	$1, %rdx
	movq	%rdx, -80(%rbp)
	movslq	%eax, %rdx
	movq	%rdx, -208(%rbp)
	movq	$0, -200(%rbp)
	movslq	%eax, %rdx
	movq	%rdx, -224(%rbp)
	movq	$0, -216(%rbp)
	cltq
	leaq	0(,%rax,8), %rdx
	movl	$16, %eax
	subq	$1, %rax
	addq	%rdx, %rax
	movl	$16, %esi
	movl	$0, %edx
	divq	%rsi
	imulq	$16, %rax, %rax
	movq	%rax, %rdx
	andq	$-4096, %rdx
	movq	%rsp, %rbx
	subq	%rdx, %rbx
	movq	%rbx, %rdx
.L71:
	cmpq	%rdx, %rsp
	je	.L72
	subq	$4096, %rsp
	orq	$0, 4088(%rsp)
	jmp	.L71
.L72:
	movq	%rax, %rdx
	andl	$4095, %edx
	subq	%rdx, %rsp
	movq	%rax, %rdx
	andl	$4095, %edx
	testq	%rdx, %rdx
	je	.L73
	andl	$4095, %eax
	subq	$8, %rax
	addq	%rsp, %rax
	orq	$0, (%rax)
.L73:
	movq	%rsp, %rax
	addq	$7, %rax
	shrq	$3, %rax
	salq	$3, %rax
	movq	%rax, -72(%rbp)
	movl	-132(%rbp), %edx
	movq	-120(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	matrix_minor
	movq	%rax, -64(%rbp)
	movq	-120(%rbp), %rax
	cmpq	-152(%rbp), %rax
	je	.L74
	movq	-120(%rbp), %rax
	movq	%rax, %rdi
	call	matrix_delete
.L74:
	movq	-64(%rbp), %rax
	movq	%rax, -120(%rbp)
	movl	-132(%rbp), %edx
	movq	-72(%rbp), %rcx
	movq	-120(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	mcol
	movq	-152(%rbp), %rax
	movl	(%rax), %edx
	movq	-72(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	vnorm
	movq	%xmm0, %rax
	movq	%rax, -128(%rbp)
	movq	-152(%rbp), %rax
	movq	8(%rax), %rax
	movl	-132(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-132(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movsd	(%rax), %xmm0
	pxor	%xmm1, %xmm1
	comisd	%xmm1, %xmm0
	jbe	.L75
	movsd	-128(%rbp), %xmm0
	movq	.LC4(%rip), %xmm1
	xorpd	%xmm1, %xmm0
	movsd	%xmm0, -128(%rbp)
.L75:
	movl	$0, -136(%rbp)
	jmp	.L77
.L80:
	movl	-136(%rbp), %eax
	cmpl	-132(%rbp), %eax
	jne	.L78
	movsd	.LC0(%rip), %xmm0
	jmp	.L79
.L78:
	pxor	%xmm0, %xmm0
.L79:
	movq	-88(%rbp), %rax
	movl	-136(%rbp), %edx
	movslq	%edx, %rdx
	movsd	%xmm0, (%rax,%rdx,8)
	addl	$1, -136(%rbp)
.L77:
	movq	-152(%rbp), %rax
	movl	(%rax), %eax
	cmpl	%eax, -136(%rbp)
	jl	.L80
	movq	-152(%rbp), %rax
	movl	(%rax), %eax
	movq	-88(%rbp), %rdx
	movq	-128(%rbp), %r8
	movq	-88(%rbp), %rsi
	movq	-72(%rbp), %rdi
	movl	%eax, %ecx
	movq	%r8, %xmm0
	call	vmadd
	movq	-152(%rbp), %rax
	movl	(%rax), %ebx
	movq	-152(%rbp), %rax
	movl	(%rax), %edx
	movq	-88(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	vnorm
	movq	-88(%rbp), %rcx
	movq	-88(%rbp), %rax
	movl	%ebx, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	vdiv
	movq	-152(%rbp), %rax
	movl	(%rax), %edx
	movq	-88(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	vmul
	movq	-104(%rbp), %rdx
	movl	-132(%rbp), %ecx
	movslq	%ecx, %rcx
	movq	%rax, (%rdx,%rcx,8)
	movq	-104(%rbp), %rax
	movl	-132(%rbp), %edx
	movslq	%edx, %rdx
	movq	(%rax,%rdx,8), %rax
	movq	-120(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	matrix_mul
	movq	%rax, -64(%rbp)
	movq	-120(%rbp), %rax
	cmpq	-152(%rbp), %rax
	je	.L81
	movq	-120(%rbp), %rax
	movq	%rax, %rdi
	call	matrix_delete
.L81:
	movq	-64(%rbp), %rax
	movq	%rax, -120(%rbp)
	movq	%r12, %rsp
	addl	$1, -132(%rbp)
.L67:
	movq	-152(%rbp), %rax
	movl	4(%rax), %eax
	cmpl	%eax, -132(%rbp)
	jge	.L82
	movq	-152(%rbp), %rax
	movl	(%rax), %eax
	subl	$1, %eax
	cmpl	%eax, -132(%rbp)
	jl	.L83
.L82:
	movq	-120(%rbp), %rax
	movq	%rax, %rdi
	call	matrix_delete
	movq	-104(%rbp), %rax
	movq	(%rax), %rdx
	movq	-168(%rbp), %rax
	movq	%rdx, (%rax)
	movq	-104(%rbp), %rax
	movq	(%rax), %rax
	movq	-152(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	matrix_mul
	movq	-160(%rbp), %rdx
	movq	%rax, (%rdx)
	movl	$1, -140(%rbp)
	jmp	.L84
.L87:
	movq	-168(%rbp), %rax
	movq	(%rax), %rdx
	movq	-104(%rbp), %rax
	movl	-140(%rbp), %ecx
	movslq	%ecx, %rcx
	movq	(%rax,%rcx,8), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	matrix_mul
	movq	%rax, -64(%rbp)
	cmpl	$1, -140(%rbp)
	jle	.L85
	movq	-168(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	matrix_delete
.L85:
	movq	-168(%rbp), %rax
	movq	-64(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-104(%rbp), %rax
	movl	-140(%rbp), %edx
	movslq	%edx, %rdx
	movq	(%rax,%rdx,8), %rax
	movq	%rax, %rdi
	call	matrix_delete
	addl	$1, -140(%rbp)
.L84:
	movq	-152(%rbp), %rax
	movl	4(%rax), %eax
	cmpl	%eax, -140(%rbp)
	jge	.L86
	movq	-152(%rbp), %rax
	movl	(%rax), %eax
	subl	$1, %eax
	cmpl	%eax, -140(%rbp)
	jl	.L87
.L86:
	movq	-104(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	matrix_delete
	movq	-168(%rbp), %rax
	movq	(%rax), %rax
	movq	-152(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	matrix_mul
	movq	%rax, -120(%rbp)
	movq	-160(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	matrix_delete
	movq	-160(%rbp), %rax
	movq	-120(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-168(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	matrix_transpose
	movq	%r13, %rsp
	nop
	movq	-56(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L88
	call	__stack_chk_fail@PLT
.L88:
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE18:
	.size	householder, .-householder
	.globl	converged
	.type	converged, @function
converged:
.LFB19:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, -8(%rbp)
	movq	-24(%rbp), %rax
	movl	4(%rax), %eax
	movl	%eax, -4(%rbp)
	movl	$0, -12(%rbp)
	jmp	.L91
.L94:
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movl	-12(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-12(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movsd	(%rax), %xmm0
	movq	-32(%rbp), %rax
	movq	8(%rax), %rax
	movl	-12(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-12(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movsd	(%rax), %xmm1
	subsd	%xmm1, %xmm0
	cvttsd2sil	%xmm0, %eax
	cltd
	xorl	%edx, %eax
	subl	%edx, %eax
	testl	%eax, %eax
	jle	.L92
	movl	$0, %eax
	jmp	.L93
.L92:
	addl	$1, -12(%rbp)
.L91:
	movl	-12(%rbp), %eax
	cmpl	-8(%rbp), %eax
	jl	.L94
	movl	$1, %eax
.L93:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE19:
	.size	converged, .-converged
	.globl	qr
	.type	qr, @function
qr:
.LFB20:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movq	%rdi, -72(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
.L96:
	leaq	-48(%rbp), %rdx
	leaq	-40(%rbp), %rcx
	movq	-72(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	householder
	movq	-48(%rbp), %rax
	movl	4(%rax), %edx
	movq	-48(%rbp), %rax
	movl	(%rax), %ecx
	movq	-48(%rbp), %rax
	movq	8(%rax), %rax
	movq	(%rax), %rax
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	matrix_copy
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	matrix_transpose
	movq	-72(%rbp), %rax
	movq	%rax, -24(%rbp)
	movq	-48(%rbp), %rdx
	movq	-72(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	matrix_mul
	movq	%rax, %rdx
	movq	-32(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	matrix_mul
	movq	%rax, -72(%rbp)
	movq	-24(%rbp), %rdx
	movq	-72(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	converged
	xorl	$1, %eax
	testb	%al, %al
	jne	.L96
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	matrix_delete
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	matrix_delete
	movq	-72(%rbp), %rax
	movl	4(%rax), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, -16(%rbp)
	movl	$0, -52(%rbp)
	jmp	.L97
.L98:
	movq	-72(%rbp), %rax
	movq	8(%rax), %rax
	movl	-52(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movl	-52(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rax, %rdx
	movl	-52(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rcx
	movq	-16(%rbp), %rax
	addq	%rcx, %rax
	movsd	(%rdx), %xmm0
	movsd	%xmm0, (%rax)
	addl	$1, -52(%rbp)
.L97:
	movq	-72(%rbp), %rax
	movl	4(%rax), %eax
	cmpl	%eax, -52(%rbp)
	jl	.L98
	movq	-16(%rbp), %rax
	movq	-8(%rbp), %rsi
	xorq	%fs:40, %rsi
	je	.L100
	call	__stack_chk_fail@PLT
.L100:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE20:
	.size	qr, .-qr
	.section	.rodata
.LC16:
	.string	"Eigen Values: "
.LC17:
	.string	"%lf "
	.align 8
.LC18:
	.string	"\nAbsolute value of the product: %lf\n"
.LC21:
	.string	"\nTime taken: %lf ms\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB21:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$192, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	call	clock@PLT
	movq	%rax, -176(%rbp)
	movsd	.LC0(%rip), %xmm0
	movsd	%xmm0, -144(%rbp)
	movsd	.LC5(%rip), %xmm0
	movsd	%xmm0, -136(%rbp)
	movsd	.LC6(%rip), %xmm0
	movsd	%xmm0, -128(%rbp)
	movsd	.LC7(%rip), %xmm0
	movsd	%xmm0, -120(%rbp)
	movsd	.LC0(%rip), %xmm0
	movsd	%xmm0, -112(%rbp)
	movsd	.LC8(%rip), %xmm0
	movsd	%xmm0, -104(%rbp)
	movsd	.LC9(%rip), %xmm0
	movsd	%xmm0, -96(%rbp)
	movsd	.LC10(%rip), %xmm0
	movsd	%xmm0, -88(%rbp)
	movsd	.LC0(%rip), %xmm0
	movsd	%xmm0, -80(%rbp)
	movsd	.LC6(%rip), %xmm0
	movsd	%xmm0, -72(%rbp)
	movsd	.LC11(%rip), %xmm0
	movsd	%xmm0, -64(%rbp)
	movsd	.LC12(%rip), %xmm0
	movsd	%xmm0, -56(%rbp)
	movsd	.LC0(%rip), %xmm0
	movsd	%xmm0, -48(%rbp)
	movsd	.LC13(%rip), %xmm0
	movsd	%xmm0, -40(%rbp)
	movsd	.LC14(%rip), %xmm0
	movsd	%xmm0, -32(%rbp)
	movsd	.LC15(%rip), %xmm0
	movsd	%xmm0, -24(%rbp)
	leaq	-144(%rbp), %rax
	movl	$4, %edx
	movl	$4, %esi
	movq	%rax, %rdi
	call	matrix_copy
	movq	%rax, -168(%rbp)
	movl	$4, -188(%rbp)
	movq	-168(%rbp), %rax
	movq	%rax, %rdi
	call	qr
	movq	%rax, -160(%rbp)
	leaq	.LC16(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movsd	.LC0(%rip), %xmm0
	movsd	%xmm0, -184(%rbp)
	movl	$0, -192(%rbp)
	jmp	.L102
.L103:
	movl	-192(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-160(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %xmm0
	leaq	.LC17(%rip), %rdi
	movl	$1, %eax
	call	printf@PLT
	movl	-192(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-160(%rbp), %rax
	addq	%rdx, %rax
	movsd	(%rax), %xmm0
	movsd	-184(%rbp), %xmm1
	mulsd	%xmm1, %xmm0
	movsd	%xmm0, -184(%rbp)
	addl	$1, -192(%rbp)
.L102:
	movl	-192(%rbp), %eax
	cmpl	-188(%rbp), %eax
	jl	.L103
	movsd	-184(%rbp), %xmm0
	cvttsd2sil	%xmm0, %eax
	cltd
	xorl	%edx, %eax
	subl	%edx, %eax
	cvtsi2sdl	%eax, %xmm0
	leaq	.LC18(%rip), %rdi
	movl	$1, %eax
	call	printf@PLT
	call	clock@PLT
	movq	%rax, -152(%rbp)
	movq	-152(%rbp), %rax
	subq	-176(%rbp), %rax
	cvtsi2sdq	%rax, %xmm1
	movsd	.LC19(%rip), %xmm0
	mulsd	%xmm1, %xmm0
	movsd	.LC20(%rip), %xmm1
	divsd	%xmm1, %xmm0
	leaq	.LC21(%rip), %rdi
	movl	$1, %eax
	call	printf@PLT
	movl	$0, %eax
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L105
	call	__stack_chk_fail@PLT
.L105:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE21:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC0:
	.long	0
	.long	1072693248
	.align 8
.LC1:
	.long	0
	.long	-1073741824
	.align 16
.LC4:
	.long	0
	.long	-2147483648
	.long	0
	.long	0
	.align 8
.LC5:
	.long	0
	.long	1073741824
	.align 8
.LC6:
	.long	0
	.long	1074790400
	.align 8
.LC7:
	.long	0
	.long	1075838976
	.align 8
.LC8:
	.long	0
	.long	1074266112
	.align 8
.LC9:
	.long	0
	.long	1075970048
	.align 8
.LC10:
	.long	0
	.long	1077608448
	.align 8
.LC11:
	.long	0
	.long	1076887552
	.align 8
.LC12:
	.long	0
	.long	1078984704
	.align 8
.LC13:
	.long	0
	.long	1075052544
	.align 8
.LC14:
	.long	0
	.long	1077477376
	.align 8
.LC15:
	.long	0
	.long	1079984128
	.align 8
.LC19:
	.long	0
	.long	1083129856
	.align 8
.LC20:
	.long	0
	.long	1093567616
	.ident	"GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:

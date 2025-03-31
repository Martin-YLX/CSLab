HNU1:
	leal	16(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.LC0, (%esp)
	call	scanf
HNU2:
	leal	20(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.LC0, (%esp)
	call	scanf
HNU3:
	movl	16(%esp), %ebx
	cmpl	20(%esp), %ebx
	jg	.L0
HNU4:
	jmp	.L1
.L0:
HNU5:
	movl	16(%esp), %eax
	movl	%eax, 24(%esp)
HNU6:
	jmp	.L2
.L1:
HNU7:
	movl	20(%esp), %eax
	movl	%eax, 24(%esp)
.L2:
HNU8:
	movl	24(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.LC1, (%esp)
	call	printf
HNU9:
	leave	
	ret	

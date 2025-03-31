HNU1:
	leal	16(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.LC0, (%esp)
	call	scanf
HNU2:
	movl	$0, 24(%esp)
HNU3:
	movl	16(%esp), %eax
	movl	%eax, 20(%esp)
.L2:
HNU4:
	movl	20(%esp), %ebx
	cmpl	$0, %ebx
	jg	.L0
HNU5:
	jmp	.L1
.L3:
HNU6:
	movl	20(%esp), %eax
	subl	$1, %eax
	movl	%eax, 20(%esp)
HNU7:
	jmp	.L2
.L0:
HNU8:
	movl	24(%esp), %edx
	addl	20(%esp), %edx
	movl	%edx, 28(%esp)
HNU9:
	movl	28(%esp), %eax
	movl	%eax, 24(%esp)
HNU10:
	jmp	.L3
.L1:
HNU11:
	movl	24(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$.LC1, (%esp)
	call	printf
HNU12:
	leave	
	ret	

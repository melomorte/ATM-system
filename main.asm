	.file	"main.c"
.globl _saldo
	.data
	.align 4
_saldo:
	.long	1101004800
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC0:
	.ascii "\11******MELOMORTE BANK******\0"
LC1:
	.ascii "Por Favor Insira sua senha: \0"
LC2:
	.ascii "%d\0"
LC3:
	.ascii "CLS\0"
LC4:
	.ascii "Senha Invalida!\0"
	.text
.globl _main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
	pushl	%ebp
	movl	%esp, %ebp
	andl	$-16, %esp
	subl	$32, %esp
	call	___main
	movl	$0, 28(%esp)
	movl	$LC0, (%esp)
	call	_puts
	movl	$LC1, (%esp)
	call	_printf
	leal	28(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC2, (%esp)
	call	_scanf
	movl	28(%esp), %eax
	cmpl	$4547, %eax
	jne	L2
	movl	$LC3, (%esp)
	call	_system
	call	_opc
	movl	$0, %eax
	leave
	ret
L2:
	movl	$LC3, (%esp)
	call	_system
	movl	$LC4, (%esp)
	call	_puts
	movl	$0, (%esp)
	call	_exit
	.section .rdata,"dr"
LC5:
	.ascii "Selecione uma Opc abaixo.\0"
	.align 4
LC6:
	.ascii "1 - Extrato Bancario.\12"
	.ascii "2 - Saque.\12"
	.ascii "3 - Transferir.\0"
	.text
.globl _opc
	.def	_opc;	.scl	2;	.type	32;	.endef
_opc:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$40, %esp
	movl	$0, -12(%ebp)
	movl	$LC0, (%esp)
	call	_puts
	movl	$LC5, (%esp)
	call	_puts
	movl	$LC6, (%esp)
	call	_puts
	leal	-12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC2, (%esp)
	call	_scanf
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_escolha
	movl	$0, (%esp)
	call	_exit
	.section .rdata,"dr"
LC7:
	.ascii "\11Extrato Bancario.\0"
LC8:
	.ascii "\11Saque.\12\0"
LC9:
	.ascii "\11Transferir.\12\0"
LC10:
	.ascii "Erro!\0"
	.text
.globl _escolha
	.def	_escolha;	.scl	2;	.type	32;	.endef
_escolha:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$24, %esp
	movl	8(%ebp), %eax
	cmpl	$2, %eax
	je	L9
	cmpl	$3, %eax
	je	L10
	cmpl	$1, %eax
	jne	L13
L8:
	movl	$LC3, (%esp)
	call	_system
	movl	$LC7, (%esp)
	call	_puts
	call	_extrato
	jmp	L11
L9:
	movl	$LC3, (%esp)
	call	_system
	movl	$LC8, (%esp)
	call	_puts
	call	_saque
	jmp	L11
L10:
	movl	$LC3, (%esp)
	call	_system
	movl	$LC9, (%esp)
	call	_puts
	call	_transferir
	jmp	L11
L13:
	movl	$LC3, (%esp)
	call	_system
	movl	$LC10, (%esp)
	call	_puts
	movl	$0, (%esp)
	call	_exit
L11:
	movl	$0, %eax
	leave
	ret
	.section .rdata,"dr"
LC11:
	.ascii "Seu Extrato.\12\0"
LC12:
	.ascii "data: %s\0"
LC13:
	.ascii "Nome do Titular: Melomorte\0"
LC14:
	.ascii "Tipo de Conta: Corrente\0"
LC15:
	.ascii "Seu Saldo Atual: %.3fR$\12\0"
	.text
.globl _extrato
	.def	_extrato;	.scl	2;	.type	32;	.endef
_extrato:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$40, %esp
	leal	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_time
	leal	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_localtime
	movl	%eax, -12(%ebp)
	movl	$LC11, (%esp)
	call	_puts
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_asctime
	movl	%eax, 4(%esp)
	movl	$LC12, (%esp)
	call	_printf
	movl	$LC13, (%esp)
	call	_puts
	movl	$LC14, (%esp)
	call	_puts
	flds	_saldo
	fstpl	4(%esp)
	movl	$LC15, (%esp)
	call	_printf
	leave
	ret
	.section .rdata,"dr"
LC18:
	.ascii "Saldo Atual: %.3fR$\12\0"
LC19:
	.ascii "Escoha um Valor para Sacar.\0"
LC20:
	.ascii "%f\0"
LC21:
	.ascii "Saldo Insuficiente!\0"
LC22:
	.ascii "Digite Novamente sua Senha: \0"
LC23:
	.ascii "Senha Incorreta!\0"
LC24:
	.ascii "Valor sacado: %.3fR$\12\0"
	.text
.globl _saque
	.def	_saque;	.scl	2;	.type	32;	.endef
_saque:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$40, %esp
	movl	$0x00000000, %eax
	movl	%eax, -12(%ebp)
	movl	$0x00000000, %eax
	movl	%eax, -16(%ebp)
	movl	$0, -20(%ebp)
	movl	_saldo, %eax
	movl	%eax, -12(%ebp)
	flds	-12(%ebp)
	fstpl	4(%esp)
	movl	$LC18, (%esp)
	call	_printf
	movl	$LC19, (%esp)
	call	_puts
	leal	-16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC20, (%esp)
	call	_scanf
	flds	_saldo
	flds	-12(%ebp)
	fucompp
	fnstsw	%ax
	andb	$69, %ah
	xorb	$64, %ah
	jne	L17
	flds	-16(%ebp)
	flds	-12(%ebp)
	fxch	%st(1)
	fucompp
	fnstsw	%ax
	testb	$69, %ah
	sete	%al
	testb	%al, %al
	je	L18
L17:
	movl	$LC21, (%esp)
	call	_puts
	movl	$0, (%esp)
	call	_exit
L18:
	movl	__imp___iob, %eax
	movl	%eax, (%esp)
	call	_fflush
	movl	$LC3, (%esp)
	call	_system
	movl	$LC22, (%esp)
	call	_printf
	leal	-20(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC2, (%esp)
	call	_scanf
	movl	-20(%ebp), %eax
	cmpl	$4547, %eax
	je	L19
	movl	$LC3, (%esp)
	call	_system
	movl	$LC23, (%esp)
	call	_puts
	movl	$0, (%esp)
	call	_exit
L19:
	movl	$7, (%esp)
	call	_putchar
	flds	-16(%ebp)
	flds	-12(%ebp)
	fsubp	%st, %st(1)
	fstps	-12(%ebp)
	flds	-16(%ebp)
	fstpl	4(%esp)
	movl	$LC24, (%esp)
	call	_printf
	flds	-12(%ebp)
	fstpl	4(%esp)
	movl	$LC18, (%esp)
	call	_printf
	leave
	ret
	.section .rdata,"dr"
	.align 4
LC25:
	.ascii "\12Escolha o Valor a ser Transferido: \0"
	.align 4
LC26:
	.ascii "\12Digite a Conta que ira Receber: \0"
LC27:
	.ascii "%6d\0"
LC28:
	.ascii "\12Digite sua Senha: \0"
LC29:
	.ascii "Transferido!\0"
LC30:
	.ascii "Conta: %d\12\0"
LC31:
	.ascii "Valor Transferido: %.3fR$\12\0"
	.text
.globl _transferir
	.def	_transferir;	.scl	2;	.type	32;	.endef
_transferir:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$40, %esp
	movl	$0, -24(%ebp)
	movl	_saldo, %eax
	movl	%eax, -12(%ebp)
	movl	$LC25, (%esp)
	call	_printf
	leal	-16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC20, (%esp)
	call	_scanf
	movl	$LC26, (%esp)
	call	_printf
	leal	-24(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC27, (%esp)
	call	_scanf
	flds	-16(%ebp)
	flds	-12(%ebp)
	fxch	%st(1)
	fucompp
	fnstsw	%ax
	testb	$69, %ah
	sete	%al
	testb	%al, %al
	je	L22
	movl	$LC3, (%esp)
	call	_system
	movl	$LC21, (%esp)
	call	_puts
	movl	$0, (%esp)
	call	_exit
L22:
	flds	-16(%ebp)
	flds	-12(%ebp)
	fsubp	%st, %st(1)
	fstps	-12(%ebp)
	movl	__imp___iob, %eax
	movl	%eax, (%esp)
	call	_fflush
	movl	$LC28, (%esp)
	call	_printf
	leal	-20(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC2, (%esp)
	call	_scanf
	movl	-20(%ebp), %eax
	cmpl	$4547, %eax
	je	L23
	movl	$LC4, (%esp)
	call	_puts
	movl	$0, (%esp)
	call	_exit
L23:
	movl	$LC3, (%esp)
	call	_system
	movl	$7, (%esp)
	call	_putchar
	movl	$LC29, (%esp)
	call	_puts
	movl	-24(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC30, (%esp)
	call	_printf
	flds	-16(%ebp)
	fstpl	4(%esp)
	movl	$LC31, (%esp)
	call	_printf
	flds	-12(%ebp)
	fstpl	4(%esp)
	movl	$LC18, (%esp)
	call	_printf
	leave
	ret
	.def	_time;	.scl	2;	.type	32;	.endef
	.def	_localtime;	.scl	2;	.type	32;	.endef
	.def	_asctime;	.scl	2;	.type	32;	.endef
	.def	_fflush;	.scl	2;	.type	32;	.endef
	.def	_scanf;	.scl	2;	.type	32;	.endef
	.def	_exit;	.scl	2;	.type	32;	.endef
	.def	_system;	.scl	2;	.type	32;	.endef
	.def	_putchar;	.scl	2;	.type	32;	.endef
	.def	_puts;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef

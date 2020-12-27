#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <time.h>

#define PASS 1111
float saldo = 20.000;

//declaração de funções.
int opc();
int escolha(int opcao);
void saque();
void extrato();
void transferir();

int main()
{
	int senha = 0;

	printf("\t******MELOMORTE BANK******\n");
	printf("Por Favor Insira sua senha: ");
	scanf("%d", &senha);

	if (senha == PASS)
	{
		system("CLS");
		opc();
	}
	else
	{
		system("CLS");
		printf("Senha Invalida!\n");
		exit(0);
	}

	return 0;
}

int opc()
{
	int opcao = 0;

	printf("\t******MELOMORTE BANK******\n");
	printf("Selecione uma Opc abaixo.\n");
	printf("1 - Extrato Bancario.\n2 - Saque.\n3 - Transferir.\n");
	scanf("%d", &opcao);

	do
	{
		escolha(opcao);
		exit(0);
	}while((opcao == 1) || (opcao == 2) || (opcao == 3));

	printf("Opc Invalida!\n");

	return(opcao);
}

int escolha(int opcao)
{
	switch(opcao)
	{
		case 1:
			system("CLS");
			printf("\tExtrato Bancario.\n");
			extrato();
			break;
		case 2:
			system("CLS");
			printf("\tSaque.\n\n");
			saque();
			break;
		case 3:
			system("CLS");
			printf("\tTransferir.\n\n");
			transferir();
			break;
		default:
			system("CLS");
			printf("Erro!\n");
			exit(0);
	}

	return(0);
}

void extrato()
{
	time_t rawtime;
    struct tm *info;
    time( &rawtime );
    info = localtime( &rawtime );
	
	printf("Seu Extrato.\n\n");
    printf("data: %s", asctime(info));
	printf("Nome do Titular: Melomorte\n");
    printf("Tipo de Conta: Corrente\n");
	printf("Seu Saldo Atual: %.3fR$\n", saldo);
}

void saque()
{	
	float valorAtual = 0;
	float valorSaq = 0;
	int confirm = 0;
	
	valorAtual = saldo;
	printf("Saldo Atual: %.3fR$\n", valorAtual);

	printf("Escoha um Valor para Sacar.\n");
	scanf("%f", &valorSaq);

	if((valorAtual != saldo) || (valorSaq > valorAtual))
	{
		printf("Saldo Insuficiente!\n");
		exit(0);
	}

	fflush(stdin);
	system("CLS");
	printf("Digite Novamente sua Senha: ");
	scanf("%d", &confirm);
	if (confirm != PASS)
	{
		system("CLS");
		printf("Senha Incorreta!\n");
		exit(0);
	}
	else
	{
		putchar(7);
		valorAtual = valorAtual - valorSaq;
		printf("Valor sacado: %.3fR$\n", valorSaq);

		printf("Saldo Atual: %.3fR$\n", valorAtual);	
	}
}

void transferir()
{
	float valorAtual;
	float valorTransferido;
	int senhaConfirme;
	int contaNumero = 0;

	valorAtual = saldo;

	printf("\nEscolha o Valor a ser Transferido: ");
	scanf("%f", &valorTransferido);
	printf("\nDigite a Conta que ira Receber: ");
	scanf("%6d", &contaNumero);

	if (valorTransferido > valorAtual)
	{
		system("CLS");
		printf("Saldo Insuficiente!\n");
		exit(0);
	}
	else
	{
		valorAtual = valorAtual - valorTransferido;
	}
	fflush(stdin);
	printf("\nDigite sua Senha: ");
	scanf("%d", &senhaConfirme);
	if (senhaConfirme != PASS)
	{
		printf("Senha Invalida!\n");
		exit(0);
	}
	else
	{
		system("CLS");
		putchar(7);
		printf("Transferido!\n");
		printf("Conta: %d\n", contaNumero);
		printf("Valor Transferido: %.3fR$\n", valorTransferido);
		printf("Saldo Atual: %.3fR$\n", valorAtual);
	}

}

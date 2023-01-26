
from conta import ContaCorrente

conta = ContaCorrente(numero = 256, titular = 'LUIGI', saldo = 0, limite = 1000)
#A variável é meu referencial, não a classe em sí.

# ela é um indereço de memória que aponta para a minha classe real
print('endereço de memória :', conta)


# como acessar um atributo através do objeto no main
# essa convensão significa que o atributo não deve ser acessado diretamente 
# objeto . _ NomeClasse_ _ atributo
print(f'O numero da conta é :{conta._ContaCorrente__numero}') # - > conta.atributo

# como executar um método do meu objeto
# objeto.método

conta.extrato()
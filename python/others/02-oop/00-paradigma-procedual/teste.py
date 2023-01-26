def cria_conta(número:int, titular:str, saldo:float, limite:float)->dict:
    conta = {
        'número': número,
        'titular': titular,
        'saldo': saldo,
        'limite': limite,
    }
    return conta


def deposita(conta, valor:float)->None:
    conta['saldo'] += valor


def saca(conta, valor:float)->None:
    conta['saldo'] -= valor


def extrato(conta)->dict:
    saldo = conta['saldo']
    print(f'seu saldo é de R$ {round(saldo, 2)}')


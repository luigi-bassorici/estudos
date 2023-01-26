class ContaCorrente:

    def __init__(self, numero:int, titular:str, saldo:float, limite:float) -> None:
        print(f'\n__init__() construiu o objeto em -> {self}\n')
        self.__numero = numero
        self.__titular = titular
        self.__saldo = saldo
        self.__limite = limite

    def extrato(self)->str:
        print(f'o seu saldo é de : R$ {self.__saldo}')
        return


    def deposita(self, valor:float):
        self.__saldo += valor
        return


    def saca(self, valor:float)->None:
        self.__saldo -= valor
        return
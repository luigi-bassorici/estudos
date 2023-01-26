from teste import cria_conta, deposita, saca, extrato
conta = cria_conta(12221, 'luigi', 123.45, 1000.50)

# sal do 123,45

deposita(conta, 1000)
saca(conta, 500)
extrato(conta)

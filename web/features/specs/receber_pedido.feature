#language :pt

@receber_pedidos
Funcionalidade: Receber pedido de locação
    Sendo uma anunciante que possue equipamentos cadastrados
    Desejo receber pedidos de locação
    Para que possa decidir se aprovo ou rejeito os pedidos

    Cenario: Receber pedido
        Dado que possuo um perfil de anuciante 'joaoanunciante@bol.com' e 'pwd123'
            E que possuo o seguinte anúncio cadastrado:
            | thumb     | trompete.jpg |
            | nome      | trompete     |
            | categoria | outros       |
            | preco     | 100          |
            E acesso o meu dashboard
        Quando 'marialocataria@bol.com' e 'pwd123' solicita a locação desse equipamento
        Então  devo ver a seguinte mensagem
            """
            marialocataria@bol.com deseja alugar o equipamento: trompete em: DATA_LOCACAO
            """
            E devo ver os links 'ACEITAR' e 'REJEITAR' no pedido


#language: pt


Funcionalidade: Remover anúncios
    Sendo um anunciante que possui um equipamento indesejado
    Quero poder remover o anúncio
    Para que posso manter meu dashboard atualizado

    Contexto: Login
        * Login com "Afragoso@hotmail.com" e "93080206"
    @remover_anuncios
    
    @curso
    Cenario: avanar curso

        Dado que estou na pagina do curso no sympla
        Quando marco a aula e clico proximo
        Então o curso é preenchido

    Cenario: Remover anúncio indesejado
        Dado que possua o seguinte anúncio indesejado:
            | thumb     | telecaster.jpg |
            | nome      | Telecaster     |
            | categoria | Cordas         |
            | preco     | 50             |
        Quando solicito a exclusão deste anúncio
            E confirmo a solicitação
        Então o anuncio não deve ser exibido no dashboard

    @desistir_delete
    Cenario: Desistir da exclusão do anúncio
        Dado que possua o seguinte anúncio indesejado:
            | thumb     | conga.jpg |
            | nome      | Conga     |
            | categoria | Outros    |
            | preco     | 100       |
        Quando solicito a exclusão deste anúncio
        Mas não confirmo a solicitação
        Então o anuncio ainda deve ser exibido no dashboard
#language: pt

Funcionalidade: Cadastro de Anúncios

    Sendo usuário cadastrado no Rocklov que possuí equipamentos musicais
    Quero cadastra meus equipamentos
    Para que eu possa disponibilizalos para locação
    
    Cenario: Novo equipo

        Dado que estão logado como "alex1354@gmail.com" e "93080206"
        E que acesso o formulário de cadastro de anúncios 
        E que possuo o seguinte equipamento:
            | thumb     | fender-sb.jpg |
            | nome      | Fender Strato |
            | categoria | Cordas        |
            | preco     | 200           |
        Quando submeto o cadastro desse item
        Então devo ver esse item no meu dashboard
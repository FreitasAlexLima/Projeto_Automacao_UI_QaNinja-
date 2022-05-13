#language: pt
@anuncio
Funcionalidade: Cadastro de Anúncios

    Sendo usuário cadastrado no Rocklov que possuí equipamentos musicais
    Quero cadastra meus equipamentos
    Para que eu possa disponibilizalos para locação

    Contexto: Login
        * Login com "alex1354@gmail.com" e "93080206"

    Cenario: Novo equipo

        Dado que acesso o formulário de cadastro de anúncios
            E que possuo o seguinte equipamento:
            | thumb     | fender-sb.jpg |
            | nome      | Fender Strato |
            | categoria | Cordas        |
            | preco     | 200           |
        Quando submeto o cadastro desse item
        Então devo ver esse item no meu dashboard

    @temp
    Esquema do Cenario: Tentativa de Cadastro de anúncios

        Dado que acesso o formulário de cadastro de anúncios
            E que possuo o seguinte equipamento:
            | thumb     | <foto>      |
            | nome      | <nome>      |
            | categoria | <categoria> |
            | preco     | <preco>     |
        Quando submeto o cadastro desse item
        Então a alerta exibido deve conter: "<saida>"

        Exemplos:
            | foto          | nome            | categoria | preco | saida                             |
            |               | Violão de nylon | Cordas    | 150   | Adicione uma foto no seu anúncio! |
            | clarinete.jpg | Clarinete       |           | 150   | Informe a categoria               |
            | mic.jpg       | Microfone       | Outros    |       | Informe o valor da diária         |
            | violino.jpg   |                 | Teclas    | 250   | Informe a descrição do anúncio!   |


#language: pt

Funcionalidade: Cadastro

    Sendo músico que possui equipamentos musicais
    Quero fazer o meu cadastro no Rocklov
    Para qual eu possa disponibilizá-los para locação

    @cadastro
    Cenario: realizar cadastro

        Dado que acesso a página de cadastro
        Quando submeto o seguinte formulário:
            | nome         | email                 | senha    |
            | Alex Freitas | AlexFreitas@gmail.com | 93080203 |
        Então sou redirecionado para o dashboard
        
    @cadastro1
    Esquema do Cenario: Tentativa de Cadastro
        Dado que acesso a página de cadastro
        Quando submeto o seguinte formulário:
            | nome         | email         | senha         |
            | <nome_imput> | <email_input> | <senha_input> |
        Então vejo a mensagem de alerta: "<menssagem_output>"

        Exemplos:

            | nome_imput   | email_input           | senha_input | menssagem_output                 |
            |              | AlexFreitas@gmail.com | alex123     | Oops. Informe seu nome completo! |
            | Alex Freitas |                       | alex123     | Oops. Informe um email válido!   |
            | Alex Freitas | Alexfreitas2gmail.com | alex213     | Oops. Informe um email válido!   |
            | Alex Freitas | Alexfreitas@gmail.com |             | Oops. Informe sua senha secreta! |

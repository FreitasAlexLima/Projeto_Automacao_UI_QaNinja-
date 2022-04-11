#language: pt

Funcionalidade: Login

    Sendo um usuário cadastrado
    Quero acessar o sistema da Rocklov
    que eu possa anunciar meus equipamentos musicais

    Cenario: Login do usuário

        Dado que acesso a página principal
        Quando submeto minhas credenciais "alexfreitas468@gmail.com" e "alex123"
        Então sou redirecionado para o dashboard

    Esquema do Cenario: Tentar Logar
        Dado que acesso a página principal
        Quando submeto minhas credenciais "<email_input>" e "<senha_input>"
        Então vejo a mensagem de alerta: "<menssagem_output>"

        Exemplos:
            | email_input              | senha_input | menssagem_output                 |
            | alexfreitas468@gmail.com | alex126     | Usuário e/ou senha inválidos.    |
            | alexfreitas@gmail.com    | alex123     | Usuário e/ou senha inválidos.    |
            | alexfreitas468gmail.com  | alex123     | Oops. Informe um email válido!   |
            |                          | alex123     | Oops. Informe um email válido!   |
            | alexfreitas468@gmail.com |             | Oops. Informe sua senha secreta! |
class Login_page
    include Capybara::DSL

    def open
        visit "/"
    end

    def with(email, password)
        find('#user_email').set email
        find("input[type=password]").set password
        click_button "Entrar"
    end

end

# utilizando o conceito de encapsulamento do OO, criamos classes para paginas de nossos testes
# criando funções que realizam tarefas mapeadas das telas (page object) 
# posteriormente criando defs mais robustas que não apenas mapeam os elementos da tela, mas realizam um conjunto de ações completas.(app actions)

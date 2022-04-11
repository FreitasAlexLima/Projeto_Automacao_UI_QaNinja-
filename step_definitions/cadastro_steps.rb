Dado('que acesso a página de cadastro') do
    visit "/signup"
end

Quando('submeto o seguinte formulário:') do |table|
    
    log table.hashes
    user = table.hashes.first # .first busca o primeiro elemento do arrays ([0])

    log user
    MongoDB.new.remove_user(user[:email])
    #utilizando o banco de dados mongoDB o metodo remove_user irá limpar o banco para que possamos utilizar  a mesma masssa de testes sempre
    find("#fullName").set user[:nome]
    find("#email").set user[:email]
    find("#password").set user[:senha]

    click_button "Cadastrar"
end

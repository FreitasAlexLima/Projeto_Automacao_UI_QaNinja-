Dado('que acesso a página de cadastro') do
    @signup.open
end

Quando('submeto o seguinte formulário:') do |table|
    log table.hashes
    user = table.hashes.first # .first busca o primeiro elemento do hash  ([0])
    MongoDB.new.remove_user(user[:email])#utilizando o banco de dados mongoDB o metodo remove_user irá limpar o banco para que possamos utilizar  a mesma masssa de testes sempre
    @signup.create(user)
end

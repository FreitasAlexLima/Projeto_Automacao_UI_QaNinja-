
Dado('Login com {string} e {string}') do |email, password|
    @email = email
    @login_page.open
    @login_page.with(email, password)
end
  
Dado('que acesso o formulário de cadastro de anúncios') do
    @dashpag.go_to_equipolist
end

Dado('que possuo o seguinte equipamento:') do |table|
    @equipo = table.rows_hash
    MongoDB.new.remove_equipo(@equipo[:nome],@email) # metodo para remover anuncio antes de realizar outro cadastros, considerando o id do usuario 
end
  
Quando('submeto o cadastro desse item') do
    @equipo_page.create(@equipo)
end
  
Então('devo ver esse item no meu dashboard') do
    expect(@dashpag.equipo_list).to have_content @equipo[:nome] # metodo HAVE_CONTENT (ESPERO QUE CONTENHA)
    expect(@dashpag.equipo_list).to have_content "R$#{@equipo[:preco]}/dia"
end

Então('a alerta exibido deve conter: {string}') do |expect_alert|
    expect(@alert.dark).to have_content expect_alert
end
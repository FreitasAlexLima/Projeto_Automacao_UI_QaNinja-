Dado('que estão logado como {string} e {string}') do |email, password|

    @email = email
    visit "/"
    find("input[placeholder='Seu e-email']").set email
    find("input[type=password]").set password

    click_button"Entrar"
end
  
Dado('que acesso o formulário de cadastro de anúncios') do
    click_button "Criar anúncio"
    expect(page).to have_css("#equipoForm")
end

Dado('que possuo o seguinte equipamento:') do |table|
    @anuncio = table.rows_hash
    MongoDB.new.remove_equipo(@anuncio[:nome],@email) 
    # metodo para remover anuncio antes de realizar outro cadastros, considerando o id do usuario
end
  
Quando('submeto o cadastro desse item') do

    thumb = Dir.pwd + "/features/support/fixtures/images/" + @anuncio[:thumb]

    find("#thumbnail input[type=file]", visible: false).set thumb

    find("input[placeholder$=equipamento]").set @anuncio[:nome]
    find("#category").find('option', text: @anuncio[:categoria]).select_option
    find("input[placeholder^='Valor']").set @anuncio[:preco]

    click_button "Cadastrar"
end
  
Então('devo ver esse item no meu dashboard') do
    anuncios = find(".equipo-list")
    expect(anuncios).to have_content @anuncio[:nome] # metodo HAVE_CONTENT (ESPERO QUE CONTENHA)
    expect(anuncios).to have_content "R$#{@anuncio[:preco]}/dia"
end
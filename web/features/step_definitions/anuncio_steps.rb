Dado("Login com {string} e {string}") do |email, password|
  @email = email
  @login_page.open
  @login_page.with(email, password)
  expect(@dashpag.on_dash?).to be true # checkpoint para acertificar que foi logado
end

Dado("que acesso o formulário de cadastro de anúncios") do
  @dashpag.go_to_equipolist
end

Dado("que possuo o seguinte equipamento:") do |table|
  @equipo = table.rows_hash
  MongoDB.new.remove_equipo(@equipo[:nome], @email) # metodo para remover anuncio antes de realizar outro cadastros, considerando o id do usuario
end

Quando("submeto o cadastro desse item") do
  @equipo_page.create(@equipo)
end

Então("devo ver esse item no meu dashboard") do
  expect(@dashpag.equipo_list).to have_content @equipo[:nome] # metodo HAVE_CONTENT (ESPERO QUE CONTENHA)
  expect(@dashpag.equipo_list).to have_content "R$#{@equipo[:preco]}/dia"
end

Então("a alerta exibido deve conter: {string}") do |expect_alert|
  expect(@alert.dark).to have_content expect_alert
end


# remover anuncios

Dado('que possua o seguinte anúncio indesejado:') do |table|
  user_id = page.execute_script("return localStorage.getItem('user')")
  thumbnail = File.open(File.join(Dir.pwd + "/features/support/fixtures/images", table.rows_hash[:thumb]), "rb")
  @equipo = {
    thumbnail: thumbnail,
    name: table.rows_hash[:nome],
    category: table.rows_hash[:categoria],
    price: table.rows_hash[:preco]
  }
  EquipoService.new.create(@equipo,user_id)
  visit current_path # refresh na pagina atual
end

Quando('solicito a exclusão deste anúncio') do
  @dashpag.delete_request(@equipo[:name])
  sleep 1 # think time
end

Quando('confirmo a solicitação') do
  @dashpag.confirm_delete
end

Então('o anuncio não deve ser exibido no dashboard') do
  expect(@dashpag.equipo_has_no_css?(@equipo[:name])).to be true
end

Quando('não confirmo a solicitação') do
  @dashpag.confirm_no_delete
end

Então('o anuncio ainda deve ser exibido no dashboard') do
  expect(@dashpag.equipo_has_css?(@equipo[:name])).to be true
end


# Dado('que estou na pagina do curso no sympla') do
  
#   visit 'https://www.sympla.com.br/login'
#   find('input[name="email"]').set 'alexfreitas468@gmail.com'
#   find('input[type="password"]').set 'Alex.9550'
#   click_button 'Login'
#   find(:xpath, '//*[@id="1553727"]/div/div/div[1]/div[1]/img').click
#   sleep 5
#   click_on 'Acessar conteúdo digital'
#   visit 'https://www.sympla.com.br/sympla-play/AEiZ8O9N62uZajAnKk9h87kkEwMwMTSuRPPqCGAYNOE'
#   click_on 'Continuar'
#    while page.has_text('Próximo item') == true
#     sleep 10
#     find('#nextItem').click
#    end
# end

# Dado('acesso a ultima') do
 
# end

# Quando('marco a aula e clico proximo') do
#   pending # Write code here that turns the phrase above into concrete actions
# end

# Então('o curso é preenchido') do
#   pending # Write code here that turns the phrase above into concrete actions
# end